package util;

public class Page {

	public static String getPageList(int page, int totalpage, String url) {
		// 시작페이지
		int startPage = (page-1)/10*10+1; //15-1 /10*10+1
		// 종료페이지
		int endPage = startPage+10-1;
		if (endPage > totalpage) endPage = totalpage;
				
		String result = "";
		
		// 이전 링크
		if (page <= 1) result += "<li class=\"page-item\"><a class=\"page-link\">Privious</a></li>";
		else result += "<li class=\"page-item\"><a class=\"page-link\" href='"+url+"?page="+(page-1)+"'>Privious</a></li>";
		
		// 반복
		for (int i=startPage; i<=endPage; i++) {
			if (i == page) {
				result +="<li class=\"page-item active\"><a class=\"page-link\" href='" + url + "?page=" + i + "'>" + i
						+ "</a></li>";
			} else {
				result += "<li class=\"page-item\"><a class=\"page-link\" href='"+url+"?page="+i+"'>"+i+"</a></li>";
			}
		}
		
		// 다음 링크
		if (page >= totalpage) result += "<li class=\"page-item\"><a class=\"page-link\">Next</a></li>";
		else result += "<li class=\"page-item\"><a class=\"page-link\" href='"+url+"?page="+(page+1)+"'>Next</a></li>";
		
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
