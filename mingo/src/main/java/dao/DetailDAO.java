

package dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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

@Repository
public class DetailDAO {
    
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public CafeVO viewCafe(int cafe_id) {
		return sqlSession.selectOne("detail.selectCafe_BasicInfo", cafe_id);
	}
	public CafeRateVO viewCafeRate(int cafe_id) {
		return sqlSession.selectOne("detail.selectCafeRate", cafe_id);
	}
	
	public List<CafeImageVO> viewCafeImages(int cafe_id){
		return sqlSession.selectList("detail.selectViewCafeImage", cafe_id);		
	}
	public List<ReviewVO> viewCafeReview(Map<String, Integer> reviewMap){
		return sqlSession.selectList("detail.selectViewCafeReview", reviewMap);		
	}
	public List<UserVO> viewUserList(int[] userList){
		List<UserVO> userVOList = new ArrayList<UserVO>();
		for (int i = 0; i < userList.length; i++) {
			userVOList.add(sqlSession.selectOne("detail.selectViewUserList", userList[i]));		
		} 
		return userVOList;
	}
	
	public List<CafeMenuVO> viewMenu(int cafe_id){
		return sqlSession.selectList("detail.selectViewMenu", cafe_id);			
	}
	public List<CafeProductVO> viewProduct(int cafe_id){
		return sqlSession.selectList("detail.selectViewProduct", cafe_id);			
	}
	public CafeServiceVO viewService(int cafe_id) {
		return sqlSession.selectOne("detail.selectViewService", cafe_id);
	}
	public CafeFacilitiesVO viewFacilities(int cafe_id) {
		return sqlSession.selectOne("detail.selectViewFacilities", cafe_id);
	}
	public LikeCafeVO viewLikeCafe(Map<String, Integer> map) {
		return sqlSession.selectOne("detail.viewLikeCafe", map);
	}
	public CollectCafeVO viewCollectCafe(Map<String, Integer> map) {
		return sqlSession.selectOne("detail.viewCollectCafe", map);
	}
	public ReviewVO viewMyReview2(ReviewVO vo) {
		return sqlSession.selectOne("detail.viewMyReview2", vo);
	}
	public int checkManager(int user_id) {
		return sqlSession.selectOne("detail.checkManager", user_id);
		
	}
	
	
	//등록
	
	
	public int insertCafeImages(CafeImageVO vo, List<MultipartFile> fileList,MultipartHttpServletRequest request) {
		String path1 = util.Property.cafe_img_path;
		String path2 = request.getRealPath("/upload");
		
		for(int i=0; i<fileList.size(); i++) {  
			FileUtil fu = new FileUtil(); 
			fu.fileUpload(fileList.get(i), path2+"/cafe/");
			System.out.println(path2+"/cafe/");
			vo.setUrl(fu.fileName);
			int result = sqlSession.update("detail.insertCafeImage", vo);
		}
		return 1;	
	}
	
	
	public int registCafe(CafeVO cafeVO, List<MultipartFile> logoFile, HttpServletRequest request) {
		String path1 = util.Property.cafe_img_path;
		String path2 = request.getRealPath("/upload");
		
		for(int i=0; i<logoFile.size(); i++) {  
			FileUtil fu = new FileUtil(); 
			fu.fileUpload(logoFile.get(i), path2+"/cafe/");
			System.out.println(path2+"/cafe/");
			cafeVO.setLogo(fu.fileName);
			int result = sqlSession.insert("detail.insertCafe", cafeVO);
		}
		return 1;
	}
	public int registFacility(CafeFacilitiesVO cafeFacilitiesVO) {
		return sqlSession.update("detail.insertFacility", cafeFacilitiesVO);
	}
	public int registService(CafeServiceVO cafeServiceVO) {
		return sqlSession.update("detail.insertService", cafeServiceVO);
	}  
	public int registMenu(List<CafeMenuVO> cafeMenuVO, List<MultipartFile> menuFileList, MultipartHttpServletRequest request) {
		String path1 = util.Property.cafe_img_path;
		String path2 = request.getRealPath("/upload");  
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		String[] menuNameList = request.getParameterValues("menu_name");
		String[] menuPriceList = request.getParameterValues("menu_price");
		String[] menuTypeList = request.getParameterValues("menu_type");
		  
		System.out.println("메뉴리스트 크기"+menuNameList.length);
		System.out.println("메뉴 사진 리스트 크기는? : " +menuFileList.size());
		System.out.println("메뉴 사진 리스트 두 번째는? : " + menuFileList.get(1));
		
		for(int i=0; i<menuFileList.size(); i++) {
			CafeMenuVO vo = new CafeMenuVO();
			FileUtil fu = new FileUtil(); 
			fu.fileUpload(menuFileList.get(i), path2+"/menu/");
			vo.setCafe_id(cafe_id);
			vo.setImage(fu.fileName);
			vo.setName(menuNameList[i]);
			System.out.println("멀티파트 리퀘스트에... " + menuNameList[i]);
			vo.setPrice(Integer.parseInt(menuPriceList[i]));
			vo.setType(Integer.parseInt(menuTypeList[i]));   
			int result = sqlSession.insert("detail.insertMenu", vo);
		}
		return 1;
	}  
	public int registProduct(List<CafeProductVO> cafeProductVO, List<MultipartFile> productFileList,MultipartHttpServletRequest request) {
		String path1 = util.Property.cafe_img_path;
		String path2 = request.getRealPath("/upload");
		
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		String[] productNameList = request.getParameterValues("product_name");
		String[] productPriceList = request.getParameterValues("product_price");
		String[] productTypeList = request.getParameterValues("product_type");
		
		System.out.println("상품리스트 크기"+productNameList.length);
		System.out.println("상품 사진 리스트 크기는? : " + productFileList.size());
		System.out.println("상품 사진 리스트 두 번째는? : " + productFileList.get(1));
		
		  
		for(int i=0; i<productFileList.size(); i++) {  
			CafeProductVO vo = new CafeProductVO();
			FileUtil fu = new FileUtil(); 
			fu.fileUpload(productFileList.get(i), path2+"/product/");
			vo.setCafe_id(cafe_id);
			vo.setImage(fu.fileName);
			vo.setName(productNameList[i]);
			vo.setPrice(Integer.parseInt(productPriceList[i]));
			vo.setType(Integer.parseInt(productTypeList[i]));
			
			int result = sqlSession.insert("detail.insertProduct", vo);
		}
		return 1;
	}
	
	
	
	
	//수정 
	
	public int modifyCafeImages(CafeImageVO vo, List<MultipartFile> fileList,MultipartHttpServletRequest request) {
		String path1 = util.Property.cafe_img_path;
		String path2 = request.getRealPath("/upload");
		
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		List<CafeImageVO> old_vo = sqlSession.selectList("detail.selectViewCafeImage", cafe_id);
		String[] new_vo = request.getParameterValues("cafe_image_id"); 
		System.out.println("수정 과정에 있는 카페 사진 수 : " + fileList.size());
		
		
		//제거 아이디 후보 목록
		List<Integer> delete_id = new ArrayList<Integer>();
		for (int i = 0; i < old_vo.size(); i++) {
			if(old_vo.get(i) != null) {
				delete_id.add(old_vo.get(i).getCafe_image_id());				
			}
		}
		
		for(int i=0; i<fileList.size(); i++) {  
			FileUtil fu = new FileUtil(); 
			fu.fileUpload(fileList.get(i), path2+"/cafe/");
			System.out.println(path2+"/cafe/");
			
			CafeImageVO vo1 = new CafeImageVO();
			vo1.setCafe_id(cafe_id);
			
			// 기존 개별 이미지 섹션에 새로 사진을 등록했는지 확인 
			if(fu.fileName==null) {
				for (int j = 0; j < old_vo.size(); j++) {
					if (old_vo.get(j) != null) {
						if(old_vo.get(j).getCafe_image_id()==Integer.parseInt(new_vo[i])) {
							vo1.setUrl(old_vo.get(j).getUrl());
						}						
					}
				}
			} else {
				vo1.setUrl(fu.fileName);
			}
			
			if(Integer.parseInt(new_vo[i]) != 0) {
				//수정
				vo1.setCafe_image_id(Integer.parseInt(new_vo[i]));
				int result = sqlSession.update("detail.updateCafeImage", vo1);
			} else {
				//추가
				System.out.println("추가할 이미지 : "+vo1.getUrl());
				sqlSession.insert("detail.insertCafeImage", vo1);
			}   
			
			// 제거 아이디 확인
			for (int j = 0; j < delete_id.size(); j++) {
				if(delete_id.get(j) == Integer.parseInt(new_vo[i])) {
					delete_id.remove((Integer)Integer.parseInt(new_vo[i]));
				}
			}
		}
		
		//제거
		if (delete_id.size() > 0) {
			for (int j = 0; j < delete_id.size(); j++) {
				sqlSession.delete("detail.deleteCafeImageByKey", delete_id.get(j));
			}
			
		}
		
		return 1;	
	}    
	
	
	public int modifyCafe(CafeVO cafeVO, List<MultipartFile> logoFile, HttpServletRequest request) {
		String path1 = util.Property.cafe_img_path;
		String path2 = request.getRealPath("/upload");
		
		if(logoFile.size()>0) {
			for(int i=0; i<logoFile.size(); i++) {  
				FileUtil fu = new FileUtil(); 
				fu.fileUpload(logoFile.get(i), path2+"/cafe/");
				System.out.println(path2+"/cafe/");
				cafeVO.setLogo(fu.fileName);
			}			
		} 
		int result = sqlSession.update("detail.updateCafe", cafeVO);
		
		return 1;   
	}
	public int modifyFacility(CafeFacilitiesVO cafeFacilitiesVO) {
		return sqlSession.update("detail.updateFacility", cafeFacilitiesVO);
	}
	public int modifyService(CafeServiceVO cafeServiceVO) {
		return sqlSession.update("detail.updateService", cafeServiceVO);
	}
	public int modifyMenu(List<CafeMenuVO> cafeMenuVO, List<MultipartFile> menuFileList, MultipartHttpServletRequest request) {
		String path1 = util.Property.cafe_img_path;
		String path2 = request.getRealPath("/upload");
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		String[] menuNameList = request.getParameterValues("menu_name");
		String[] menuPriceList = request.getParameterValues("menu_price");
		String[] menuTypeList = request.getParameterValues("menu_type");
		
		
		List<CafeMenuVO> old_vo= sqlSession.selectList("detail.selectViewMenu", cafe_id);	
		String[] new_vo = request.getParameterValues("cafe_menu_id"); 
		
		System.out.println("원래 메뉴 수 : "+old_vo.size());   
		//제거 아이디 후보 목록
		List<Integer> delete_id = new ArrayList<Integer>();
		for (int i = 0; i < old_vo.size(); i++) {
			if(old_vo.get(i)!=null) {
				delete_id.add(old_vo.get(i).getCafe_menu_id());				
			}
		}
		
		
		for(int i=0; i<menuFileList.size(); i++) {  
			FileUtil fu = new FileUtil(); 
			fu.fileUpload(menuFileList.get(i), path2+"/menu/");
			
			CafeMenuVO vo1 = new CafeMenuVO();
			vo1.setCafe_id(cafe_id);
			if(menuNameList != null) {
				vo1.setName(menuNameList[i]);				
				System.out.println("멀티파트 리퀘스트에... " + menuNameList[i]);
			}
			if(menuPriceList != null) {
				vo1.setPrice(Integer.parseInt(menuPriceList[i]));				
			}
			if(menuTypeList != null) {
				vo1.setType(Integer.parseInt(menuTypeList[i]));  				
			}
			
			// 기존 개별 이미지 섹션에 새로 사진을 등록했는지 확인 
			if(fu.fileName==null) {
				for (int j = 0; j < old_vo.size(); j++) {
					if(old_vo.get(j) != null) {
						if(old_vo.get(j).getCafe_menu_id()==Integer.parseInt(new_vo[i])) {
							vo1.setImage(old_vo.get(j).getImage());
						}						
					}
				}
			} else {
				vo1.setImage(fu.fileName);
			}
			
			if(Integer.parseInt(new_vo[i]) != 0) {
				//수정
				vo1.setCafe_menu_id(Integer.parseInt(new_vo[i]));
				int result = sqlSession.update("detail.updateMenu", vo1);
			} else {
				//추가
				sqlSession.insert("detail.insertMenu", vo1);
			}	
			
			// 제거 아이디 확인
			for (int j = 0; j < delete_id.size(); j++) {
				if(delete_id.get(j) == Integer.parseInt(new_vo[i])) {
					delete_id.remove((Integer)Integer.parseInt(new_vo[i]));
				}
			}
		}
		//제거
		if (delete_id.size() > 0) {
			for (int j = 0; j < delete_id.size(); j++) {
				sqlSession.delete("detail.deleteCafeMenuByKey", delete_id.get(j));
			}			
		}
		
		return 1;  
	}
	public int modifyProduct(List<CafeProductVO> cafeProductVO, List<MultipartFile> productFileList,MultipartHttpServletRequest request) {
		String path1 = util.Property.cafe_img_path;
		String path2 = request.getRealPath("/upload");
		
		int cafe_id = Integer.parseInt(request.getParameter("cafe_id"));
		String[] productNameList = request.getParameterValues("product_name");
		String[] productPriceList = request.getParameterValues("product_price");
		String[] productTypeList = request.getParameterValues("product_type");
		
		List<CafeProductVO> old_vo = sqlSession.selectList("detail.selectViewProduct", cafe_id);	
		String[] new_vo = request.getParameterValues("cafe_product_id"); 
		
		//제거 아이디 후보 목록
		List<Integer> delete_id = new ArrayList<Integer>();
		for (int i = 0; i < old_vo.size(); i++) {
			if (old_vo.get(i) != null) {
				delete_id.add(old_vo.get(i).getCafe_product_id());				
			}
		}
		
		for(int i=0; i<productFileList.size(); i++) {  
			FileUtil fu = new FileUtil(); 
			fu.fileUpload(productFileList.get(i), path2+"/product/");
			
			CafeProductVO vo1 = new CafeProductVO();
			vo1.setCafe_id(cafe_id);
			if(productNameList != null) {
				vo1.setName(productNameList[i]);				
			}
			if(productPriceList != null) {
				vo1.setPrice(Integer.parseInt(productPriceList[i]));				
			}
			if(productTypeList != null) {
				vo1.setType(Integer.parseInt(productTypeList[i]));				
			}
			 
			// 기존 개별 이미지 섹션에 새로 사진을 등록했는지 확인 
			if(fu.fileName==null) {
				for (int j = 0; j < old_vo.size(); j++) {
					if(old_vo.get(j) != null) {
						if(old_vo.get(j).getCafe_product_id()==Integer.parseInt(new_vo[i])) {
							vo1.setImage(old_vo.get(j).getImage());
						}						
					}
				}
			} else {
				vo1.setImage(fu.fileName);
			}  
			
			
			if(Integer.parseInt(new_vo[i]) != 0) {
				//수정
				vo1.setCafe_product_id(Integer.parseInt(new_vo[i]));
				int result = sqlSession.update("detail.updateProduct", vo1);
			} else {
				//추가
				sqlSession.insert("detail.insertProduct", vo1);
			}
			
			// 제거 아이디 확인
			for (int j = 0; j < delete_id.size(); j++) {
				if(delete_id.get(j) == Integer.parseInt(new_vo[i])) {
					delete_id.remove((Integer)Integer.parseInt(new_vo[i]));
				}
			}
		}
		
		//제거
		if (delete_id.size() > 0) {
			for (int j = 0; j < delete_id.size(); j++) {
				sqlSession.delete("detail.deleteCafeProductByKey", delete_id.get(j));
			}			
		}
		return 1;
	}
	
	
	public int deleteCafeInfo(int cafe_id) {
		int result0 = sqlSession.update("detail.deleteCafe", cafe_id);
		int result1 = sqlSession.delete("detail.deleteCafeImage", cafe_id);
		int result2 = sqlSession.delete("detail.deleteFacility", cafe_id);
		int result3 = sqlSession.delete("detail.deleteService", cafe_id);
		int result4 = sqlSession.delete("detail.deleteMenu", cafe_id);
		int result5 = sqlSession.delete("detail.deleteProduct", cafe_id);
		return 1;  
	}
	
	
	public int registReview(ReviewVO reviewVO, CafeRateVO cafeRateVO) {
		sqlSession.insert("detail.insertReview", reviewVO);
		CafeRateVO check = sqlSession.selectOne("detail.selectCafeRate", reviewVO.getCafe_id());
		if(check==null) {
			sqlSession.insert("detail.insertRate", cafeRateVO);			
		} else {
			sqlSession.update("detail.updateRate", cafeRateVO);
		}
		sqlSession.update("detail.updateRateToCafe", cafeRateVO);
		return 1;
	}
	
	public ReviewVO viewReview(ReviewVO vo) {
		return sqlSession.selectOne("detail.viewReview", vo);
	}
	
	public int modifyReview(ReviewVO reviewVO, CafeRateVO cafeRateVO) {
		System.out.println("dao 사진 있음 최종"+reviewVO.getImage());
		sqlSession.update("detail.updateReview", reviewVO);
		sqlSession.update("detail.updateRate", cafeRateVO);
		sqlSession.update("detail.updateRateToCafe", cafeRateVO);
		return 1;
	}   
	
	public int deleteReview(CafeRateVO cafeRateVO, ReviewVO reviewVO) {
		sqlSession.update("detail.updateRate", cafeRateVO);
		sqlSession.delete("detail.deleteReview", reviewVO);
		sqlSession.update("detail.updateRateToCafe", cafeRateVO);
		return 1;
	}
	public int registLike(LikeCafeVO vo) {
		int r = sqlSession.insert("detail.registLike", vo);
		return r;
	}
	public int deleteLike(LikeCafeVO vo) {
		sqlSession.delete("detail.deleteLike", vo);
		return 1;
	}
	public int registCollect(CollectCafeVO vo) {
		int r = sqlSession.insert("detail.registCollect", vo);
		return r;
	}
	public int deleteCollect(CollectCafeVO vo) {
		sqlSession.delete("detail.deleteCollect", vo);
		return 1;
	}
	
	
}
