package kh.picsell.dto;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class PieceNoticeFileDTO {
	private int pieceNoticeFile_seq;
	private int pieceNoticeFile_parentSeq;
	private MultipartFile[] pieceNoticeFile_file;
	private String pieceNoticeFile_oriName;
	private String pieceNoticeFile_sysName;
	
	public PieceNoticeFileDTO() {}

	public PieceNoticeFileDTO(int pieceNoticeFile_seq, int pieceNoticeFile_parentSeq,
			MultipartFile[] pieceNoticeFile_file, String pieceNoticeFile_oriName, String pieceNoticeFile_sysName) {
		super();
		this.pieceNoticeFile_seq = pieceNoticeFile_seq;
		this.pieceNoticeFile_parentSeq = pieceNoticeFile_parentSeq;
		this.pieceNoticeFile_file = pieceNoticeFile_file;
		this.pieceNoticeFile_oriName = pieceNoticeFile_oriName;
		this.pieceNoticeFile_sysName = pieceNoticeFile_sysName;
	}

	public int getPieceNoticeFile_seq() {
		return pieceNoticeFile_seq;
	}

	public void setPieceNoticeFile_seq(int pieceNoticeFile_seq) {
		this.pieceNoticeFile_seq = pieceNoticeFile_seq;
	}

	public int getPieceNoticeFile_parentSeq() {
		return pieceNoticeFile_parentSeq;
	}

	public void setPieceNoticeFile_parentSeq(int pieceNoticeFile_parentSeq) {
		this.pieceNoticeFile_parentSeq = pieceNoticeFile_parentSeq;
	}

	public MultipartFile[] getPieceNoticeFile_file() {
		return pieceNoticeFile_file;
	}

	public void setPieceNoticeFile_file(MultipartFile[] pieceNoticeFile_file) {
		this.pieceNoticeFile_file = pieceNoticeFile_file;
	}

	public String getPieceNoticeFile_oriName() {
		return pieceNoticeFile_oriName;
	}

	public void setPieceNoticeFile_oriName(String pieceNoticeFile_oriName) {
		this.pieceNoticeFile_oriName = pieceNoticeFile_oriName;
	}

	public String getPieceNoticeFile_sysName() {
		return pieceNoticeFile_sysName;
	}

	public void setPieceNoticeFile_sysName(String pieceNoticeFile_sysName) {
		this.pieceNoticeFile_sysName = pieceNoticeFile_sysName;
	}

	@Override
	public String toString() {
		return "PieceNoticeFileDTO [pieceNoticeFile_seq=" + pieceNoticeFile_seq + ", pieceNoticeFile_parentSeq="
				+ pieceNoticeFile_parentSeq + ", pieceNoticeFile_file=" + Arrays.toString(pieceNoticeFile_file)
				+ ", pieceNoticeFile_oriName=" + pieceNoticeFile_oriName + ", pieceNoticeFile_sysName="
				+ pieceNoticeFile_sysName + "]";
	}
	
	
}
