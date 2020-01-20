package kh.picsell.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

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
		
		int comment_seq = pieceCommentService.getCommetSeq(pieceNotice_seq);
		System.out.println("comment_seq: "+comment_seq);
		PieceNoticeCommentDTO dto = pieceCommentService.commentSelect(comment_seq, writer);
		System.out.println(dto);
		
		String data = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			data = mapper.writeValueAsString(dto);
		} catch (Exception e) {
			System.out.println("first() mapper   ::    " + e.getMessage());
		}
		return data;
	}
	
	@RequestMapping(value="/commentModify.do", produces="text/html; charset=UTF-8")
	@ResponseBody
	public String commentModify(int comment_seq, String comment) {
		pieceCommentService.commentModify(comment_seq, comment);
		return "완료";
	}
}
