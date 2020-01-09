package kh.picsell.dto;

public class ContestDTO {
private int contest_seq;
private String reason;
private String title;
private String detail;
private String terms;
private String term_time;
private int price;
private String hosttype;
private String host;
private String accept;
private String checking;
public ContestDTO() {
	super();
}
public ContestDTO(int contest_seq, String reason, String title, String detail, String terms, String term_time,
		int price, String hosttype, String host, String accept, String checking) {
	super();
	this.contest_seq = contest_seq;
	this.reason = reason;
	this.title = title;
	this.detail = detail;
	this.terms = terms;
	this.term_time = term_time;
	this.price = price;
	this.hosttype = hosttype;
	this.host = host;
	this.accept = accept;
	this.checking = checking;
}
public int getContest_seq() {
	return contest_seq;
}
public void setContest_seq(int contest_seq) {
	this.contest_seq = contest_seq;
}
public String getReason() {
	return reason;
}
public void setReason(String reason) {
	this.reason = reason;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getDetail() {
	return detail;
}
public void setDetail(String detail) {
	this.detail = detail;
}
public String getTerms() {
	return terms;
}
public void setTerms(String terms) {
	this.terms = terms;
}
public String getTerm_time() {
	return term_time;
}
public void setTerm_time(String term_time) {
	this.term_time = term_time;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getHosttype() {
	return hosttype;
}
public void setHosttype(String hosttype) {
	this.hosttype = hosttype;
}
public String getHost() {
	return host;
}
public void setHost(String host) {
	this.host = host;
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

}
