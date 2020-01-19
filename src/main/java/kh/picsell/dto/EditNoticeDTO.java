package kh.picsell.dto;

import java.sql.Timestamp;

public class EditNoticeDTO {
	private int editNotice_seq;
	private String editNotice_title;
	private String editNotice_contents;
	private String editNotice_writer;
	private Timestamp editNotice_write_date;
	private int editNotice_view_count;
	
	public EditNoticeDTO() {}
	public EditNoticeDTO(int editNotice_seq, String editNotice_title, String editNotice_contents,
			String editNotice_writer, Timestamp editNotice_write_date, int editNotice_view_count) {
		super();
		this.editNotice_seq = editNotice_seq;
		this.editNotice_title = editNotice_title;
		this.editNotice_contents = editNotice_contents;
		this.editNotice_writer = editNotice_writer;
		this.editNotice_write_date = editNotice_write_date;
		this.editNotice_view_count = editNotice_view_count;
	}
	public int getEditNotice_seq() {
		return editNotice_seq;
	}
	public void setEditNotice_seq(int editNotice_seq) {
		this.editNotice_seq = editNotice_seq;
	}
	public String getEditNotice_title() {
		return editNotice_title;
	}
	public void setEditNotice_title(String editNotice_title) {
		this.editNotice_title = editNotice_title;
	}
	public String getEditNotice_contents() {
		return editNotice_contents;
	}
	public void setEditNotice_contents(String editNotice_contents) {
		this.editNotice_contents = editNotice_contents;
	}
	public String getEditNotice_writer() {
		return editNotice_writer;
	}
	public void setEditNotice_writer(String editNotice_writer) {
		this.editNotice_writer = editNotice_writer;
	}
	public Timestamp getEditNotice_write_date() {
		return editNotice_write_date;
	}
	public void setEditNotice_write_date(Timestamp editNotice_write_date) {
		this.editNotice_write_date = editNotice_write_date;
	}
	public int getEditNotice_view_count() {
		return editNotice_view_count;
	}
	public void setEditNotice_view_count(int editNotice_view_count) {
		this.editNotice_view_count = editNotice_view_count;
	}
	
	
}
