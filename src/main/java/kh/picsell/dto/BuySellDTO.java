package kh.picsell.dto;

public class BuySellDTO {
	private String deal_date;
	private int deal_img_seq;
	private int deal_price;
	private String sysname;
	public BuySellDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BuySellDTO(String deal_date, int deal_img_seq, int deal_price, String sysname) {
		super();
		this.deal_date = deal_date;
		this.deal_img_seq = deal_img_seq;
		this.deal_price = deal_price;
		this.sysname = sysname;
	}
	public String getDeal_date() {
		return deal_date;
	}
	public void setDeal_date(String deal_date) {
		this.deal_date = deal_date;
	}
	public int getDeal_img_seq() {
		return deal_img_seq;
	}
	public void setDeal_img_seq(int deal_img_seq) {
		this.deal_img_seq = deal_img_seq;
	}
	public int getDeal_price() {
		return deal_price;
	}
	public void setDeal_price(int deal_price) {
		this.deal_price = deal_price;
	}
	public String getSysname() {
		return sysname;
	}
	public void setSysname(String sysname) {
		this.sysname = sysname;
	}
}
