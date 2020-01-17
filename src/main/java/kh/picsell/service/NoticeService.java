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

import kh.picsell.dao.NoticeDAO;
import kh.picsell.dao.NoticeFileDAO;
import kh.picsell.dao.SummernoteDAO;
import kh.picsell.dto.NoticeDTO;
import kh.picsell.dto.NoticeFileDTO;

@Service
public class NoticeService {
	@Autowired
	private NoticeDAO dao;

	@Autowired
	private NoticeFileDAO fileDao;

	@Autowired
	private SummernoteDAO summernoteDao;

	public List<NoticeDTO> noticeList() {
		List<NoticeDTO> noticeList = dao.selectAll();
		return noticeList;
	}

	@Transactional("txManager")
	public Map detail(int notice_seq) {
		dao.viewCountUp(notice_seq);
		NoticeDTO notice = dao.detail(notice_seq);
		NoticeDTO beforeNotice = dao.previousRow(notice_seq);
		NoticeDTO afterNotice = dao.nextRow(notice_seq);
		List<NoticeFileDTO> fileDto = fileDao.selectAll(notice_seq);

		Map map = new HashMap();
		map.put("notice", notice);
		map.put("beforeNotice", beforeNotice);
		map.put("afterNotice", afterNotice);
		map.put("fileDto", fileDto);
		return map;
	}

	public void write(NoticeDTO noticeDto, NoticeFileDTO fileDto, String file_path, String summernote_filePath) {

		File summernote_path = new File(summernote_filePath);  
		System.out.println(noticeDto.getNotice_contents());
		if(!summernote_path.exists()) {
			summernote_path.mkdir();
		} 

		Pattern p = Pattern.compile("<img.+?src=\"(.+?)\".+?data-filename=\"(.+?)\".*?>");
		Matcher m = p.matcher(noticeDto.getNotice_contents());
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
				noticeDto.setNotice_contents(noticeDto.getNotice_contents().replaceFirst(Pattern.quote(m.group(1)), "/notice_summernote_files/" + sysName));				
				summernoteFileList.add(sysName);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		dao.write(noticeDto);


		int noticeFile_parentSeq = dao.getParentSeq(noticeDto.getNotice_writer());

		for(String summernote_sysName : summernoteFileList) {
			summernoteDao.summernoteFile(noticeFile_parentSeq, summernote_sysName);
		}

		File filePath = new File(file_path);

		if(!filePath.exists()) {
			filePath.mkdir();
		}

		for(MultipartFile tmp : fileDto.getNoticeFile_file()) {
			if(!tmp.isEmpty()) {
				String noticeFile_oriName = tmp.getOriginalFilename();
				String noticeFile_sysName = System.currentTimeMillis() + "_" + noticeFile_oriName;

				fileDto.setNoticeFile_parentSeq(noticeFile_parentSeq);
				fileDto.setNoticeFile_oriName(noticeFile_oriName);
				fileDto.setNoticeFile_sysName(noticeFile_sysName);
				try {
					tmp.transferTo(new File(file_path + "/" + noticeFile_sysName));
					fileDao.fileUpload(fileDto);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Transactional("txManager")
	public void delete(int notice_seq, String file_path, String summernote_filePath) {
		List<String> file_sysName = fileDao.getFileSysName(notice_seq);
		for(String sysName : file_sysName) {
			String filePath = file_path + "/" + sysName;
			File file = new File(filePath);
			while(file.exists()) {
				file.delete();
			}
		}

		List<String> summernoteFile_sysName = summernoteDao.getFileSysName(notice_seq);
		for(String sysName : summernoteFile_sysName) {
			String summernoteFilePath = summernote_filePath + "/" + sysName;
			File file = new File(summernoteFilePath);
			while(file.exists()) {
				file.delete();
			}
		}
		fileDao.delete(notice_seq);
		summernoteDao.delete(notice_seq);
		dao.delete(notice_seq);
	}

	public void deleteFile(int seq ) {
		fileDao.deleteFile(seq);
	}

	public void modify(NoticeDTO noticeDto, NoticeFileDTO fileDto, String file_path, String summernote_filePath) {

		
		int noticeFile_parentSeq = noticeDto.getNotice_seq();

		File summernote_path = new File(summernote_filePath); 

		if(noticeDto.getNotice_contents().contains("base64")){
			Pattern p = Pattern.compile("<img.+?src=\"data:image\\/(jpeg|jpg|gif|png|PNG|JPEG);base64,(.+?)\".+?data-filename=\"(.+?)\".*?>");
			Matcher m = p.matcher(noticeDto.getNotice_contents());	
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
					noticeDto.setNotice_contents(noticeDto.getNotice_contents().replaceFirst(Pattern.quote(m.group(2)), "/notice_summernote_files/" + sysName).replaceAll("data:image/(jpeg|jpg|gif|png|PNG|JPEG);base64,", ""));		
					summernoteFileList.add(sysName);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			for(String summernote_sysName : summernoteFileList) {
				if(!summernote_sysName.isEmpty()) {
					summernoteDao.summernoteFile(noticeFile_parentSeq, summernote_sysName);
				}
			}
		}
		dao.modify(noticeDto);
		File filePath = new File(file_path);

		for(MultipartFile tmp : fileDto.getNoticeFile_file()) {
			if(!tmp.isEmpty()) {
				String noticeFile_oriName = tmp.getOriginalFilename();
				String noticeFile_sysName = System.currentTimeMillis() + "_" + noticeFile_oriName;

				fileDto.setNoticeFile_parentSeq(noticeFile_parentSeq);
				fileDto.setNoticeFile_oriName(noticeFile_oriName);
				fileDto.setNoticeFile_sysName(noticeFile_sysName);

				try {
					tmp.transferTo(new File(file_path + "/" + noticeFile_sysName));
					fileDao.fileUpload(fileDto);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}



