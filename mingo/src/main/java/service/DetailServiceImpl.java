
package service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dao.DetailDAO;
import util.FileUtil;
import vo.CafeFacilitiesVO;
import vo.CafeImageVO;
import vo.CafeMenuVO;
import vo.CafeProductVO;
import vo.CafeRateVO;
import vo.CafeServiceVO;
import vo.CafeVO;
import vo.ReviewVO;
import vo.UserVO;  

@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	private DetailDAO detailDao;
	
	public CafeVO viewCafe(int cafe_id) {
		CafeVO cafe = detailDao.viewCafe(cafe_id);
		return cafe;
	}
	
	public List<CafeImageVO> viewCafeImages(int cafe_id){
		List<CafeImageVO> imgList = detailDao.viewCafeImages(cafe_id);
		return imgList;
	}
	public List<ReviewVO> viewCafeReview(int cafe_id){
		List<ReviewVO> reviewList = detailDao.viewCafeReview(cafe_id);
		return reviewList;
	}
	public List<UserVO> viewUserList(int[] userList){
		List<UserVO> reviewUsers = detailDao.viewUserList(userList);
		return reviewUsers;		
	}
	
	public int insertCafeImages(CafeImageVO vo, List<MultipartFile> fileList,MultipartHttpServletRequest request) {
		return detailDao.insertCafeImages(vo,fileList, request);
	}
	
	public List<CafeMenuVO> viewMenu(int cafe_id){
		List<CafeMenuVO> menuList = detailDao.viewMenu(cafe_id);
		return menuList;
	}
	
	public List<CafeProductVO> viewProduct(int cafe_id){
		List<CafeProductVO> productList = detailDao.viewProduct(cafe_id);
		return productList;
	}
	
	public CafeServiceVO viewService(int cafe_id) {
		CafeServiceVO service = detailDao.viewService(cafe_id);
		return service;
	}
	public CafeFacilitiesVO viewFacilities(int cafe_id) {
		CafeFacilitiesVO facilities = detailDao.viewFacilities(cafe_id);
		return facilities;
	}
	public CafeRateVO viewCafeRate(int cafe_id) {
		CafeRateVO cafeRate = detailDao.viewCafeRate(cafe_id);
		return cafeRate;
	}
	
	public int registCafe(CafeVO cafeVO, List<MultipartFile> logoFile, HttpServletRequest request) {
		int r = detailDao.registCafe(cafeVO, logoFile, request);
		return r;
	}
	public int registFacility(CafeFacilitiesVO cafeFacilitiesVO) {
		int r = detailDao.registFacility(cafeFacilitiesVO);
		return r;
	}
	public int registService(CafeServiceVO cafeServiceVO) {
		int r = detailDao.registService(cafeServiceVO);
		return r;
	}
	public int registMenu(List<CafeMenuVO> cafeMenuVO, List<MultipartFile> menuFileList, MultipartHttpServletRequest request) {
		int r = detailDao.registMenu(cafeMenuVO, menuFileList, request);
		return r;
	}
	public int registProduct(List<CafeProductVO> cafeProductVO, List<MultipartFile> productFileList,MultipartHttpServletRequest request) {
		int r = detailDao.registProduct(cafeProductVO, productFileList, request);
		return r;
	}
	
	   
	
}
