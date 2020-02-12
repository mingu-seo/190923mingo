

package dao;

import java.util.ArrayList;
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
		
		for(int i=0; i<menuFileList.size(); i++) {  
			FileUtil fu = new FileUtil(); 
			fu.fileUpload(menuFileList.get(i), path2+"/menu/");
			cafeMenuVO.get(i).setCafe_id(cafe_id);
			cafeMenuVO.get(i).setImage(fu.fileName);
			cafeMenuVO.get(i).setName(menuNameList[i]);
			System.out.println("멀티파트 리퀘스트에... " + menuNameList[i]);
			cafeMenuVO.get(i).setPrice(Integer.parseInt(menuPriceList[i]));
			cafeMenuVO.get(i).setType(Integer.parseInt(menuTypeList[i]));   
			int result = sqlSession.update("detail.insertMenu", cafeMenuVO.get(i));
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
		
		for(int i=0; i<productFileList.size(); i++) {  
			FileUtil fu = new FileUtil(); 
			fu.fileUpload(productFileList.get(i), path2+"/product/");
			cafeProductVO.get(i).setCafe_id(cafe_id);
			cafeProductVO.get(i).setImage(fu.fileName);
			cafeProductVO.get(i).setName(productNameList[i]);
			cafeProductVO.get(i).setPrice(Integer.parseInt(productPriceList[i]));
			cafeProductVO.get(i).setType(Integer.parseInt(productTypeList[i]));
			System.out.println(cafeProductVO.get(i).getName());
			int result = sqlSession.update("detail.insertProduct", cafeProductVO.get(i));
		}
		return 1;
	}
	
	
	
	
	//수정 
	
	public int modifyCafeImages(CafeImageVO vo, List<MultipartFile> fileList,MultipartHttpServletRequest request) {
		String path1 = util.Property.cafe_img_path;
		String path2 = request.getRealPath("/upload");
		
		for(int i=0; i<fileList.size(); i++) {  
			FileUtil fu = new FileUtil(); 
			fu.fileUpload(fileList.get(i), path2+"/cafe/");
			System.out.println(path2+"/cafe/");
			vo.setUrl(fu.fileName);
			int result = sqlSession.update("detail.updateCafeImage", vo);
		}
		return 1;	
	}
	
	
	public int modifyCafe(CafeVO cafeVO, List<MultipartFile> logoFile, HttpServletRequest request) {
		String path1 = util.Property.cafe_img_path;
		String path2 = request.getRealPath("/upload");
		
		for(int i=0; i<logoFile.size(); i++) {  
			FileUtil fu = new FileUtil(); 
			fu.fileUpload(logoFile.get(i), path2+"/cafe/");
			System.out.println(path2+"/cafe/");
			cafeVO.setLogo(fu.fileName);
			int result = sqlSession.update("detail.updateCafe", cafeVO);
		}
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
		
		System.out.println("메뉴리스트 크기"+menuNameList.length);
		
		for(int i=0; i<menuFileList.size(); i++) {  
			FileUtil fu = new FileUtil(); 
			fu.fileUpload(menuFileList.get(i), path2+"/menu/");
			cafeMenuVO.get(i).setCafe_id(cafe_id);
			cafeMenuVO.get(i).setImage(fu.fileName);
			cafeMenuVO.get(i).setName(menuNameList[i]);
			System.out.println("멀티파트 리퀘스트에... " + menuNameList[i]);
			cafeMenuVO.get(i).setPrice(Integer.parseInt(menuPriceList[i]));
			cafeMenuVO.get(i).setType(Integer.parseInt(menuTypeList[i]));   
			int result = sqlSession.update("detail.updateMenu", cafeMenuVO.get(i));
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
		
		for(int i=0; i<productFileList.size(); i++) {  
			FileUtil fu = new FileUtil(); 
			fu.fileUpload(productFileList.get(i), path2+"/product/");
			cafeProductVO.get(i).setCafe_id(cafe_id);
			cafeProductVO.get(i).setImage(fu.fileName);
			cafeProductVO.get(i).setName(productNameList[i]);
			cafeProductVO.get(i).setPrice(Integer.parseInt(productPriceList[i]));
			cafeProductVO.get(i).setType(Integer.parseInt(productTypeList[i]));
			System.out.println(cafeProductVO.get(i).getName());
			int result = sqlSession.update("detail.updateProduct", cafeProductVO.get(i));
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
		sqlSession.update("detail.updateRate", cafeRateVO);
		return 1;
	}
	
	public ReviewVO viewReview(ReviewVO vo) {
		return sqlSession.selectOne("detail.viewReview", vo);
	}
	
	public int modifyReview(ReviewVO reviewVO, CafeRateVO cafeRateVO) {
		System.out.println("dao 사진 있음 최종"+reviewVO.getImage());
		sqlSession.update("detail.updateReview", reviewVO);
		sqlSession.update("detail.updateRate", cafeRateVO);
		return 1;
	}   
	
	public int deleteReview(CafeRateVO cafeRateVO, ReviewVO reviewVO) {
		sqlSession.update("detail.updateRate", cafeRateVO);
		sqlSession.delete("detail.deleteReview", reviewVO);
		
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
