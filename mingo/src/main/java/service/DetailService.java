

package service;

import java.util.List;

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
	public CafeRateVO viewCafeRate(int cafe_id);
	
	public int registCafe(CafeVO cafeVO, List<MultipartFile> logoFile, HttpServletRequest request);
	public int registFacility(CafeFacilitiesVO cafeFacilitiesVO);
	public int registService(CafeServiceVO cafeServiceVO);
	public int registMenu(List<CafeMenuVO> cafeMenuVO, List<MultipartFile> menuFileList, MultipartHttpServletRequest request);
	public int registProduct(List<CafeProductVO> cafeProductVO, List<MultipartFile> productFileList, MultipartHttpServletRequest request);
	
	public int insertCafeImages(CafeImageVO cafeVO, List<MultipartFile> fileList,MultipartHttpServletRequest request);
}
