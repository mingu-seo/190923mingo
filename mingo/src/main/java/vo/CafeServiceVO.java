package vo;

public class CafeServiceVO {
	private int cafe_service_id;
	private int cafe_id;
	private int event;
	private int coupon;
	private int mileage;
	private int blanket;
	private int drinkrefill;
	private String event_text;
	private String coupon_text;
	private String mileage_text;
	private String blanket_text;
	private String drinkrefill_text;
	
	public CafeServiceVO(){
		this.cafe_service_id = 0;
		
		this.blanket = 0;
		this.coupon = 0;
		this.drinkrefill= 0;
		this.event = 0;
		this.mileage = 0;
		
		this.blanket_text = "";
		this.coupon_text= "";
		this.drinkrefill_text = "";
		this.event_text = "";
		this.mileage_text = "";
		
	}
	

	public int getCafe_service_id() {
		return cafe_service_id;
	}
	public void setCafe_service_id(int cafe_service_id) {
		this.cafe_service_id = cafe_service_id;
	}
	public String getEvent_text() {
		return event_text;
	}
	public void setEvent_text(String event_text) {
		this.event_text = event_text;
	}
	public String getCoupon_text() {
		return coupon_text;
	}
	public void setCoupon_text(String coupon_text) {
		this.coupon_text = coupon_text;
	}
	public String getMileage_text() {
		return mileage_text;
	}
	public void setMileage_text(String mileage_text) {
		this.mileage_text = mileage_text;
	}
	public String getBlanket_text() {
		return blanket_text;
	}
	public void setBlanket_text(String blanket_text) {
		this.blanket_text = blanket_text;
	}
	public String getDrinkrefill_text() {
		return drinkrefill_text;
	}
	public void setDrinkrefill_text(String drinkrefill_text) {
		this.drinkrefill_text = drinkrefill_text;
	}
	public int getCafe_ervice_id() {
		return cafe_service_id;
	}
	public void setCafe_ervice_id(int cafe_service_id) {
		this.cafe_service_id = cafe_service_id;
	}
	public int getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(int cafe_id) {
		this.cafe_id = cafe_id;
	}
	public int getEvent() {
		return event;
	}
	public void setEvent(int event) {
		this.event = event;
	}
	public int getCoupon() {
		return coupon;
	}
	public void setCoupon(int coupon) {
		this.coupon = coupon;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public int getBlanket() {
		return blanket;
	}
	public void setBlanket(int blanket) {
		this.blanket = blanket;
	}
	public int getDrinkrefill() {
		return drinkrefill;
	}
	public void setDrinkrefill(int drinkrefill) {
		this.drinkrefill = drinkrefill;
	}
	
	

}
