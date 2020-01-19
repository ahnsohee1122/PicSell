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

import kh.picsell.dao.PieceNoticeCommentDAO;
import kh.picsell.dao.PieceNoticeDAO;
import kh.picsell.dao.PieceNoticeFileDAO;
import kh.picsell.dao.PieceSummernoteDAO;
import kh.picsell.dto.PieceNoticeCommentDTO;
import kh.picsell.dto.PieceNoticeDTO;
import kh.picsell.dto.PieceNoticeFileDTO;

@Service
public class PieceNoticeService {

	@Autowired
	private PieceNoticeDAO dao;

	@Autowired
	private PieceNoticeFileDAO fileDao;

	@Autowired
	private PieceSummernoteDAO summernoteDao;
	
	@Autowired
	private PieceNoticeCommentDAO commentDao;

	public List<PieceNoticeDTO> noticeList() {
		List<PieceNoticeDTO> pieceNoticeList = dao.selectAll();
		return pieceNoticeList;
	} 

	public void write(PieceNoticeDTO pieceNoticeDto, PieceNoticeFileDTO pieceFileDto, String file_path, String summernote_filePath) {

		File summernote_path = new File(summernote_filePath);  
		if(!summernote_path.exists()) {
			summernote_path.mkdir();
		} 

		Pattern p = Pattern.compile("<img.+?src=\"(.+?)\".+?data-filename=\"(.+?)\".*?>");
		Matcher m = p.matcher(pieceNoticeDto.getPieceNotice_contents());
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
				pieceNoticeDto.setPieceNotice_contents(pieceNoticeDto.getPieceNotice_contents().replaceFirst(Pattern.quote(m.group(1)), "/pieceNotice_summernote_files/" + sysName));				
				summernoteFileList.add(sysName);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		dao.write(pieceNoticeDto);


		int noticeFile_parentSeq = dao.getParentSeq(pieceNoticeDto.getPieceNotice_writer());

		for(String summernote_sysName : summernoteFileList) {
			summernoteDao.summernoteFile(noticeFile_parentSeq, summernote_sysName);
		}

		File filePath = new File(file_path);

		if(!filePath.exists()) {
			filePath.mkdir();
		}

		for(MultipartFile tmp : pieceFileDto.getPieceNoticeFile_file()) {
			if(!tmp.isEmpty()) {
				String noticeFile_oriName = tmp.getOriginalFilename();
				String noticeFile_sysName = System.currentTimeMillis() + "_" + noticeFile_oriName;

				pieceFileDto.setPieceNoticeFile_parentSeq(noticeFile_parentSeq);
				pieceFileDto.setPieceNoticeFile_oriName(noticeFile_oriName);
				pieceFileDto.setPieceNoticeFile_sysName(noticeFile_sysName);
				try {
					tmp.transferTo(new File(file_path + "/" + noticeFile_sysName));
					fileDao.fileUpload(pieceFileDto);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Transactional("txManager")
	public Map detail(int pieceNotice_seq) {
		dao.viewCountUp(pieceNotice_seq);
		PieceNoticeDTO pieceNotice = dao.detail(pieceNotice_seq);
		PieceNoticeDTO beforeNotice = dao.previousRow(pieceNotice_seq);
		PieceNoticeDTO afterNotice = dao.nextRow(pieceNotice_seq); 
		List<PieceNoticeFileDTO> pieceFileDto = fileDao.selectAll(pieceNotice_seq);
		List<PieceNoticeCommentDTO> commentDto = commentDao.selectAll(pieceNotice_seq);
		System.out.println(commentDto.size());
		Map map = new HashMap();
		map.put("pieceNotice", pieceNotice);
		map.put("beforeNotice", beforeNotice);
		map.put("afterNotice", afterNotice);
		map.put("pieceFileDto", pieceFileDto);
		map.put("commentDto", commentDto);
		return map;
	}

	@Transactional("txManager")
	public void delete(int pieceNotice_seq, String pieceFile_path, String pieceSummernote_filePath) {
		List<String> pieceFile_sysName = fileDao.getFileSysName(pieceNotice_seq);
		for(String sysName : pieceFile_sysName) {
			String pieceFilePath = pieceFile_path + "/" + sysName;
			File file = new File(pieceFilePath);
			while(file.exists()) {
				file.delete();
			}
		}
		List<String> pieceSummernoteFile_sysName = summernoteDao.getFileSysName(pieceNotice_seq);
		for(String sysName : pieceSummernoteFile_sysName) {
			String pieceSummernoteFilePath = pieceSummernote_filePath + "/" + sysName;
			System.out.println(pieceSummernoteFilePath);
			File file = new File(pieceSummernoteFilePath);
			while(file.exists()) {
				file.delete();
			}
		}
		fileDao.delete(pieceNotice_seq);
		summernoteDao.delete(pieceNotice_seq);
		dao.delete(pieceNotice_seq);
	}

	public void deleteFile(int pieceNoticeseq ) {
		fileDao.deleteFile(pieceNoticeseq);
	//	List<String> pieceFile_sysName = fileDao.getFileSysName(pieceNoticeseq);
//		for(String sysName : pieceFile_sysName) {
//			String pieceFilePath = pieceFile_path + "/" + sysName;
//			File file = new File(pieceFilePath);
//			while(file.exists()) {
//				file.delete();
//			}
//		}
	}

	public void modify(PieceNoticeDTO pieceNoticeDto, PieceNoticeFileDTO pieceNoticeFileDto, String file_path, String summernote_filePath) {


		int pieceNoticeFile_parentSeq = pieceNoticeDto.getPieceNotice_seq();

		File summernote_path = new File(summernote_filePath); 

		if(pieceNoticeDto.getPieceNotice_contents().contains("base64")){
			Pattern p = Pattern.compile("<img.+?src=\"data:image\\/(jpeg|jpg|gif|png|PNG|JPEG);base64,(.+?)\".+?data-filename=\"(.+?)\".*?>");
			Matcher m = p.matcher(pieceNoticeDto.getPieceNotice_contents());	
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
					pieceNoticeDto.setPieceNotice_contents(pieceNoticeDto.getPieceNotice_contents().replaceFirst(Pattern.quote(m.group(2)), "/pieceNotice_summernote_files/" + sysName).replaceAll("data:image/(jpeg|jpg|gif|png|PNG|JPEG);base64,", ""));		
					summernoteFileList.add(sysName);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			for(String summernote_sysName : summernoteFileList) {
				if(!summernote_sysName.isEmpty()) {
					summernoteDao.summernoteFile(pieceNoticeFile_parentSeq, summernote_sysName);
				}
			}
		}
		dao.modify(pieceNoticeDto);
		File filePath = new File(file_path);

		for(MultipartFile tmp : pieceNoticeFileDto.getPieceNoticeFile_file()) {
			if(!tmp.isEmpty()) {
				String pieceNoticeFile_oriName = tmp.getOriginalFilename();
				String pieceNoticeFile_sysName = System.currentTimeMillis() + "_" + pieceNoticeFile_oriName;

				pieceNoticeFileDto.setPieceNoticeFile_parentSeq(pieceNoticeFile_parentSeq);
				pieceNoticeFileDto.setPieceNoticeFile_oriName(pieceNoticeFile_oriName);
				pieceNoticeFileDto.setPieceNoticeFile_sysName(pieceNoticeFile_sysName);

				try {
					tmp.transferTo(new File(file_path + "/" + pieceNoticeFile_sysName));
					fileDao.fileUpload(pieceNoticeFileDto);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}

