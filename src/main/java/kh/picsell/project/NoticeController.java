package kh.picsell.project;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.picsell.dto.NoticeDTO;
import kh.picsell.dto.NoticeFileDTO;
import kh.picsell.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@Autowired
	private HttpSession session;

	ModelAndView mav = new ModelAndView();

	@RequestMapping("/notice.do")
	public String notice() {
		try {
			List<NoticeDTO> noticeList = noticeService.noticeList();
			session.setAttribute("noticeList", noticeList);
			return "notice/notice";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@RequestMapping("/detail.do")
	public String detail(int notice_seq) {

		try {
			Map map = noticeService.detail(notice_seq);
			session.setAttribute("map", map);
			return "notice/noticeView";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@RequestMapping("/noticeWrite.do")
	public String write_adminAop() {
		try {
			return "notice/noticeWrite";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	@RequestMapping("/writeProc.do")
	public String writeProc_adminAop(NoticeDTO noticeDto, NoticeFileDTO noticeFileDto) {
		String nickName = (String)session.getAttribute("adminInfo");
		noticeDto.setNotice_writer(nickName);
		String file_path = session.getServletContext().getRealPath("/notice_files");
		String summernote_filePath = session.getServletContext().getRealPath("notice_summernote_files") ;

		try {
			noticeService.write(noticeDto, noticeFileDto, file_path, summernote_filePath);
			return "redirect:/notice/notice.do";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	@RequestMapping("/fileDownLoad.do")
	public void fileDownLoad(String oriName, String sysName, HttpServletResponse response) {
		String path = session.getServletContext().getRealPath("/notice_files");
		String fullPath = path + "/" + sysName;
		File file = new File(fullPath);

		try(
				FileInputStream fis = new FileInputStream(file);
				DataInputStream fileDis = new DataInputStream(fis);
				ServletOutputStream sos = response.getOutputStream();
				){
			byte[] fileContents = new byte[(int)file.length()];
			fileDis.readFully(fileContents);

			response.setContentType("application/octet-stream");
			String encFileName = new String(oriName.getBytes("utf8"),"iso-8859-1");
			response.setHeader("Content-Disposition", "attatchment; filename=\""+encFileName+"\"");
			response.setHeader("Content-Length", String.valueOf(file.length()));

			sos.write(fileContents);
			sos.flush();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/delete.do")
	public String delete_adminAop(int seq) {
		String file_path = session.getServletContext().getRealPath("/notice_files");
		String summernote_filePath = session.getServletContext().getRealPath("notice_summernote_files") ;
		noticeService.delete(seq, file_path, summernote_filePath);
		return "redirect:/notice/notice.do";
	}

	@RequestMapping("/modify.do")
	public String modify_adminAop(int seq) {

		try {
			Map map = noticeService.detail(seq);
			System.out.println(map.get("fileDto").toString());
			session.setAttribute("map", map);
			return "notice/modify";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@RequestMapping("/modifyProc.do")
	public String modifyProc_adminAop(String[] removeFileSeq, NoticeDTO noticeDto, NoticeFileDTO noticeFileDto) {
		if(removeFileSeq != null){
			for(String fileSeq : removeFileSeq) {
				int seq = Integer.parseInt(fileSeq);
				System.out.println(seq);
				noticeService.deleteFile(seq);
			}
		}

		String file_path = session.getServletContext().getRealPath("/notice_files");
		String summernote_filePath = session.getServletContext().getRealPath("notice_summernote_files") ;
		noticeService.modify(noticeDto, noticeFileDto, file_path, summernote_filePath);
		return "redirect:notice.do";
	}


}
