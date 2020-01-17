
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
import vo.CafeServiceVO;
import vo.CafeVO;  

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
	   
	
}
