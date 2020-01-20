package service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dao.MyDAO;
import vo.CafeRateVO;
import vo.CafeVO;
import vo.ReviewVO;
import vo.UserVO;



@Service
public class MyServiceImpl implements MyService{
	
	@Autowired
	private MyDAO myDao; 
	
	public UserVO viewUserInfo(int user_id) {
		UserVO userVO = myDao.viewUserInfo(user_id);
		return userVO;
	}
	
	public CafeVO viewCafe(int user_id) {
		CafeVO cafe = myDao.viewCafe(user_id);
		return cafe;
	}
	public CafeRateVO viewCafeRate(int cafe_id) {
		CafeRateVO cafeRate = myDao.viewCafeRate(cafe_id);
		return cafeRate;	
	}
	public List<ReviewVO> viewReview(int user_id){		
		List<ReviewVO> reviews = myDao.viewReview(user_id);
		return reviews;
	}
	public List<CafeVO> viewCafe(List<ReviewVO> reviews){
		List<CafeVO> cafeList = myDao.viewCafe(reviews);		
		return cafeList;
	}

}
