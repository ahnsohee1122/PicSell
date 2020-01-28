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

import kh.picsell.dto.NoticeDTO;
import kh.picsell.dto.NoticeFileDTO;
import kh.picsell.dto.PieceNoticeDTO;
import kh.picsell.dto.PieceNoticeFileDTO;
import kh.picsell.service.PieceNoticeService;

@Controller
@RequestMapping("/pieceNotice")
public class PieceNoticeController {

	@Autowired
	private PieceNoticeService pieceNoticeService;

	@Autowired
	private HttpSession session;
	
	@RequestMapping("/notice.do")
	public String notice() {
		try {
			List<PieceNoticeDTO> pieceNoticeList = pieceNoticeService.noticeList();
			session.setAttribute("pieceNoticeList", pieceNoticeList);
			return "pieceNotice/pieceNotice";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping("/noticeWrite.do")
	public String write_loginAop() {
	
			return "pieceNotice/pieceNoticeWrite";
	}
	
	@RequestMapping("/writeProc.do")
	public String writeProc_loginAop(PieceNoticeDTO pieceNoticeDto, PieceNoticeFileDTO pieceNoticeFileDto) {
		String nickName = "";
		if(session.getAttribute("loginInfo") != null) {
			nickName = (String)session.getAttribute("loginInfo");
		}else if(session.getAttribute("adminInfo") != null) {
			nickName = (String)session.getAttribute("adminInfo"); 
		}
		
		pieceNoticeDto.setPieceNotice_writer(nickName);
		
		String file_path = session.getServletContext().getRealPath("/pieceNotice_files");
		String summernote_filePath = session.getServletContext().getRealPath("pieceNotice_summernote_files") ;

		try {
			pieceNoticeService.write(pieceNoticeDto, pieceNoticeFileDto, file_path, summernote_filePath);
			return "redirect:/pieceNotice/notice.do";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping("/detail.do")
	public String detail(int pieceNotice_seq) {
		try {
			Map map = pieceNoticeService.detail(pieceNotice_seq);
			session.setAttribute("map", map);
			return"pieceNotice/pieceNoticeView";
		}catch(Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping("/fileDownLoad.do")
	public void fileDownLoad(String oriName, String sysName, HttpServletResponse response) {
		String path = session.getServletContext().getRealPath("pieceNotice_files");
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
		String admin = (String)session.getAttribute("adminInfo");
		if(((user != null)&&(writer.contentEquals(user))) || (admin != null)) {
			String pieceFile_path = session.getServletContext().getRealPath("/pieceNotice_files");
			String pieceSummernote_filePath = session.getServletContext().getRealPath("/pieceNotice_summernote_files");
			
			pieceNoticeService.delete(seq, pieceFile_path, pieceSummernote_filePath);
			return "redirect:/pieceNotice/notice.do";
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/modify.do")
	public String modify(int seq, String writer) {
		String user = (String)session.getAttribute("loginInfo");
		String admin = (String)session.getAttribute("adminInfo");
		if(((user != null)&&(writer.contentEquals(user))) || (admin != null)) {
			try {
				Map map = pieceNoticeService.detail(seq);
				session.setAttribute("map", map);
				return "pieceNotice/pieceNoticeModify";
			}catch(Exception e) {
				e.printStackTrace();
				return "error";
			}
		}else {
			return "error";
		}
	}
	
	@RequestMapping("/modifyProc.do")
	public String modifyProc(String[] removeFileSeq, PieceNoticeDTO pieceNoticeDto, PieceNoticeFileDTO pieceNoticeFileDto, String writer) {
		String user = (String)session.getAttribute("loginInfo");
		String admin = (String)session.getAttribute("adminInfo");
		if(((user != null)&&(writer.contentEquals(user))) || (admin != null)) {
			if(removeFileSeq != null){
				for(String fileSeq : removeFileSeq) {
					int seq = Integer.parseInt(fileSeq);
					pieceNoticeService.deleteFile(seq);
				}
			}

			String file_path = session.getServletContext().getRealPath("/pieceNotice_files");
			String summernote_filePath = session.getServletContext().getRealPath("pieceNotice_summernote_files") ;
			pieceNoticeService.modify(pieceNoticeDto, pieceNoticeFileDto, file_path, summernote_filePath);
			return "redirect:notice.do";	
		}else {
			return "error";
		}
	}
}
