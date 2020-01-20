package kh.picsell.service;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Base64Utils;
import org.springframework.web.multipart.MultipartFile;

import kh.picsell.dao.EditNoticeCommentDAO;
import kh.picsell.dao.EditNoticeDAO;
import kh.picsell.dao.EditNoticeFileDAO;
import kh.picsell.dao.EditSummernoteDAO;
import kh.picsell.dto.EditNoticeCommentDTO;
import kh.picsell.dto.EditNoticeDTO;
import kh.picsell.dto.EditNoticeFileDTO;
import kh.picsell.dto.PieceNoticeDTO;
import kh.picsell.dto.PieceNoticeFileDTO;

@Service
public class EditNoticeService {

	@Autowired
	private EditNoticeDAO dao;
	
	@Autowired
	private EditNoticeFileDAO fileDao;
	
	@Autowired
	private EditSummernoteDAO summernoteDao;
	
	@Autowired
	private EditNoticeCommentDAO commentDao;
	
	public List<EditNoticeDTO> noticeList() {
		List<EditNoticeDTO> editNoticeList = dao.selectAll();
		return editNoticeList;
	} 
	
	public void write(EditNoticeDTO editNoticeDto, EditNoticeFileDTO editFileDto, String file_path, String summernote_filePath) {

		File summernote_path = new File(summernote_filePath);  
		if(!summernote_path.exists()) {
			summernote_path.mkdir();
		} 

		Pattern p = Pattern.compile("<img.+?src=\"(.+?)\".+?data-filename=\"(.+?)\".*?>");
		Matcher m = p.matcher(editNoticeDto.getEditNotice_contents());
		List<String> summernoteFileList = new ArrayList<>();

		try {
			while(m.find()) {
				String oriName = m.group(2);
				String sysName = System.currentTimeMillis() + "_" + oriName;
				String imageString = m.group(1).split(",")[1];

				byte[] imgBytes = Base64Utils.decodeFromString(imageString);
				FileOutputStream fis = new FileOutputStream(summernote_path + "/" + sysName);
				DataOutputStream dos = new DataOutputStream(fis);
				dos.write(imgBytes);
				dos.flush();
				dos.close();
				editNoticeDto.setEditNotice_contents(editNoticeDto.getEditNotice_contents().replaceFirst(Pattern.quote(m.group(1)), "/editNotice_summernote_files/" + sysName));				
				summernoteFileList.add(sysName);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		dao.write(editNoticeDto);


		int noticeFile_parentSeq = dao.getParentSeq(editNoticeDto.getEditNotice_writer());

		for(String summernote_sysName : summernoteFileList) {
			summernoteDao.summernoteFile(noticeFile_parentSeq, summernote_sysName);
		}

		File filePath = new File(file_path);

		if(!filePath.exists()) {
			filePath.mkdir();
		}

		for(MultipartFile tmp : editFileDto.getEditNoticeFile_file()) {
			if(!tmp.isEmpty()) {
				String noticeFile_oriName = tmp.getOriginalFilename();
				String noticeFile_sysName = System.currentTimeMillis() + "_" + noticeFile_oriName;

				editFileDto.setEditNoticeFile_parentSeq(noticeFile_parentSeq);
				editFileDto.setEditNoticeFile_oriName(noticeFile_oriName);
				editFileDto.setEditNoticeFile_sysName(noticeFile_sysName);
				try {
					tmp.transferTo(new File(file_path + "/" + noticeFile_sysName));
					fileDao.fileUpload(editFileDto);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@Transactional("txManager")
	public Map detail(int editNotice_seq) {
		dao.viewCountUp(editNotice_seq);
		EditNoticeDTO editNotice = dao.detail(editNotice_seq);
		EditNoticeDTO beforeNotice = dao.previousRow(editNotice_seq);
		EditNoticeDTO afterNotice = dao.nextRow(editNotice_seq); 
		List<EditNoticeFileDTO> editFileDto = fileDao.selectAll(editNotice_seq);
		System.out.println("여기");
		System.out.println(editFileDto.size());
		List<EditNoticeCommentDTO> commentDto = commentDao.selectAll(editNotice_seq);

		Map map = new HashMap();
		map.put("editNotice", editNotice);
		map.put("beforeNotice", beforeNotice);
		map.put("afterNotice", afterNotice);
		map.put("editFileDto", editFileDto);
		map.put("commentDto", commentDto);
		return map;
	}
	
	@Transactional("txManager")
	public void delete(int editNotice_seq, String editFile_path, String editSummernote_filePath) {
		List<String> editFile_sysName = fileDao.getFileSysName(editNotice_seq);
		for(String sysName : editFile_sysName) {
			String editFilePath = editFile_path + "/" + sysName;
			File file = new File(editFilePath);
			while(file.exists()) {
				file.delete();
			}
		}
		List<String> editSummernoteFile_sysName = summernoteDao.getFileSysName(editNotice_seq);
		for(String sysName : editSummernoteFile_sysName) {
			String editSummernoteFilePath = editSummernote_filePath + "/" + sysName;
			File file = new File(editSummernoteFilePath);
			while(file.exists()) {
				file.delete();
			}
		}
		fileDao.delete(editNotice_seq);
		summernoteDao.delete(editNotice_seq);
		dao.delete(editNotice_seq);
	}
	
	public void deleteFile(int editNoticeseq ) {
		fileDao.deleteFile(editNoticeseq);
	}
	
	public void modify(EditNoticeDTO editNoticeDto, EditNoticeFileDTO editNoticeFileDto, String file_path, String summernote_filePath) {


		int editNoticeFile_parentSeq = editNoticeDto.getEditNotice_seq();

		File summernote_path = new File(summernote_filePath); 

		if(editNoticeDto.getEditNotice_contents().contains("base64")){
			Pattern p = Pattern.compile("<img.+?src=\"data:image\\/(jpeg|jpg|gif|png|PNG|JPEG);base64,(.+?)\".+?data-filename=\"(.+?)\".*?>");
			Matcher m = p.matcher(editNoticeDto.getEditNotice_contents());	
			List<String> summernoteFileList = new ArrayList<>();
			try {
				while(m.find()) {
					String oriName = m.group(3);
					String sysName = System.currentTimeMillis() + "_" + oriName;
					String imageString = m.group(2);
					byte[] imgBytes = Base64Utils.decodeFromString(imageString);
					FileOutputStream fis = new FileOutputStream(summernote_path + "/" + sysName);
					DataOutputStream dos = new DataOutputStream(fis);
					dos.write(imgBytes);
					dos.flush();
					dos.close();
					editNoticeDto.setEditNotice_contents(editNoticeDto.getEditNotice_contents().replaceFirst(Pattern.quote(m.group(2)), "/editNotice_summernote_files/" + sysName).replaceAll("data:image/(jpeg|jpg|gif|png|PNG|JPEG);base64,", ""));		
					summernoteFileList.add(sysName);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			for(String summernote_sysName : summernoteFileList) {
				if(!summernote_sysName.isEmpty()) {
					summernoteDao.summernoteFile(editNoticeFile_parentSeq, summernote_sysName);
				}
			}
		}
		dao.modify(editNoticeDto);
		File filePath = new File(file_path);

		for(MultipartFile tmp : editNoticeFileDto.getEditNoticeFile_file()) {
			if(!tmp.isEmpty()) {
				String editNoticeFile_oriName = tmp.getOriginalFilename();
				String editNoticeFile_sysName = System.currentTimeMillis() + "_" + editNoticeFile_oriName;

				editNoticeFileDto.setEditNoticeFile_parentSeq(editNoticeFile_parentSeq);
				editNoticeFileDto.setEditNoticeFile_oriName(editNoticeFile_oriName);
				editNoticeFileDto.setEditNoticeFile_sysName(editNoticeFile_sysName);

				try {
					tmp.transferTo(new File(file_path + "/" + editNoticeFile_sysName));
					fileDao.fileUpload(editNoticeFileDto);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
