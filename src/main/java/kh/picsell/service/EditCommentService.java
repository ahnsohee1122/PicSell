package kh.picsell.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.picsell.dao.EditNoticeCommentDAO;
import kh.picsell.dto.EditNoticeCommentDTO;

@Service
public class EditCommentService {

	@Autowired
	private EditNoticeCommentDAO commentDao;
	
	public void commentDelete(int comment_seq) {
		commentDao.commentDelete(comment_seq);
	}
	
	public void commentWrite(int editNotice_seq, String writer, String comment) {
		System.out.println("2" + comment );
		commentDao.commentWrite(editNotice_seq, writer, comment);
	}
	
	public void commentModify(int comment_seq, String comment) {
		commentDao.commentModify(comment_seq, comment);
	}
	
	public int getCommetSeq(int editNotice_seq, String writer) {
		return commentDao.getCommetSeq(editNotice_seq, writer);
	}
	
	public EditNoticeCommentDTO commentSelect(int comment_seq) {
		return commentDao.commentSelect(comment_seq);
	}
}
