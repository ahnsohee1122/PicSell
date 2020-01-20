package kh.picsell.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.picsell.dao.PieceNoticeCommentDAO;
import kh.picsell.dto.PieceNoticeCommentDTO;

@Service
public class PieceCommentService {
	
	@Autowired
	private PieceNoticeCommentDAO commentDao;
	
	public void commentDelete(int comment_seq) {
		commentDao.commentDelete(comment_seq);
	}
	
	public void commentWrite(int pieceNotice_seq, String writer, String comment) {
		System.out.println(pieceNotice_seq);
		commentDao.commentWrite(pieceNotice_seq, writer, comment);
	}
	
	public void commentModify(int comment_seq, String comment) {
		commentDao.commentModify(comment_seq, comment);
	}
	
	public int getCommetSeq(int pieceNotice_seq, String writer) {
		return commentDao.getCommetSeq(pieceNotice_seq, writer);
	}
	
	public PieceNoticeCommentDTO commentSelect(int comment_seq) {
		return commentDao.commentSelect(comment_seq);
	}
}
