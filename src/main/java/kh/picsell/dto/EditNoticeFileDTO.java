package kh.picsell.dto;

import org.springframework.web.multipart.MultipartFile;

public class EditNoticeFileDTO {
	private int editNoticeFile_seq;
	private int editNoticeFile_parentSeq;
	private MultipartFile[] editNoticeFile_file;
	private String editNoticeFile_oriName;
	private String editNoticeFile_sysName;
	
	public EditNoticeFileDTO() {}
	public EditNoticeFileDTO(int editNoticeFile_seq, int editNoticeFile_parentSeq, MultipartFile[] editNoticeFile_file,
			String editNoticeFile_oriName, String editNoticeFile_sysName) {
		super();
		this.editNoticeFile_seq = editNoticeFile_seq;
		this.editNoticeFile_parentSeq = editNoticeFile_parentSeq;
		this.editNoticeFile_file = editNoticeFile_file;
		this.editNoticeFile_oriName = editNoticeFile_oriName;
		this.editNoticeFile_sysName = editNoticeFile_sysName;
	}
	public int getEditNoticeFile_seq() {
		return editNoticeFile_seq;
	}
	public void setEditNoticeFile_seq(int editNoticeFile_seq) {
		this.editNoticeFile_seq = editNoticeFile_seq;
	}
	public int getEditNoticeFile_parentSeq() {
		return editNoticeFile_parentSeq;
	}
	public void setEditNoticeFile_parentSeq(int editNoticeFile_parentSeq) {
		this.editNoticeFile_parentSeq = editNoticeFile_parentSeq;
	}
	public MultipartFile[] getEditNoticeFile_file() {
		return editNoticeFile_file;
	}
	public void setEditNoticeFile_file(MultipartFile[] editNoticeFile_file) {
		this.editNoticeFile_file = editNoticeFile_file;
	}
	public String getEditNoticeFile_oriName() {
		return editNoticeFile_oriName;
	}
	public void setEditNoticeFile_oriName(String editNoticeFile_oriName) {
		this.editNoticeFile_oriName = editNoticeFile_oriName;
	}
	public String getEditNoticeFile_sysName() {
		return editNoticeFile_sysName;
	}
	public void setEditNoticeFile_sysName(String editNoticeFile_sysName) {
		this.editNoticeFile_sysName = editNoticeFile_sysName;
	}
	
	
}
