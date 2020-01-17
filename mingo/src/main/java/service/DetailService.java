

package service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import vo.CafeFacilitiesVO;
import vo.CafeImageVO;
import vo.CafeMenuVO;
import vo.CafeProductVO;
import vo.CafeServiceVO;
import vo.CafeVO;
import vo.ReviewVO;
import vo.UserVO;

public interface DetailService {
	
	public CafeVO viewCafe(int cafe_id);
	public List<CafeImageVO> viewCafeImages(int cafe_id);
	public List<ReviewVO> viewCafeReview(int cafe_id);
	public List<UserVO> viewUserList(int[] userList);
	public List<CafeMenuVO> viewMenu(int cafe_id);
	public List<CafeProductVO> viewProduct(int cafe_id);
	public CafeServiceVO viewService(int cafe_id);
	public CafeFacilitiesVO viewFacilities(int cafe_id);
	
	
	
	public int insertCafeImages(CafeImageVO cafeVO, List<MultipartFile> fileList,MultipartHttpServletRequest request);
}
