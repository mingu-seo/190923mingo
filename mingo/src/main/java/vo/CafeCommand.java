package vo;
/**
 * 카페 커맨드 객체
 * 검색옵션기능 구현
 * MyBatis 매개변수로 넘어감
 * @author gd20
 *
 */
public class CafeCommand {
	
	private int sido_code;  //시도 코드
	private int sigungu_code; //시군구 코드
	private long dong_code; //행정동 코드
	private String name;  //상호명
	private int filter_type; //0.디폴트 1.평점순 2.리뷰순 3.좋아요 순
	
	
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
	public long getDong_code() {
		return dong_code;
	}
	public void setDong_code(long dong_code) {
		this.dong_code = dong_code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getFilter_type() {
		return filter_type;
	}
	public void setFilter_type(int filter_type) {
		this.filter_type = filter_type;
	}
	
	
	
	
	
	
}
