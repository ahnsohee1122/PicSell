package kh.picsell.dto;

public class HonorDTO {
private int honor_seq;
private int honorpoint;
private String nickname;
private String honor_date;

public HonorDTO() {
	super();
}

public HonorDTO(int honor_seq, int honorpoint, String nickname, String honor_date) {
	super();
	this.honor_seq = honor_seq;
	this.honorpoint = honorpoint;
	this.nickname = nickname;
	this.honor_date = honor_date;
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

public String getHonor_date() {
	return honor_date;
}

public void setHonor_date(String honor_date) {
	this.honor_date = honor_date;
}


}
