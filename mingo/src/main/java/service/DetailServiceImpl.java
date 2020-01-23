
package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	
	//조회
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
	
	
	//등록
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
	
	public int insertCafeImages(CafeImageVO vo, List<MultipartFile> fileList,MultipartHttpServletRequest request) {
		return detailDao.insertCafeImages(vo,fileList, request);
	}
	   
	// 수정 
	public int modifyCafe(CafeVO cafeVO, List<MultipartFile> logoFile, HttpServletRequest request) {
		int r = detailDao.modifyCafe(cafeVO, logoFile, request);
		return r;
	}
	public int modifyFacility(CafeFacilitiesVO cafeFacilitiesVO) {
		int r = detailDao.modifyFacility(cafeFacilitiesVO);
		return r;
	}
	public int modifyService(CafeServiceVO cafeServiceVO) {
		int r = detailDao.modifyService(cafeServiceVO);
		return r;
	}
	public int modifyMenu(List<CafeMenuVO> cafeMenuVO, List<MultipartFile> menuFileList, MultipartHttpServletRequest request) {
		int r = detailDao.modifyMenu(cafeMenuVO, menuFileList, request);
		return r;
	}
	public int modifyProduct(List<CafeProductVO> cafeProductVO, List<MultipartFile> productFileList,MultipartHttpServletRequest request) {
		int r = detailDao.modifyProduct(cafeProductVO, productFileList, request);
		return r;
	}
	
	public int modifyCafeImages(CafeImageVO vo, List<MultipartFile> fileList,MultipartHttpServletRequest request) {
		return detailDao.modifyCafeImages(vo,fileList, request);
	}
	
	
	// 삭제
	public int deleteCafeInfo(int cafe_id) {
		return detailDao.deleteCafeInfo(cafe_id);
	}
	
	
	public int registReview(ReviewVO vo, MultipartFile file, HttpServletRequest request, CafeRateVO cafeRate) {
		String path = request.getRealPath("/upload");
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, path+"/cafe/");
		vo.setImage(fu.fileName);
		
		int rate_num = cafeRate.getRate_num()+1;
		cafeRate.setRate_num(cafeRate.getClean_sum()+1);
		
		cafeRate.setWifi_sum(cafeRate.getWifi_sum() + vo.getWifi_score());
		cafeRate.setPrice_sum(cafeRate.getPrice_sum() + vo.getPrice_score());
		cafeRate.setTaste_sum(cafeRate.getTaste_sum() + vo.getTaste_score());
		cafeRate.setService_sum(cafeRate.getService_sum() + vo.getService_score());
		cafeRate.setMood_sum(cafeRate.getMood_sum() + vo.getMood_score());
		cafeRate.setClean_sum(cafeRate.getClean_sum() + vo.getClean_score());
		
		cafeRate.setWifi_avg(((cafeRate.getWifi_sum()/(double)rate_num)*100)/100);
		cafeRate.setPrice_avg(((cafeRate.getPrice_sum()/(double)rate_num)*100)/100);
		cafeRate.setTaste_avg(((cafeRate.getTaste_sum()/(double)rate_num)*100)/100);
		cafeRate.setService_avg(((cafeRate.getService_sum()/(double)rate_num)*100)/100);
		cafeRate.setMood_avg(((cafeRate.getMood_sum()/(double)rate_num)*100)/100);
		cafeRate.setClean_avg(((cafeRate.getClean_sum()/(double)rate_num)*100)/100);
		
		
		
		int r = detailDao.registReview(vo, cafeRate);
		return r;
	}
	
	
}
