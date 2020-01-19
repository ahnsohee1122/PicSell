package kh.picsell.dto;

import java.sql.Timestamp;

public class PieceNoticeCommentDTO {

	private int comment_seq;
	private int pieceNotice_seq;
	private String notice_comment;
	private Timestamp write_date;
	private String writer;
	
	public PieceNoticeCommentDTO() {}
	
	public PieceNoticeCommentDTO(int comment_seq, int pieceNotice_seq, String notice_comment, Timestamp write_date,
			String writer) {
		super();
		this.comment_seq = comment_seq;
		this.pieceNotice_seq = pieceNotice_seq;
		this.notice_comment = notice_comment;
		this.write_date = write_date;
		this.writer = writer;
	}

	public int getComment_seq() {
		return comment_seq;
	}

	public void setComment_seq(int comment_seq) {
		this.comment_seq = comment_seq;
	}

	public int getPieceNotice_seq() {
		return pieceNotice_seq;
	}

	public void setPieceNotice_seq(int pieceNotice_seq) {
		this.pieceNotice_seq = pieceNotice_seq;
	}

	public String getNotice_comment() {
		return notice_comment;
	}

	public void setNotice_comment(String notice_comment) {
		this.notice_comment = notice_comment;
	}

	public Timestamp getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
}
