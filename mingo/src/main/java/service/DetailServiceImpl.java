
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
import vo.CollectCafeVO;
import vo.LikeCafeVO;
import vo.ReviewVO;
import vo.UserVO;  
import org.springframework.util.StringUtils;
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
	public List<ReviewVO> viewCafeReview(Map<String, Integer> reviewMap){
		List<ReviewVO> reviewList = detailDao.viewCafeReview(reviewMap);
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
		CafeServiceVO vo = new CafeServiceVO();
		System.out.println("담요제공여부 : "+vo.getBlanket());
		/* System.out.println("쿠폰 있나? : "+service.getCoupon()); */
		  
		
		/*
		if (service==null) { service.setCafe_service_id(0); }
		 */ 
		
		/*
		try {System.out.println(service.getEvent());} catch (NullPointerException e) {service.setEvent(0);System.out.println("예외발생~!!");}
		try {System.out.println(service.getCoupon());} catch (Exception e) {service.setCoupon(0);}   
		try {System.out.println(service.getMileage());} catch (Exception e) {service.setMileage(0);} 
		try {System.out.println(service.getBlanket());} catch (Exception e) {service.setBlanket(0);}
		try {System.out.println(service.getDrinkrefill());} catch (Exception e) {service.setDrinkrefill(0);}
		 */
		
		return service;  
	}
	public CafeFacilitiesVO viewFacilities(int cafe_id) {
		CafeFacilitiesVO facilities = detailDao.viewFacilities(cafe_id);
		
		/*
		try {System.out.println(facilities.getInterior());} catch (NullPointerException e) {facilities.setInterior(0);}
		try {System.out.println(facilities.getWifi());} catch (Exception e) {facilities.setWifi(0);}
		try {System.out.println(facilities.getTables());} catch (Exception e) {facilities.setTables(0);}
		try {System.out.println(facilities.getMusic());} catch (Exception e) {facilities.setMusic(0);}
		try {System.out.println(facilities.getPlug());} catch (Exception e) {facilities.setPlug(0);}
		try {System.out.println(facilities.getRestroom());} catch (Exception e) {facilities.setRestroom(0);}
		try {System.out.println(facilities.getStudyroom());} catch (Exception e) {facilities.setStudyroom(0);}
		try {System.out.println(facilities.getTerrace());} catch (Exception e) {facilities.setTerrace(0);}
		try {System.out.println(facilities.getSmoking());} catch (Exception e) {facilities.setSmoking(0);}
		try {System.out.println(facilities.getParking());} catch (Exception e) {facilities.setParking(0);}
		*/
		
		return facilities;  
	}
	public CafeRateVO viewCafeRate(int cafe_id) {
		CafeRateVO cafeRate = detailDao.viewCafeRate(cafe_id);
		return cafeRate;
	}
	public int viewLikeCafe(Map<String, Integer> map) {
		LikeCafeVO likeCafe = detailDao.viewLikeCafe(map);
		int result = 0;
		if (likeCafe != null) {
			result = 1;
		} 
		return result;
	}
	public int viewCollectCafe(Map<String, Integer> map) {
		CollectCafeVO collectCafe = detailDao.viewCollectCafe(map);
		int result = 0;
		if (collectCafe != null) {
			result = 1;
		} 
		return result;
	}
	public ReviewVO viewMyReview2(ReviewVO vo) {
		ReviewVO reviewVO = detailDao.viewMyReview2(vo);
		return reviewVO;
	}	
	public int checkManager(int user_id) {
		int cafe_id = detailDao.checkManager(user_id);
		return cafe_id;
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
		fu.fileUpload(file, path+"/review/");
		vo.setImage(fu.fileName);
		
		if(cafeRate==null) {
			cafeRate = new CafeRateVO();
			cafeRate.setCafe_id(vo.getCafe_id());
		}
		
		int rate_num = cafeRate.getRate_num()+1;
		cafeRate.setRate_num(rate_num);
		
		cafeRate.setWifi_sum(cafeRate.getWifi_sum() + vo.getWifi_score());
		cafeRate.setPrice_sum(cafeRate.getPrice_sum() + vo.getPrice_score());
		cafeRate.setTaste_sum(cafeRate.getTaste_sum() + vo.getTaste_score());
		cafeRate.setService_sum(cafeRate.getService_sum() + vo.getService_score());
		cafeRate.setMood_sum(cafeRate.getMood_sum() + vo.getMood_score());
		cafeRate.setClean_sum(cafeRate.getClean_sum() + vo.getClean_score());
		
		cafeRate.setWifi_avg((int)((cafeRate.getWifi_sum()/(double)rate_num)*10)/10.0);
		cafeRate.setPrice_avg((int)((cafeRate.getPrice_sum()/(double)rate_num)*10)/10.0);
		cafeRate.setTaste_avg((int)((cafeRate.getTaste_sum()/(double)rate_num)*10)/10.0);
		cafeRate.setService_avg((int)((cafeRate.getService_sum()/(double)rate_num)*10)/10.0);
		cafeRate.setMood_avg((int)((cafeRate.getMood_sum()/(double)rate_num)*10)/10.0);
		cafeRate.setClean_avg((int)((cafeRate.getClean_sum()/(double)rate_num)*10)/10.0);
		
		double total_score_avg = ((int)(((cafeRate.getClean_avg()+cafeRate.getMood_avg()+cafeRate.getPrice_avg()+cafeRate.getService_avg()+cafeRate.getTaste_avg()+cafeRate.getWifi_avg())/6.0)*10))/10.0;
		cafeRate.setCafe_total_avg(total_score_avg);
		
		double score_avg = ((int)(((vo.getMood_score()+vo.getPrice_score()+vo.getTaste_score()+vo.getWifi_score()+vo.getService_score()+vo.getClean_score())/6.0)*10))/10.0;
		vo.setScore_avg(score_avg);
		
		int r = detailDao.registReview(vo, cafeRate);
		
		
		
		
		
		return r;
	}
	
	public ReviewVO viewReview(ReviewVO vo) {
		ReviewVO reviewVO = detailDao.viewReview(vo);
		return reviewVO;
	}
	
	public int modifyReview(ReviewVO vo_old, ReviewVO vo_new, MultipartFile file, HttpServletRequest request, CafeRateVO cafeRate) {
		String path = request.getRealPath("/upload");
		FileUtil fu = new FileUtil();
		fu.fileUpload(file, path+"/review/");
		if (fu.fileName != null) {
			vo_new.setImage(fu.fileName);
			System.out.println("사진 있음"+vo_new.getImage());
		} else {
			vo_new.setImage(vo_old.getImage());
			System.out.println("사진 없음"+vo_new.getImage());  
		}     
		System.out.println("사진 있음 최종"+vo_new.getImage());
		vo_new.setReview_id(vo_old.getReview_id());
		
		int rate_num = cafeRate.getRate_num();
		cafeRate.setWifi_sum(cafeRate.getWifi_sum() - vo_old.getWifi_score() + vo_new.getWifi_score());
		cafeRate.setPrice_sum(cafeRate.getPrice_sum() - vo_old.getPrice_score() + vo_new.getPrice_score());
		cafeRate.setTaste_sum(cafeRate.getTaste_sum() - vo_old.getTaste_score() + vo_new.getTaste_score());
		cafeRate.setService_sum(cafeRate.getService_sum() - vo_old.getService_score() + vo_new.getService_score());
		cafeRate.setMood_sum(cafeRate.getMood_sum() - vo_old.getMood_score() + vo_new.getMood_score());
		cafeRate.setClean_sum(cafeRate.getClean_sum() - vo_old.getClean_score() + vo_new.getClean_score());
		
		cafeRate.setWifi_avg((int)((cafeRate.getWifi_sum()/(double)rate_num)*10)/10.0);
		cafeRate.setPrice_avg((int)((cafeRate.getPrice_sum()/(double)rate_num)*10)/10.0);
		cafeRate.setTaste_avg((int)((cafeRate.getTaste_sum()/(double)rate_num)*10)/10.0);
		cafeRate.setService_avg((int)((cafeRate.getService_sum()/(double)rate_num)*10)/10.0);
		cafeRate.setMood_avg((int)((cafeRate.getMood_sum()/(double)rate_num)*10)/10.0);
		cafeRate.setClean_avg((int)((cafeRate.getClean_sum()/(double)rate_num)*10)/10.0);
		
		double total_score_avg = ((int)(((cafeRate.getClean_avg()+cafeRate.getMood_avg()+cafeRate.getPrice_avg()+cafeRate.getService_avg()+cafeRate.getTaste_avg()+cafeRate.getWifi_avg())/6.0)*10))/10.0;
		cafeRate.setCafe_total_avg(total_score_avg);
		
		int r = detailDao.modifyReview(vo_new, cafeRate);
		return r;
	}
	
	public int deleteReview(CafeRateVO cafeRate, ReviewVO reviewVO) {
		
		int r = 0;
		int rate_num = cafeRate.getRate_num()-1;
		if( rate_num > 0) {
			cafeRate.setWifi_sum(cafeRate.getWifi_sum() - reviewVO.getWifi_score());
			cafeRate.setPrice_sum(cafeRate.getPrice_sum() - reviewVO.getPrice_score());
			cafeRate.setTaste_sum(cafeRate.getTaste_sum() - reviewVO.getTaste_score());
			cafeRate.setService_sum(cafeRate.getService_sum() - reviewVO.getService_score());
			cafeRate.setMood_sum(cafeRate.getMood_sum() - reviewVO.getMood_score());
			cafeRate.setClean_sum(cafeRate.getClean_sum() - reviewVO.getClean_score());
			
			cafeRate.setWifi_avg((int)((cafeRate.getWifi_sum()/(double)rate_num)*10)/10.0);
			cafeRate.setPrice_avg((int)((cafeRate.getPrice_sum()/(double)rate_num)*10)/10.0);
			cafeRate.setTaste_avg((int)((cafeRate.getTaste_sum()/(double)rate_num)*10)/10.0);
			cafeRate.setService_avg((int)((cafeRate.getService_sum()/(double)rate_num)*10)/10.0);
			cafeRate.setMood_avg((int)((cafeRate.getMood_sum()/(double)rate_num)*10)/10.0);
			cafeRate.setClean_avg((int)((cafeRate.getClean_sum()/(double)rate_num)*10)/10.0);
			
			double total_score_avg = ((int)(((cafeRate.getClean_avg()+cafeRate.getMood_avg()+cafeRate.getPrice_avg()+cafeRate.getService_avg()+cafeRate.getTaste_avg()+cafeRate.getWifi_avg())/6.0)*10))/10.0;
			cafeRate.setCafe_total_avg(total_score_avg);
			
			r = detailDao.deleteReview(cafeRate, reviewVO);
		}else {
			cafeRate.setWifi_sum(0);
			cafeRate.setPrice_sum(0);
			cafeRate.setTaste_sum(0);
			cafeRate.setService_sum(0);
			cafeRate.setMood_sum(0);
			cafeRate.setClean_sum(0);
			
			cafeRate.setWifi_avg(0.0);
			cafeRate.setPrice_avg(0.0);
			cafeRate.setTaste_avg(0.0);
			cafeRate.setService_avg(0.0);
			cafeRate.setMood_avg(0.0);
			cafeRate.setClean_avg(0.0);
			
			double total_score_avg = 0.0;
			cafeRate.setCafe_total_avg(total_score_avg);
			
			r = detailDao.deleteReview(cafeRate, reviewVO);
		}
		return r;
	}  
	
	public int registLike(LikeCafeVO vo) {
		int r = detailDao.registLike(vo);
		return r;
	}
	public int deleteLike(LikeCafeVO vo) {
		int r = detailDao.deleteLike(vo);
		return r;
	}
	public int registCollect(CollectCafeVO vo) {
		int r = detailDao.registCollect(vo);
		return r;
	}
	public int deleteCollect(CollectCafeVO vo) {
		int r = detailDao.deleteCollect(vo);
		return r;
	}
	
}
