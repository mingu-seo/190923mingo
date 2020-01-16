package vo;

public class BoardCommentVO {

	private int board_comment_id;
	private int user_id;
	private String regdate;
	private int group;
	private int seq;
	private int level;
	
	
	
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
	public int getGroup() {
		return group;
	}
	public void setGroup(int group) {
		this.group = group;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	
}
