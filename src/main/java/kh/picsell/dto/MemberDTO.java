package kh.picsell.dto;

public class MemberDTO {
private String id;
private String pw;
private String name;
private String nickname;
private String email;
private String email_receive;
private int black;
private int likepoint;
public MemberDTO() {
	super();
}
public MemberDTO(String id, String pw, String name, String nickname, String email, String email_receive, int black, int likepoint) {
	super();
	this.id = id;
	this.pw = pw;
	this.name = name;
	this.nickname = nickname;
	this.email = email;
	this.email_receive = email_receive;
	this.black = black;
	this.likepoint = likepoint;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getNickname() {
	return nickname;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getEmail_receive() {
	return email_receive;
}
public void setEmail_receive(String email_receive) {
	this.email_receive = email_receive;
}
public int getBlack() {
	return black;
}
public void setBlack(int black) {
	this.black = black;
}
public int getLikepoint() {
	return likepoint;
}
public void setLikepoint(int likepoint) {
	this.likepoint = likepoint;
}


}
