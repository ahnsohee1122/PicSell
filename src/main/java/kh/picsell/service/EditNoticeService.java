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
		List<EditNoticeCommentDTO> commentDto = commentDao.selectAll(editNotice_seq);

		Map map = new HashMap();
		map.put("editNotice", editNotice);
		map.put("beforeNotice", beforeNotice);
		map.put("afterNotice", afterNotice);
		map.put("editFileDto", editFileDto);
		map.put("commentDto", commentDto);
		return map;
	}
}
