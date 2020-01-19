package kh.picsell.dto;

public class HonorVoteDTO {
private String nick;

public HonorVoteDTO() {
	super();
}

public HonorVoteDTO(String nick) {
	super();
	this.nick = nick;
}

public String getNick() {
	return nick;
}

public void setNick(String nick) {
	this.nick = nick;
}


}
