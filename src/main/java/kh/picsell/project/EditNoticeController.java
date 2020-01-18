package kh.picsell.project;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.picsell.dto.EditNoticeDTO;
import kh.picsell.dto.EditNoticeFileDTO;
import kh.picsell.service.EditNoticeService;

@Controller
@RequestMapping
public class EditNoticeController {
	
	@Autowired
	private EditNoticeService editNoticeService;
	
	@Autowired HttpSession session;
	
	@RequestMapping("/Notice.do")
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
	public String write() {
		return "editNotice/editNoticeWrite";

	}
	
	@RequestMapping("/writeProc.do")
	public String writeProc(EditNoticeDTO editNoticeDto, EditNoticeFileDTO editNoticeFileDto) {
		
		String nickName = "a123";
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
}
