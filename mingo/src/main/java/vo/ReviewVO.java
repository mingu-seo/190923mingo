package vo;

import java.sql.Timestamp;

public class ReviewVO {
	
	private int review_id;
	private int user_id;
	private int cafe_id;
	private Timestamp regdate;
	private String contents;
	private int taste_score;
	private int price_score;
	private int facility_score;
	private int wifi_score;
	private int mood_score;
	private int clean_score;
	private int service_score;
	private String image;
	
	public int getService_score() {
		return service_score;
	}
	public void setService_score(int service_score) {
		this.service_score = service_score;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(int cafe_id) {
		this.cafe_id = cafe_id;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getTaste_score() {
		return taste_score;
	}
	public void setTaste_score(int taste_score) {
		this.taste_score = taste_score;
	}
	public int getPrice_score() {
		return price_score;
	}
	public void setPrice_score(int price_score) {
		this.price_score = price_score;
	}
	public int getFacility_score() {
		return facility_score;
	}
	public void setFacility_score(int facility_score) {
		this.facility_score = facility_score;
	}
	public int getWifi_score() {
		return wifi_score;
	}
	public void setWifi_score(int wifi_score) {
		this.wifi_score = wifi_score;
	}
	public int getMood_score() {
		return mood_score;
	}
	public void setMood_score(int mood_score) {
		this.mood_score = mood_score;
	}
	public int getClean_score() {
		return clean_score;
	}
	public void setClean_score(int clean_score) {
		this.clean_score = clean_score;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	
	
	
}
