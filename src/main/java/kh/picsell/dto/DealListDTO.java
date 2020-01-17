package kh.picsell.dto;

public class DealListDTO {
private int deal_seq;
private String deal_date;
private int deal_price;
private int deal_img_seq;
private String writer_nickname;
private String buyer_nickname;
public int getDeal_seq() {
	return deal_seq;
}
public void setDeal_seq(int deal_seq) {
	this.deal_seq = deal_seq;
}
public String getDeal_date() {
	return deal_date;
}
public void setDeal_date(String deal_date) {
	this.deal_date = deal_date;
}
public int getDeal_price() {
	return deal_price;
}
public void setDeal_price(int deal_price) {
	this.deal_price = deal_price;
}
public int getDeal_img_seq() {
	return deal_img_seq;
}
public void setDeal_img_seq(int deal_img_seq) {
	this.deal_img_seq = deal_img_seq;
}
public String getWriter_nickname() {
	return writer_nickname;
}
public void setWriter_nickname(String writer_nickname) {
	this.writer_nickname = writer_nickname;
}
public String getBuyer_nickname() {
	return buyer_nickname;
}
public void setBuyer_nickname(String buyer_nickname) {
	this.buyer_nickname = buyer_nickname;
}
public DealListDTO(int deal_seq, String deal_date, int deal_price, int deal_img_seq, String writer_nickname,
		String buyer_nickname) {
	super();
	this.deal_seq = deal_seq;
	this.deal_date = deal_date;
	this.deal_price = deal_price;
	this.deal_img_seq = deal_img_seq;
	this.writer_nickname = writer_nickname;
	this.buyer_nickname = buyer_nickname;
}
public DealListDTO() {
	super();
	// TODO Auto-generated constructor stub
}

}