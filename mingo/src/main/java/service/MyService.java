package service;

import java.util.List;

import org.springframework.stereotype.Service;
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


public interface MyService {
	public UserVO viewUserInfo(int user_id);
	public CafeVO viewCafe(int user_id);
	public CafeRateVO viewCafeRate(int cafe_id);
	public List<ReviewVO> viewReview(int user_id);
	public List<CafeVO> viewCafe(List<ReviewVO> reviews);
	
}
