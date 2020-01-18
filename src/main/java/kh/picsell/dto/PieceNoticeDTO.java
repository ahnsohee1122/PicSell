package kh.picsell.dto;

import java.sql.Timestamp;

public class PieceNoticeDTO {
	private int pieceNotice_seq;
	private String pieceNotice_title;
	private String pieceNotice_contents;
	private String pieceNotice_writer;
	private Timestamp pieceNotice_write_date;
	private int pieceNotice_view_count;
	
	public PieceNoticeDTO() {}

	public PieceNoticeDTO(int pieceNotice_seq, String pieceNotice_title, String pieceNotice_contents,
			String pieceNotice_writer, Timestamp pieceNotice_write_date, int pieceNotice_view_count) {
		super();
		this.pieceNotice_seq = pieceNotice_seq;
		this.pieceNotice_title = pieceNotice_title;
		this.pieceNotice_contents = pieceNotice_contents;
		this.pieceNotice_writer = pieceNotice_writer;
		this.pieceNotice_write_date = pieceNotice_write_date;
		this.pieceNotice_view_count = pieceNotice_view_count;
	}

	public int getPieceNotice_seq() {
		return pieceNotice_seq;
	}

	public void setPieceNotice_seq(int pieceNotice_seq) {
		this.pieceNotice_seq = pieceNotice_seq;
	}

	public String getPieceNotice_title() {
		return pieceNotice_title;
	}

	public void setPieceNotice_title(String pieceNotice_title) {
		this.pieceNotice_title = pieceNotice_title;
	}

	public String getPieceNotice_contents() {
		return pieceNotice_contents;
	}

	public void setPieceNotice_contents(String pieceNotice_contents) {
		this.pieceNotice_contents = pieceNotice_contents;
	}

	public String getPieceNotice_writer() {
		return pieceNotice_writer;
	}

	public void setPieceNotice_writer(String pieceNotice_writer) {
		this.pieceNotice_writer = pieceNotice_writer;
	}

	public Timestamp getPieceNotice_write_date() {
		return pieceNotice_write_date;
	}

	public void setPieceNotice_write_date(Timestamp pieceNotice_write_date) {
		this.pieceNotice_write_date = pieceNotice_write_date;
	}

	public int getPieceNotice_view_count() {
		return pieceNotice_view_count;
	}

	public void setPieceNotice_view_count(int pieceNotice_view_count) {
		this.pieceNotice_view_count = pieceNotice_view_count;
	}

	@Override
	public String toString() {
		return "PieceNoticeDTO [pieceNotice_seq=" + pieceNotice_seq + ", pieceNotice_title=" + pieceNotice_title
				+ ", pieceNotice_contents=" + pieceNotice_contents + ", pieceNotice_writer=" + pieceNotice_writer
				+ ", pieceNotice_write_date=" + pieceNotice_write_date + ", pieceNotice_view_count="
				+ pieceNotice_view_count + "]";
	}
	
	
}
