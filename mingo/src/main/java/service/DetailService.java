

package service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import vo.CafeFacilitiesVO;
import vo.CafeImageVO;
import vo.CafeMenuVO;
import vo.CafeProductVO;
import vo.CafeRateVO;
import vo.CafeServiceVO;
import vo.CafeVO;
import vo.CollectCafeVO;
import vo.LikeCafeVO;
import vo.ReviewVO;
import vo.UserVO;

public interface DetailService {
	
	public CafeVO viewCafe(int cafe_id);
	public List<CafeImageVO> viewCafeImages(int cafe_id);
	public List<ReviewVO> viewCafeReview(Map<String, Integer> reviewMap);
	public List<UserVO> viewUserList(int[] userList);
	public List<CafeMenuVO> viewMenu(int cafe_id);
	public List<CafeProductVO> viewProduct(int cafe_id);
	public CafeServiceVO viewService(int cafe_id);
	public CafeFacilitiesVO viewFacilities(int cafe_id);
	public CafeRateVO viewCafeRate(int cafe_id);
	
	public int registCafe(CafeVO cafeVO, List<MultipartFile> logoFile, HttpServletRequest request);
	public int registFacility(CafeFacilitiesVO cafeFacilitiesVO);
	public int registService(CafeServiceVO cafeServiceVO);
	public int registMenu(List<CafeMenuVO> cafeMenuVO, List<MultipartFile> menuFileList, MultipartHttpServletRequest request);
	public int registProduct(List<CafeProductVO> cafeProductVO, List<MultipartFile> productFileList, MultipartHttpServletRequest request);
	public int insertCafeImages(CafeImageVO cafeVO, List<MultipartFile> fileList,MultipartHttpServletRequest request);


	public int modifyCafe(CafeVO cafeVO, List<MultipartFile> logoFile, HttpServletRequest request);
	public int modifyFacility(CafeFacilitiesVO cafeFacilitiesVO);
	public int modifyService(CafeServiceVO cafeServiceVO);
	public int modifyMenu(List<CafeMenuVO> cafeMenuVO, List<MultipartFile> menuFileList, MultipartHttpServletRequest request);
	public int modifyProduct(List<CafeProductVO> cafeProductVO, List<MultipartFile> productFileList, MultipartHttpServletRequest request);
	public int modifyCafeImages(CafeImageVO cafeVO, List<MultipartFile> fileList,MultipartHttpServletRequest request);
	
	
	public int deleteCafeInfo(int cafe_id);
	
	public int registReview(ReviewVO vo,MultipartFile file, HttpServletRequest request, CafeRateVO cafeRate);
	public ReviewVO viewReview(ReviewVO vo);
	public int modifyReview(ReviewVO vo_old, ReviewVO vo_new, MultipartFile file, HttpServletRequest request, CafeRateVO cafeRate);
	public int deleteReview(CafeRateVO cafeRateVO, ReviewVO reviewVO);
	public int registLike(LikeCafeVO vo);
	public int deleteLike(LikeCafeVO vo);
	public int registCollect(CollectCafeVO vo);
	public int deleteCollect(CollectCafeVO vo);
}
