package vo;
public class UserVO {


	private int user_id;
	private String email;
	private String password;
	private String nickname;
	private String name;
	private String birthday;
	private int gender;
	private int type;
	private String phone_num;
	private String profile_image;
	private String post_code;  //우편번호
	private String jibun_address;//지번주소
	private String detail_address; //상세 주소
	
	
	
	private String business_num; //사장님이 보유한 카페의 id(cafe_id)중에 있음
	
	
	
	public String getBusiness_num() {
		return business_num;
	}
	public void setBusiness_num(String business_num) {
		this.business_num = business_num;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}
	public String getJibun_address() {
		return jibun_address;
	}
	public void setJibun_address(String jibun_address) {
		this.jibun_address = jibun_address;
	}
	public String getDetail_address() {
		return detail_address;
	}
	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", email=" + email + ", password=" + password + ", nickname=" + nickname
				+ ", name=" + name + ", birthday=" + birthday + ", gender=" + gender + ", type=" + type + ", phone_num="
				+ phone_num + ", profile_image=" + profile_image + ", post_code=" + post_code + ", jibun_address="
				+ jibun_address + ", detail_address=" + detail_address + "]";
	}
	
	

	
}
