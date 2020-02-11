package vo;

public class UserCommand {
	private int limit; //몇개 가져올것인지 디폴트 10
	private int startrow;// 시작 로우
	
	private int af;
	private String ak;
	
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
	
}
