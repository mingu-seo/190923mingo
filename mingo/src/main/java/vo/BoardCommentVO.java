package vo;

public class BoardCommentVO {

	private int board_comment_id;
	private int user_id;
	private int board_id;
	private String regdate;
	private int ref;
	private int seq;
	private int lev;
	private String contents;
	private int is_deleted;
	private String nickname;
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(int is_deleted) {
		this.is_deleted = is_deleted;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getBoard_comment_id() {
		return board_comment_id;
	}
	public void setBoard_comment_id(int board_comment_id) {
		this.board_comment_id = board_comment_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	@Override
	public String toString() {
		return "BoardCommentVO [board_comment_id=" + board_comment_id + ", user_id=" + user_id + ", board_id="
				+ board_id + ", regdate=" + regdate + ", ref=" + ref + ", seq=" + seq + ", lev=" + lev + ", contents="
				+ contents + "]";
	}
	
	
	
	
	
	
}
