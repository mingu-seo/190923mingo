package vo;

public class RankCommand {
	
	
	
	private int sido_code;
	private int sigungu_code;
	private long dong_code;
	private int brand_code;
	private int sort_code;
	
	private int page;
	private int limit; //몇개 가져올것인지 디폴트 50
	private int startrow;// 시작 로우
	
	/* 검색옵션 밑에 셀렉트박스값(af)와 키워드 값 */
	private int af;
	private String ak;
	
	
	public long getDong_code() {
		return dong_code;
	}
	public void setDong_code(long dong_code) {
		this.dong_code = dong_code;
	}
	public int getAf() {
		return af;
	}
	public void setAf(int af) {
		this.af = af;
	}
	public String getAk() {
		return ak;
	}
	public void setAk(String ak) {
		this.ak = ak;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
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
