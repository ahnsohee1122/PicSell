package kh.picsell.project;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kh.picsell.dto.EditNoticeCommentDTO;
import kh.picsell.dto.PieceNoticeCommentDTO;
import kh.picsell.service.EditCommentService;

@Controller
@RequestMapping("/editComment")
public class EditCommentController {

	@Autowired
	private EditCommentService editCommentService;
	
	private EditNoticeCommentDTO commentDto;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="/commentDelete.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String commentDelete(int comment_seq, String writer) {
		String user = (String)session.getAttribute("loginInfo");
		String admin = (String)session.getAttribute("adminInfo");
		if(((user != null)&&(writer.contentEquals(user))) || (admin != null)) {
		editCommentService.commentDelete(comment_seq);
		return "삭제 성공";
		}else {
			return "redirect:/error";
		}
	}
	
	@RequestMapping(value="/commentWrite.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String commentWrite(int editNotice_seq, String writer, String comment) {
		System.out.println("1" + comment );
		editCommentService.commentWrite(editNotice_seq, writer, comment);
		
		int comment_seq = editCommentService.getCommetSeq(editNotice_seq,writer);
		EditNoticeCommentDTO dto = editCommentService.commentSelect(comment_seq);
		
		String data = null;
		JSONObject obj = new JSONObject(dto);
		try {
			data = obj.toString();
		} catch (Exception e) {
			System.out.println("first() mapper   ::    " + e.getMessage());
		}
		return data;
	}
	
	@RequestMapping(value="/commentModify.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String commentModify(int comment_seq, String comment) {
		editCommentService.commentModify(comment_seq, comment);
		return "완료";
	}
}