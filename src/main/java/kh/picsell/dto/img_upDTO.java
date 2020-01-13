package kh.picsell.dto;

import java.sql.Timestamp;

public class img_upDTO {
private int img_seq;
private String nickname;
private String usage;
private String tag;
private String file_extension;
private String oriName;
private String sysName;
private int img_size;
private String make;
private String model;
private String XDimension;
private String YDimension;
private int img_like;
private int viewCount;
private int downCount;
private String accept;
private String checking;
private Timestamp img_sysdate;
private String rejection;

public img_upDTO() {
	super();
}

public img_upDTO(int img_seq, String nickname, String usage, String tag, String file_extension, String oriName,
		String sysName, int img_size, String make, String model, String xDimension, String yDimension, int img_like,
		int viewCount, int downCount, String accept, String checking, Timestamp img_sysdate, String rejection) {
	super();
	this.img_seq = img_seq;
	this.nickname = nickname;
	this.usage = usage;
	this.tag = tag;
	this.file_extension = file_extension;
	this.oriName = oriName;
	this.sysName = sysName;
	this.img_size = img_size;
	this.make = make;
	this.model = model;
	XDimension = xDimension;
	YDimension = yDimension;
	this.img_like = img_like;
	this.viewCount = viewCount;
	this.downCount = downCount;
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

public String getOriName() {
	return oriName;
}

public void setOriName(String oriName) {
	this.oriName = oriName;
}

public String getSysName() {
	return sysName;
}

public void setSysName(String sysName) {
	this.sysName = sysName;
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

public String getXDimension() {
	return XDimension;
}

public void setXDimension(String xDimension) {
	XDimension = xDimension;
}

public String getYDimension() {
	return YDimension;
}

public void setYDimension(String yDimension) {
	YDimension = yDimension;
}

public int getImg_like() {
	return img_like;
}

public void setImg_like(int img_like) {
	this.img_like = img_like;
}

public int getViewCount() {
	return viewCount;
}

public void setViewCount(int viewCount) {
	this.viewCount = viewCount;
}

public int getDownCount() {
	return downCount;
}

public void setDownCount(int downCount) {
	this.downCount = downCount;
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
