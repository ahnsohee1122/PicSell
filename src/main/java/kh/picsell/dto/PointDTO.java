package kh.picsell.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class PointDTO {
	private int point_seq;
	private String nickname;
	private String deal_sort;
	private String point_date;
	private int point;
	private String money_sort;
	public int getPoint_seq() {
		return point_seq;
	}
	public void setPoint_seq(int point_seq) {
		this.point_seq = point_seq;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getDeal_sort() {
		return deal_sort;
	}
	public void setDeal_sort(String deal_sort) {
		this.deal_sort = deal_sort;
	}
	public String getPoint_date() {
		return point_date;
	}
	public void setPoint_date(String point_date) {
		this.point_date = point_date;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getMoney_sort() {
		return money_sort;
	}
	public void setMoney_sort(String money_sort) {
		this.money_sort = money_sort;
	}
	public PointDTO(int point_seq, String nickname, String deal_sort, String point_date, int point, String money_sort) {
		super();
		this.point_seq = point_seq;
		this.nickname = nickname;
		this.deal_sort = deal_sort;
		this.point_date = point_date;
		this.point = point;
		this.money_sort = money_sort;
	}
	public PointDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}