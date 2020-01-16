package util;

import vo.PageInfo;

public class Page {

	public static PageInfo getPageInfo(int page, int limit, int listCount) {
		// 전체페이지수
		int maxPage = listCount / limit;
		if (listCount % limit > 0) maxPage++;
		
		// 시작페이지
		//int startPage = (((int) ((double)page/10+0.9))-1)*10+1;
		int startPage = (page-1)/limit*limit+1; //15-1 /10*10+1
		// 종료페이지
		int endPage = startPage+limit-1;
		
		if (endPage > maxPage) endPage = maxPage;
		
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
		return pageInfo;
	}
	
	// 화면에 페이징처리영역을 생성해주는 기능
	// 매개변수 : 사용자가 요청한 페이지, 전페 페이지 수, url
	// 리턴 : 페이지갯수만큼 <a></a> 반복해서 문자열로 리턴
	public static String getPageList(int page, int totalpage, String url) {
		// 시작페이지
		int startPage = (page-1)/10*10+1; //15-1 /10*10+1
		// 종료페이지
		int endPage = startPage+10-1;
		if (endPage > totalpage) endPage = totalpage;
				
		String result = "";
		
		// 이전 링크
		if (page <= 1) result += "Privious";
		else result += "<li class=\"page-item \"><a class=\"page-link\" href='"+url+"?page="+(page-1)+"'>Privious</a></li>&nbsp;";
		
		result += "";
		return result;
	}
	public static String getPageList1(int page, int totalpage, String url) {
		// 시작페이지
		int startPage = (page-1)/10*10+1; //15-1 /10*10+1
		// 종료페이지
		int endPage = startPage+10-1;
		if (endPage > totalpage) endPage = totalpage;
				
		String result = "";
	// 반복
			for (int i=startPage; i<=endPage; i++) {
				if (i == page) {
					result +="<li class=\"page-item active\"><a class=\"page-link\" href='"+url+"?page="+i+"'>"+i+"</a></li>&nbsp;";
				} else {
					result += "<li class=\"page-item\"><a class=\"page-link\" href='"+url+"?page="+i+"'>"+i+"</a></li>&nbsp;";
				}
			}
			result += "";
			return result;
	}
			public static String getPageList2(int page, int totalpage, String url) {
				// 시작페이지
				int startPage = (page-1)/10*10+1; //15-1 /10*10+1
				// 종료페이지
				int endPage = startPage+10-1;
				if (endPage > totalpage) endPage = totalpage;
						
				String result = "";
			// 다음 링크
			if (page >= totalpage) result += "Next";
			else result += "<li class=\"page-item\"><a class=\"page-link\" href='"+url+"?page="+(page+1)+"'>Next</a></li>&nbsp;";
			
			result += "";
			return result;
			}
//	public static  void main(String[] args) {
//		String p = getPageList(11, 2, "list.do");
//		String p1 = getPageList1(1, 2, "list.do");
//		String p2 = getPageList2(1, 3, "list.do");
//		System.out.println(p);
//		System.out.println(p1);
//		System.out.println(p2);
//	}
	
	
}
