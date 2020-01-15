package kh.picsell.dto;

import java.sql.Timestamp;

public class HonorDTO {
private int honor_seq;
private int honorpoint;
private String nickname;
private Timestamp honor_date;
private int img_seq;
private String oriname;
private String sysname;
public HonorDTO() {
	super();
}
public HonorDTO(int honor_seq, int honorpoint, String nickname, Timestamp honor_date, int img_seq, String oriname,
		String sysname) {
	super();
	this.honor_seq = honor_seq;
	this.honorpoint = honorpoint;
	this.nickname = nickname;
	this.honor_date = honor_date;
	this.img_seq = img_seq;
	this.oriname = oriname;
	this.sysname = sysname;
}
public int getHonor_seq() {
	return honor_seq;
}
public void setHonor_seq(int honor_seq) {
	this.honor_seq = honor_seq;
}
public int getHonorpoint() {
	return honorpoint;
}
public void setHonorpoint(int honorpoint) {
	this.honorpoint = honorpoint;
}
public String getNickname() {
	return nickname;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
public Timestamp getHonor_date() {
	return honor_date;
}
public void setHonor_date(Timestamp honor_date) {
	this.honor_date = honor_date;
}
public int getImg_seq() {
	return img_seq;
}
public void setImg_seq(int img_seq) {
	this.img_seq = img_seq;
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



}
