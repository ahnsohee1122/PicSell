package kh.picsell.dto;

public class EventDTO {
	private String nickname;
	private String title;
	private String event_date;
	private String imageurl;
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getEvent_date() {
		return event_date;
	}
	public void setEvent_date(String event_date) {
		this.event_date = event_date;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	public EventDTO(String nickname, String title, String event_date, String imageurl) {
		super();
		this.nickname = nickname;
		this.title = title;
		this.event_date = event_date;
		this.imageurl = imageurl;
	}
	public EventDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
