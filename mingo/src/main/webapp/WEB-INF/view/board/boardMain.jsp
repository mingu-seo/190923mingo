<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@page import="vo.BoardVO" %>
    <%@page import="util.Page"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<%
int listcount = (Integer)request.getAttribute("listcount"); // 전체 갯수 (model에 저장한 "listcount")
List<BoardVO> list = (List<BoardVO>)request.getAttribute("list"); // 목록 (model에 저장한 "list")
BoardVO vo = (BoardVO)request.getAttribute("vo");	// vo객체 (model 저장한 "vo")
int totalpage = (Integer)request.getAttribute("totalpage"); // 전체페이지수 (model에 저장한 "totalpage")


%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <!-- 헤더파일들 include -->
		<%@ include file="/WEB-INF/view/include/headHTML.jsp"%>
		
		
    <!-- 내가 만든 파일-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/boardScript.js"></script>
    <script>
    	
    	
    	
    	var s1 = ${s1};
    	var s2 = ${s2};
    	var k = '${k}';
    	
    </script>
</head>

<body>
    <!-- 내비게이션 include -->
		<%@ include file="/WEB-INF/view/include/navigation.jsp"%>
		
    <div class="board-wrapper">
    		<%@ include file="/WEB-INF/view/board/boardSideMenu.jsp" %>
        
        <div class=" board-group shadow ml-4">
            <div class="mb-4" style="font-size:2em;">
            <c:if test="${vo.type == 1 }">
            	자유게시판
            </c:if>
            <c:if test="${vo.type == 2 }">
            	정보게시판
            </c:if>
            <c:if test="${vo.type == 3 }">
            	취업게시판
            </c:if>
              		 
            </div>
            
            <div class="list-group list-group-flush board-main">
                <li class="list-group-item">
                    <div style="float:left;padding:0 14px;">번호</div>
                    <div style="float:left;padding:0 157px;">제목</div>
                    <div style="float:left;padding:0 30px">작성자</div>
                    <div style="float:left;padding:0 30px">등록일</div>
                    <div style="float:left;padding:0 14px">조회</div>
                    <div style="float:left;padding:0 14px">추천</div>
                </li>
                <c:forEach  items="${list}" var="BoardVO">
                <li class="list-group-item">
                    <div id="b-num" style="float:left;width:60px;height:24px;">${BoardVO.board_id}</div>
                    <a href="viewBoard.do?board_id=${BoardVO.board_id}&page=<%=vo.getPage()%>&type=<%=vo.getType()%>&s1=${s1}&s2=${s2}&k=${k}" 
                    id="b-title" style="float:left;width:346px;height:24px;display:block">${BoardVO.title}
                    		<!--  리플 없으면 아무것도 안띄우고 1개라도 있으면 빨간색으로 [3]이런식으로 표시 -->
                    		<c:if test="${BoardVO.reply_num > 0 }">
                    			<span style="color:red;text-align:center;" >&nbsp;[${BoardVO.reply_num }]</span>
                    		</c:if>
                    		
                    </a>
                    <div id="b-username" style="float:left;width:108px;height:24px;">${BoardVO.nickname}</div>
                    <div id="b-regdate" style="float:left;width:108px;height:24px;">
                    	<!-- 날짜 계산 시작-->
												<c:set value="${BoardVO.regdate }" var="dateString"/>
												<fmt:parseDate value="${dateString }" var="dateObject" pattern="yyyy-MM-dd HH:mm:ss" />
												<fmt:parseNumber value="${dateObject.time / (1000*60*60*24) }" integerOnly="true" var="past_D"/>
												
												<c:set value="<%= new Date() %>" var="nowDate"/>
												<fmt:parseNumber value="${nowDate.time / (1000*60*60*24)}" integerOnly="true" var="now_D" />
												
												<fmt:parseNumber value="${now_D - past_D }" var="sub_D" integerOnly="true"/>  
												<!--  게시한지 1일 이상이면 년월일 표시 -->
												<c:if test="${ sub_D >= 1  }">
													<fmt:formatDate value="${BoardVO.regdate}" pattern="yyyy.MM.dd"/>
												</c:if>
												<!-- 게시한지 1일 이하면 시간:분 으로 표시 -->
												<c:if test="${ sub_D < 1  }">
														<fmt:formatDate value="${BoardVO.regdate}" pattern="HH:mm"/>
												</c:if>
												<!--  날짜 계산 끝 -->
                    	
                    </div>
                    <div id="b-readcount" style="float:left;width:60px;height:24px;">${BoardVO.readcount}</div>
                    <div id="b-goodcount" style="float:left;width:60px;height:24px;">${BoardVO.like_num }</div> 
                </li>
                </c:forEach>
            </div>
            
            <ul class="pagination mypagi justify-content-center">
            <% int type = vo.getType(); %>
            <%=Page.getPageList(vo.getPage(), totalpage, "listBoard.do?type="+type) %>
            
            <!--     <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item "><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">6</a></li>
                <li class="page-item"><a class="page-link" href="#">7</a></li>
                <li class="page-item"><a class="page-link" href="#">8</a></li>
                <li class="page-item"><a class="page-link" href="#">9</a></li>
                <li class="page-item"><a class="page-link" href="#">10</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li> -->
                <button type="button" class="btn btn-secondary btn-write" onclick="location.href='writeBoard.do?type=<%=vo.getType()%>&page=<%=vo.getPage()%>&s1=${s1}&s2=${s2}&k=${k}' ">글쓰기</button>
            </ul>
            <form action="listBoard.do?" id="filter-form">
            	<input type="hidden" name="page"  value="<%=vo.getPage()%>"/>
            	<input type="hidden" name="totalpage"  value="${totalpage }"/>
            	<input type="hidden" name="type"  value="${type}"/>  
            	
	            <div class="input-group justify-content-center">
	                <div class="input-group-prepend">
	                    <select class="form-control filter" name="s1" id="s1">
	                        <option value="0">전체기간</option>
	                        <option value="1">1주</option>
	                        <option value="2">1개월</option>
	                        <option value="3">1년</option>
	                    </select>
	                    <select class="form-control filter" name="s2" id="s2">
	                        <option value="0">제목</option>   
	                        <option value="1">내용</option>
	                        <option value="2">글쓴이</option>
	                        <option value="3">제목+내용</option>
	                    </select>
	                    
	                    <input type="text" class="form-control mr-2" style="width:188px" name="k" id="k">
	                    <button type="button" class="form-control" style="width:80px;" onclick="filterSearch();">검색</button>
	                </div>
	                
	            </div>
            </form>
        </div>
    </div>

   <!-- 푸터 include -->
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>