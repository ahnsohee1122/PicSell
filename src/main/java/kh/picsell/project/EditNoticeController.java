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

import kh.picsell.dto.EditNoticeDTO;
import kh.picsell.dto.EditNoticeFileDTO;
import kh.picsell.dto.PieceNoticeDTO;
import kh.picsell.dto.PieceNoticeFileDTO;
import kh.picsell.service.EditNoticeService;

@Controller
@RequestMapping("/editNotice")
public class EditNoticeController {
	
	@Autowired
	private EditNoticeService editNoticeService;
	
	@Autowired HttpSession session;
	
	@RequestMapping("/notice.do")
	public String notice() {
		try {
			List<EditNoticeDTO> editNoticeList = editNoticeService.noticeList();
			session.setAttribute("editNoticeList", editNoticeList);
			return "editNotice/editNotice";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping("/noticeWrite.do")
	public String write_loginAop() {
		return "editNotice/editNoticeWrite";
	}
	
	@RequestMapping("/writeProc.do")
	public String writeProc_loginAop(EditNoticeDTO editNoticeDto, EditNoticeFileDTO editNoticeFileDto) {
		
		String nickName = "";
		if(session.getAttribute("loginInfo") != null) {
			nickName = (String)session.getAttribute("loginInfo");
		}else if(session.getAttribute("adminInfo") != null) {
			nickName = (String)session.getAttribute("adminInfo"); 
		}
		editNoticeDto.setEditNotice_writer(nickName);
		
		String file_path = session.getServletContext().getRealPath("/editNotice_files");
		String summernote_filePath = session.getServletContext().getRealPath("editNotice_summernote_files") ;

		try {
			editNoticeService.write(editNoticeDto, editNoticeFileDto, file_path, summernote_filePath);
			return "redirect:/editNotice/notice.do";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping("/detail.do")
	public String detail(int editNotice_seq) {
		try {
			Map map = editNoticeService.detail(editNotice_seq);
			session.setAttribute("map", map);
			return"editNotice/editNoticeView";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping("/fileDownLoad.do")
	public void fileDownLoad(String oriName, String sysName, HttpServletResponse response) {
		String path = session.getServletContext().getRealPath("editNotice_files");
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
	public String delete(int seq, String writer) {
		String user = (String)session.getAttribute("loginInfo");
		if(user.contentEquals(writer)) {
			String editFile_path = session.getServletContext().getRealPath("/editNotice_files");
			String editSummernote_filePath = session.getServletContext().getRealPath("/editNotice_summernote_files");
			
			editNoticeService.delete(seq, editFile_path, editSummernote_filePath);
			return "redirect:/editNotice/notice.do";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/modify.do")
	public String modify(int seq, String writer) {
		String user = (String)session.getAttribute("loginInfo");
		if(user.contentEquals(writer)) {
			try {
				Map map = editNoticeService.detail(seq);
				session.setAttribute("map", map);
				return "editNotice/editNoticeModify";
			}catch(Exception e) {
				e.printStackTrace();
				return "error";
			}	
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/modifyProc.do")
	public String modifyProc(String[] removeFileSeq, EditNoticeDTO editNoticeDto, EditNoticeFileDTO editNoticeFileDto, String writer) {
		String user = (String)session.getAttribute("loginInfo");
		if(user.contentEquals(writer)) {
			if(removeFileSeq != null){
				for(String fileSeq : removeFileSeq) {
					int seq = Integer.parseInt(fileSeq);
					editNoticeService.deleteFile(seq);
				}
			}

			String file_path = session.getServletContext().getRealPath("/editNotice_files");
			String summernote_filePath = session.getServletContext().getRealPath("editNotice_summernote_files") ;
			editNoticeService.modify(editNoticeDto, editNoticeFileDto, file_path, summernote_filePath);
			return "redirect:notice.do";	
		}else {
			return "error";
		}
	}
}
