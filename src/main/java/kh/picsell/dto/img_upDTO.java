package kh.picsell.dto;

public class img_upDTO {
private int img_seq;
private String nickname;
private String usage;
private String tag;
private String file_extension;
private String oriName;
private String sysName;
private int likepoint;
private int viewCount;
private int downCount;
private int price;
private String accept;
public img_upDTO() {
	super();
}

public img_upDTO(int img_seq, String nickname, String usage, String tag, String file_extension, String oriName,
		String sysName, int likepoint, int viewCount, int downCount, int price, String accept) {
	super();
	this.img_seq = img_seq;
	this.nickname = nickname;
	this.usage = usage;
	this.tag = tag;
	this.file_extension = file_extension;
	this.oriName = oriName;
	this.sysName = sysName;
	this.likepoint = likepoint;
	this.viewCount = viewCount;
	this.downCount = downCount;
	this.price = price;
	this.accept = accept;
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
public int getLikepoint() {
	return likepoint;
}
public void setLikepoint(int likepoint) {
	this.likepoint = likepoint;
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
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getAccept() {
	return accept;
}
public void setAccept(String accept) {
	this.accept = accept;
}

}
