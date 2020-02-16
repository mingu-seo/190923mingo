package vo;

import java.sql.Timestamp;

public class BoardVO {

	private int board_id;
	private int user_id;
	private int type;
	private String title;
	private String contents;
	private Timestamp regdate;
	private int readcount;
	private int like_num;
	private String nickname;
	private int reply_num;
	private int is_notice;
	private String new_regdate;
	
	
	public String getNew_regdate() {
		return new_regdate;
	}

	public void setNew_regdate(String new_regdate) {
		this.new_regdate = new_regdate;
	}

	public int getIs_notice() {
		return is_notice;
	}

	public void setIs_notice(int is_notice) {
		this.is_notice = is_notice;
	}

	public int getReply_num() {
		return reply_num;
	}

	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getLike_num() {
		return like_num;
	}

	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	// 추가 필드
	private int page;	// 사용자가 요청한 페이지번호
	private int limit;	// 페이지당 로우 수
	private int startIndex;	// limit 시작 인덱스
	private int maxPage;	// 총페이지수
	
	private int s1; //검색옵션 1
	private int s2;//검색옵션 2
	private String k; //검색키워드
	
	// 초기화(생성자)
	public BoardVO() {
		this.page = 1;	// 사용자가 요청한 페이지번호가 없으면 초기값 1
		this.limit = 10; // 페이지당 로우수가 지정이 안되면 초기값 10
	}
		
	
	
	

	public int getS1() {
		return s1;
	}

	public void setS1(int s1) {
		this.s1 = s1;
	}

	public int getS2() {
		return s2;
	}

	public void setS2(int s2) {
		this.s2 = s2;
	}

	public String getK() {
		return k;
	}

	public void setK(String k) {
		this.k = k;
	}

	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
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
	public int getStartIndex() {
		// 시작인덱스값 mybatis에서 getter 메서드를 호출하기 때문에 여기에 로직을 추가
		int i = (this.page - 1) * this.limit;
		return i;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	@Override
	public String toString() {
		return "BoardVO [board_id=" + board_id + ", user_id=" + user_id + ", type=" + type + ", title=" + title
				+ ", contents=" + contents + ", regdate=" + regdate + ", readcount=" + readcount + ", like_num="
				+ like_num + ", nickname=" + nickname + ", reply_num=" + reply_num + ", page=" + page + ", limit="
				+ limit + ", startIndex=" + startIndex + ", maxPage=" + maxPage + ", s1=" + s1 + ", s2=" + s2 + ", k="
				+ k + "]";
	}

	
	
}
