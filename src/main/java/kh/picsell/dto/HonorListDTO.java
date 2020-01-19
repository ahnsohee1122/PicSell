package kh.picsell.dto;

import java.sql.Timestamp;

public class HonorListDTO {
private int honorlist_seq;
private String nickname;
private int honorpoint;
private Timestamp honor_date;
public HonorListDTO() {
	super();
}
public HonorListDTO(int honorlist_seq, String nickname, int honorpoint, Timestamp honor_date) {
	super();
	this.honorlist_seq = honorlist_seq;
	this.nickname = nickname;
	this.honorpoint = honorpoint;
	this.honor_date = honor_date;
}
public int getHonorlist_seq() {
	return honorlist_seq;
}
public void setHonorlist_seq(int honorlist_seq) {
	this.honorlist_seq = honorlist_seq;
}
public String getNickname() {
	return nickname;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
public int getHonorpoint() {
	return honorpoint;
}
public void setHonorpoint(int honorpoint) {
	this.honorpoint = honorpoint;
}
public Timestamp getHonor_date() {
	return honor_date;
}
public void setHonor_date(Timestamp honor_date) {
	this.honor_date = honor_date;
}


}
