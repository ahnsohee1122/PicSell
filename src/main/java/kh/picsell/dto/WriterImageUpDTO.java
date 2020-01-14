package kh.picsell.dto;

import java.sql.Timestamp;

public class WriterImageUpDTO {
	private int img_seq;
	private String nickname, usage, copyright, tag, file_extension,oriname,sysname;
	private int img_size;
	private String make,model,xDimension,yDimension,sysname_watermark;
	private int img_like, viewcount, downcount;
	private String accept,checking;
	private Timestamp img_sysdate;
	private String rejection;
	
	public WriterImageUpDTO() {}

	public WriterImageUpDTO(int img_seq, String nickname, String usage, String copyright, String tag,
			String file_extension, String oriname, String sysname, int img_size, String make, String model,
			String xDimension, String yDimension, String sysname_watermark, int img_like, int viewcount, int downcount,
			String accept, String checking, Timestamp img_sysdate, String rejection) {
		super();
		this.img_seq = img_seq;
		this.nickname = nickname;
		this.usage = usage;
		this.copyright = copyright;
		this.tag = tag;
		this.file_extension = file_extension;
		this.oriname = oriname;
		this.sysname = sysname;
		this.img_size = img_size;
		this.make = make;
		this.model = model;
		this.xDimension = xDimension;
		this.yDimension = yDimension;
		this.sysname_watermark = sysname_watermark;
		this.img_like = img_like;
		this.viewcount = viewcount;
		this.downcount = downcount;
		this.accept = accept;
		this.checking = checking;
		this.img_sysdate = img_sysdate;
		this.rejection = rejection;
	}

	public int getImg_seq() {
		return img_seq;
	}

	public void setImg_seq(int img_seq) {
		this.img_seq = img_seq;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUsage() {
		return usage;
	}

	public void setUsage(String usage) {
		this.usage = usage;
	}

	public String getCopyright() {
		return copyright;
	}

	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getFile_extension() {
		return file_extension;
	}

	public void setFile_extension(String file_extension) {
		this.file_extension = file_extension;
	}

	public String getOriname() {
		return oriname;
	}

	public void setOriname(String oriname) {
		this.oriname = oriname;
	}

	public String getSysname() {
		return sysname;
	}

	public void setSysname(String sysname) {
		this.sysname = sysname;
	}

	public int getImg_size() {
		return img_size;
	}

	public void setImg_size(int img_size) {
		this.img_size = img_size;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getxDimension() {
		return xDimension;
	}

	public void setxDimension(String xDimension) {
		this.xDimension = xDimension;
	}

	public String getyDimension() {
		return yDimension;
	}

	public void setyDimension(String yDimension) {
		this.yDimension = yDimension;
	}

	public String getSysname_watermark() {
		return sysname_watermark;
	}

	public void setSysname_watermark(String sysname_watermark) {
		this.sysname_watermark = sysname_watermark;
	}

	public int getImg_like() {
		return img_like;
	}

	public void setImg_like(int img_like) {
		this.img_like = img_like;
	}

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	public int getDowncount() {
		return downcount;
	}

	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}

	public String getAccept() {
		return accept;
	}

	public void setAccept(String accept) {
		this.accept = accept;
	}

	public String getChecking() {
		return checking;
	}

	public void setChecking(String checking) {
		this.checking = checking;
	}

	public Timestamp getImg_sysdate() {
		return img_sysdate;
	}

	public void setImg_sysdate(Timestamp img_sysdate) {
		this.img_sysdate = img_sysdate;
	}

	public String getRejection() {
		return rejection;
	}

	public void setRejection(String rejection) {
		this.rejection = rejection;
	}

	
	
	
}