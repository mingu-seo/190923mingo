package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AdminDAO;

@Service
public class AdminService {
	@Autowired
	AdminDAO adminDAO;

	public int deleteCafeAdmin(int cafe_id) {
		int[] result = new int[6];
		//cafe테이블 기본정보를 제외한 모든것을 null로 바꾼다.
		result[0] = adminDAO.resetCafe(cafe_id);
		
		//cafe_facilities에서 해당 cafe_id를 모두 제거
		result[1] = adminDAO.deleteCafeFacilitiesFor(cafe_id);
		
		//cafe_image
		result[2] = adminDAO.deleteCafeImageFor(cafe_id);
		
		//cafe_menu
		result[3] = adminDAO.deleteCafeMenuFor(cafe_id);
		
		//cafe_product
		result[4] = adminDAO.deleteCafeProductFor(cafe_id);
		
		//cafe_service
		result[5] = adminDAO.deleteCafeServiceFor(cafe_id);
		
		return 0;
	}
	
	
}
