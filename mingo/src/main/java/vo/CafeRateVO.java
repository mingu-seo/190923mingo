package vo;

public class CafeRateVO {
	private int cafe_id;
	private int rate_num;
	private int taste_sum;  //맛
	private int mood_sum;  //시설 및 분위기
	private int service_sum;//서비스
	private int wifi_sum; //와이파이
	private int clean_sum;//청결
	private int price_sum;//가격
	private double taste_avg;
	private double mood_avg;
	private double service_avg;
	private double wifi_avg;
	private double clean_avg;
	private double price_avg;
	private double cafe_total_avg;
	
	public CafeRateVO(){
		this.cafe_id = 0;
		this.cafe_total_avg = 0;
		this.clean_avg = 0;
		this.clean_avg = 0;
		this.clean_sum = 0;
		this.mood_avg = 0;
		this.mood_sum = 0;
		this.price_avg = 0;
		this.price_sum = 0;
		this.service_avg = 0;
		this.service_sum = 0;
		this.taste_avg = 0;
		this.taste_sum = 0;
		this.wifi_avg = 0;
		this.wifi_sum = 0;
		this.rate_num = 0;
		
	}
	
	
	public int getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(int cafe_id) {
		this.cafe_id = cafe_id;
	}
	public int getRate_num() {
		return rate_num;
	}
	public void setRate_num(int rate_num) {
		this.rate_num = rate_num;
	}
	public int getTaste_sum() {
		return taste_sum;
	}
	public void setTaste_sum(int taste_sum) {
		this.taste_sum = taste_sum;
	}
	public int getMood_sum() {
		return mood_sum;
	}
	public void setMood_sum(int mood_sum) {
		this.mood_sum = mood_sum;
	}
	public int getService_sum() {
		return service_sum;
	}
	public void setService_sum(int service_sum) {
		this.service_sum = service_sum;
	}
	public int getWifi_sum() {
		return wifi_sum;
	}
	public void setWifi_sum(int wifi_sum) {
		this.wifi_sum = wifi_sum;
	}
	public int getClean_sum() {
		return clean_sum;
	}
	public void setClean_sum(int clean_sum) {
		this.clean_sum = clean_sum;
	}
	public int getPrice_sum() {
		return price_sum;
	}
	public void setPrice_sum(int price_sum) {
		this.price_sum = price_sum;
	}
	public double getTaste_avg() {
		return taste_avg;
	}
	public void setTaste_avg(double taste_avg) {
		this.taste_avg = taste_avg;
	}
	public double getMood_avg() {
		return mood_avg;
	}
	public void setMood_avg(double mood_avg) {
		this.mood_avg = mood_avg;
	}
	public double getService_avg() {
		return service_avg;
	}
	public void setService_avg(double service_avg) {
		this.service_avg = service_avg;
	}
	public double getWifi_avg() {
		return wifi_avg;
	}
	public void setWifi_avg(double wifi_avg) {
		this.wifi_avg = wifi_avg;
	}
	public double getClean_avg() {
		return clean_avg;
	}
	public void setClean_avg(double clean_avg) {
		this.clean_avg = clean_avg;
	}
	public double getPrice_avg() {
		return price_avg;
	}
	public void setPrice_avg(double price_avg) {
		this.price_avg = price_avg;
	}
	public double getCafe_total_avg() {
		return cafe_total_avg;
	}
	public void setCafe_total_avg(double cafe_total_avg) {
		this.cafe_total_avg = cafe_total_avg;
	}
	
	
}

