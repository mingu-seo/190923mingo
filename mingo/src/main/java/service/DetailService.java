

package service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import vo.CafeImageVO;
import vo.CafeMenuVO;
import vo.CafeProductVO;
import vo.CafeVO;

public interface DetailService {
	
	public CafeVO viewCafe(int cafe_id);
	public int insertCafeImages(CafeImageVO cafeVO, List<MultipartFile> fileList,MultipartHttpServletRequest request);
	public List<CafeImageVO> viewCafeImages(int cafe_id);
	public List<CafeMenuVO> viewMenu(int cafe_id);
	public List<CafeProductVO> viewProduct(int cafe_id);
	
}
