package kh.picsell.project;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonObject;

import kh.picsell.dto.PieceNoticeCommentDTO;
import kh.picsell.service.PieceCommentService;

@Controller
@RequestMapping("/pieceComment")
public class PieceCommentController {

	@Autowired
	private PieceCommentService pieceCommentService;

	private PieceNoticeCommentDTO commentDto;

	@Autowired
	private HttpSession session;

	@RequestMapping(value="/commentDelete.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String commentDelete(int comment_seq, String writer) {
		String user = (String)session.getAttribute("loginInfo");
		String admin = (String)session.getAttribute("adminInfo");
		if(((user != null)&&(writer.contentEquals(user))) || (admin != null)) {
			pieceCommentService.commentDelete(comment_seq);
			return "삭제 성공";
		}else {
			return "redirect:/error";
		}
	}

	@RequestMapping(value="/commentWrite.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String commentWrite_loginAop(int pieceNotice_seq, String writer, String comment) {
		comment.replaceAll("\r\n", "<br>");
		pieceCommentService.commentWrite(pieceNotice_seq, writer, comment);
		int comment_seq = pieceCommentService.getCommetSeq(pieceNotice_seq, writer);
		PieceNoticeCommentDTO dto = pieceCommentService.commentSelect(comment_seq);
		System.out.println(dto.getWrite_date());

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
		comment.replaceAll("\r\n", "<br>");
		pieceCommentService.commentModify(comment_seq, comment);
		return "완료";
	}
}
