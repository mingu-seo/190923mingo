package vo;

public class RankCommand {
	
	
	
	private int sido_code;
	private int sigungu_code;
	private int brand_code;
	private int sort_code;
	
	private int limit; //몇개 가져올것인지 디폴트 50
	private int startrow;// 시작 로우
	
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getSido_code() {
		return sido_code;
	}
	public void setSido_code(int sido_code) {
		this.sido_code = sido_code;
	}
	public int getSigungu_code() {
		return sigungu_code;
	}
	public void setSigungu_code(int sigungu_code) {
		this.sigungu_code = sigungu_code;
	}
	public int getBrand_code() {
		return brand_code;
	}
	public void setBrand_code(int brand_code) {
		this.brand_code = brand_code;
	}
	public int getSort_code() {
		return sort_code;
	}
	public void setSort_code(int sort_code) {
		this.sort_code = sort_code;
	}
	
	
}
