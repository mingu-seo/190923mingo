package vo;

import java.util.List;

public class ListVO {
	private List<CafeMenuVO> cafeMenuListVO;
	private List<CafeProductVO> cafeProductListVO;
	
	
	public List<CafeMenuVO> getCafeMenuListVO() {
		return cafeMenuListVO;
	}
	public void setCafeMenuListVO(List<CafeMenuVO> cafeMenuListVO) {
		this.cafeMenuListVO = cafeMenuListVO;
	}
	public List<CafeProductVO> getCafeProductListVO() {
		return cafeProductListVO;
	}
	public void setCafeProductListVO(List<CafeProductVO> cafeProductListVO) {
		this.cafeProductListVO = cafeProductListVO;
	}
}
