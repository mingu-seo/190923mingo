package vo;

public class CafeProductVO {
	
	private int cafe_product_id;
	private int cafe_id;
	private String name;
	private int price;
	private String image;
	private int type;
	
	public int getCafe_product_id() {
		return cafe_product_id;
	}
	public void setCafe_product_id(int cafe_product_id) {
		this.cafe_product_id = cafe_product_id;
	}
	public int getCafe_id() {
		return cafe_id;
	}
	public void setCafe_id(int cafe_id) {
		this.cafe_id = cafe_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	

}
