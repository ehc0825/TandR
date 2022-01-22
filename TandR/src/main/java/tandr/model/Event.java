package tandr.model;

import java.sql.Date;

public class Event {
	private int eventNum;
	private String eventTitle;
	private String eventContent;
	private String id;
	private String photo;
	private Date eventDate;
	private String eventClose;
	private int eventReadCount;
	public int getEventReadCount() {
		return eventReadCount;
	}
	public void setEventReadCount(int eventReadCount) {
		this.eventReadCount = eventReadCount;
	}
	public int getEventNum() {
		return eventNum;
	}
	public void setEventNum(int eventNum) {
		this.eventNum = eventNum;
	}
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	public String getEventContent() {
		return eventContent;
	}
	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Date getEventDate() {
		return eventDate;
	}
	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}
	public String getEventClose() {
		return eventClose;
	}
	public void setEventClose(String eventClose) {
		this.eventClose = eventClose;
	}
	
}
