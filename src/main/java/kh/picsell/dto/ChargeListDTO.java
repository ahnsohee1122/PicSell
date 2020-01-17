package kh.picsell.dto;

import java.sql.Timestamp;

public class ChargeListDTO {
	private String charge_nickname;
	private String receipt_id;
	private int price; 
	private String payment_name;
	private Timestamp requested_at;
	public ChargeListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getCharge_nickname() {
		return charge_nickname;
	}
	public void setCharge_nickname(String charge_nickname) {
		this.charge_nickname = charge_nickname;
	}
	public String getReceipt_id() {
		return receipt_id;
	}
	public void setReceipt_id(String receipt_id) {
		this.receipt_id = receipt_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPayment_name() {
		return payment_name;
	}
	public void setPayment_name(String payment_name) {
		this.payment_name = payment_name;
	}
	public Timestamp getRequested_at() {
		return requested_at;
	}
	public void setRequested_at(Timestamp requested_at) {
		this.requested_at = requested_at;
	}
	public ChargeListDTO(String charge_nickname, String receipt_id, int price, String payment_name,
			Timestamp requested_at) {
		super();
		this.charge_nickname = charge_nickname;
		this.receipt_id = receipt_id;
		this.price = price;
		this.payment_name = payment_name;
		this.requested_at = requested_at;
	}

}
