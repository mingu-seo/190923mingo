package vo;

import java.sql.Timestamp;

public class CafeVO {
	private int cafe_id;
	private int manager_id;
	private String name; 
	private String branch;
	private String tel;
	private int time_day;
	private int time_start;
	private int time_end;
	private double rate_avg;
	private int review_num;
	private String cafe_intro;
	private int cafe_like;
	private String cafe_address;
	private String sido_name;
	private int sido_code;
	private String sigungu_name;
	private int sigungu_code;
	private String dong_name;
	private String dong_code;
	private double latitude;
	private double longitude;
	private Timestamp regdate;
	public int getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(int cafe_id) {
		this.cafe_id = cafe_id;
	}
	public int getManager_id() {
		return manager_id;
	}
	public void setManager_id(int manager_id) {
		this.manager_id = manager_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getTime_day() {
		return time_day;
	}
	public void setTime_day(int time_day) {
		this.time_day = time_day;
	}
	public int getTime_start() {
		return time_start;
	}
	public void setTime_start(int time_start) {
		this.time_start = time_start;
	}
	public int getTime_end() {
		return time_end;
	}
	public void setTime_end(int time_end) {
		this.time_end = time_end;
	}
	public double getRate_avg() {
		return rate_avg;
	}
	public void setRate_avg(double rate_avg) {
		this.rate_avg = rate_avg;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getCafe_intro() {
		return cafe_intro;
	}
	public void setCafe_intro(String cafe_intro) {
		this.cafe_intro = cafe_intro;
	}
	public int getCafe_like() {
		return cafe_like;
	}
	public void setCafe_like(int cafe_like) {
		this.cafe_like = cafe_like;
	}
	public String getCafe_address() {
		return cafe_address;
	}
	public void setCafe_address(String cafe_address) {
		this.cafe_address = cafe_address;
	}
	public String getSido_name() {
		return sido_name;
	}
	public void setSido_name(String sido_name) {
		this.sido_name = sido_name;
	}
	public int getSido_code() {
		return sido_code;
	}
	public void setSido_code(int sido_code) {
		this.sido_code = sido_code;
	}
	public String getSigungu_name() {
		return sigungu_name;
	}
	public void setSigungu_name(String sigungu_name) {
		this.sigungu_name = sigungu_name;
	}
	public int getSigungu_code() {
		return sigungu_code;
	}
	public void setSigungu_code(int sigungu_code) {
		this.sigungu_code = sigungu_code;
	}
	public String getDong_name() {
		return dong_name;
	}
	public void setDong_name(String dong_name) {
		this.dong_name = dong_name;
	}
	public String getDong_code() {
		return dong_code;
	}
	public void setDong_code(String dong_code) {
		this.dong_code = dong_code;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
