package vo;

public class CafeVO {
	private int cafe_id; //카페 유일 식별 번호. 상가업소번호
	private int manager_id; //카페 사장의 user_id
	private String name;  //상호명
	private String branch; //지점명
	private String tel; //전화번호
	private int time_day; //이용일
	private int time_start; //시작시간
	private int time_end;  //마감시간
	private double rate_avg;  //평점
	private int review_num; //리뷰개수
	private String cafe_intro; //카페 소개
	private int cafe_like; //좋아요 개수
	private String cafe_address; //카페 지번주소
	private String sido_name; //시도 이름
	private int sido_code;  //시도 코드
	private String sigungu_name; //시군구 이름
	private int sigungu_code; //시군구 코드
	private String dong_name; //행정동 이름
	private String dong_code; //행정동 코드
	private double longitude; //경도
	private double latitude; //위도
	
	
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
	
	
	
}
