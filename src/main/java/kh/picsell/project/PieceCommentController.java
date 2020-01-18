package kh.picsell.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.picsell.dto.PieceNoticeCommentDTO;
import kh.picsell.service.PieceCommentService;

@Controller
@RequestMapping("/pieceComment")
public class PieceCommentController {
	
	@Autowired
	private PieceCommentService pieceCommentService;
	
	private PieceNoticeCommentDTO commentDto;

	@RequestMapping(value="/commentDelete.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String commentDelete(int comment_seq) {
		pieceCommentService.commentDelete(comment_seq);
		return "삭제 성공";
	}
	
	@RequestMapping(value="/commentWrite.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String commentWrite(int pieceNotice_seq, String writer, String comment) {
		System.out.println(pieceNotice_seq);
		pieceCommentService.commentWrite(pieceNotice_seq, writer, comment);
		return "댓글 작성 완료";
	}
	
	@RequestMapping(value="/commentModify.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String commentModify(int comment_seq, String comment) {
		pieceCommentService.commentModify(comment_seq, comment);
		return "완료";
	}
}
