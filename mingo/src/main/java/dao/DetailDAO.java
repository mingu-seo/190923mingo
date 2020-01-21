

package dao;

import java.util.ArrayList;
import java.util.List;

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
	public List<ReviewVO> viewCafeReview(int cafe_id){
		return sqlSession.selectList("detail.selectViewCafeReview", cafe_id);		
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
	
	public int insertCafeImages(CafeImageVO vo, List<MultipartFile> fileList,MultipartHttpServletRequest request) {
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
	
	
	public int registCafe(CafeVO cafeVO, List<MultipartFile> logoFile, HttpServletRequest request) {
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
	public int registFacility(CafeFacilitiesVO cafeFacilitiesVO) {
		return sqlSession.update("detail.updateFacility", cafeFacilitiesVO);
	}
	public int registService(CafeServiceVO cafeServiceVO) {
		return sqlSession.update("detail.updateService", cafeServiceVO);
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
			int result = sqlSession.update("detail.updateMenu", cafeMenuVO.get(i));
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
			int result = sqlSession.update("detail.updateProduct", cafeProductVO.get(i));
		}
		return 1;
	}
	
	/*
	 * public List<TestVO> memberList(TestVO vo) { return
	 * sqlSession.selectList("test.selectMember", vo); }
	 * 
	 * public int memberInsert(TestVO vo) { return
	 * sqlSession.insert("test.insertMember", vo); }
	 * 
	 * public TestVO memberDetail(int id) { return
	 * sqlSession.selectOne("test.memberDetail", id); }
	 * 
	 * public int memberUpdate(TestVO vo) { return
	 * sqlSession.update("test.updateMember", vo); }
	 * 
	 * public int memberDelete(int id) { return
	 * sqlSession.delete("test.deleteMember", id); }
	 * 
	 * public TestVO loginCheck(HashMap hm) { return
	 * sqlSession.selectOne("test.loginCheck", hm); }
	 */
	
	
	
	
	
	
	
	
	
}
