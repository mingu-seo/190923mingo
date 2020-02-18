<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
	
	<!--부트 스트랩 관련 파일-->
	<%@ include file="/WEB-INF/view/include/headHTML.jsp"%>
	
	<!-- 아이콘 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!-- 내가 만든 파일-->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
	
	<style>
			/* 패기네이션 색깔 */  
		.page-link{
			color:black;

	</style>
</head>
<body>
	<%@ include file="/WEB-INF/view/include/navigation.jsp"%>
	
	<div class="container-fluid mypage-header">
		<div class="mypage-header-wrapper">
			<div class="mypage-name">
				<div class="mypage-img">
					<c:if
						test="${userVO.profile_image != null && userVO.profile_image !=''}">
						<img class="rounded-circle"
							src="<%=request.getContextPath() %>/upload/user/${userVO.profile_image }">
					</c:if>
					<c:if
						test="${!(userVO.profile_image != null && userVO.profile_image !='')}">
						<img class="rounded-circle"
							src="<%=request.getContextPath() %>/img/default/profile.png">
					</c:if>
				</div>
				<div class="mypage-userid">${userVO.nickname }<span
						style="font-size: 0.8em;">님</span>
				</div>
			</div>
		</div>
	</div>
	<!-- mypage 내비게이션 -->
	<%@ include file="/WEB-INF/view/mypage/myNav2.jsp"%>
	
	
	<div class="board-wrapper2">
		<div class="list-group list-group-flush board-side shadow">
			<div class="board-side-name">
				<i class="fa fa-gear ml-2 " style="font-size: 2em;">&nbsp;활동내역</i>
			</div>
			<a href="myReview.do" class="list-group-item mt-2" style="border-top: none;">내가 쓴 리뷰</a> 
			<a href="myPost.do" class="list-group-item" style="font-weight: bold;">내가 쓴 게시글</a> 
			<a href="myCollect.do" class="list-group-item">내가 찜한 카페</a>
		</div>

		<div class=" board-group shadow ml-4">
			<div class="pb-2 mb-4 board-name">내가 쓴 게시글</div>
			
			<!-- contents start --> 
			<ul class="list-group list-group-flush board-main">
                <li class="list-group-item">
                    <div style="float:left;padding:0 14px;">번호</div>
                    <div style="float:left;padding:0 157px;">제목</div>
                    <div style="float:left;padding:0 30px">작성자</div>
                    <div style="float:left;padding:0 30px">등록일</div>
                    <div style="float:left;padding:0 14px">조회</div>
                    <div style="float:left;padding:0 14px">추천</div>
                </li>
                <c:if test="${empty boardList}" >
					<li class="list-group-item">데이터가 없습니다.</li>
				</c:if>
				<c:if test="${not empty boardList}" >
					<c:forEach  items="${boardList}" var="BoardVO">
	                <c:if test="${BoardVO.is_notice == 0}">
	                	<li class="list-group-item">
	                </c:if>
	                <c:if test="${BoardVO.is_notice == 1}">
	                	<li class="list-group-item" style="background-color:#f1f1f1;">
	                </c:if>
	                    <div id="b-num" style="float:left;width:60px;height:24px;">
	                    	<c:if test="${BoardVO.is_notice == 0}">
	                    		${BoardVO.board_id}
	                    	</c:if>
	                    	<c:if test="${BoardVO.is_notice == 1}">
	                    		<div style="color:red;background-color:#ffb3b3;border:1px solid red;
	                    		border-radius:8px;">공지</div>
	                    	</c:if>
	                    </div>
	                    <a href="viewBoard.do?board_id=${BoardVO.board_id }&page=1&type=${BoardVO.type }&s1=0&s2=0&k=" 
	                    id="b-title" style="float:left;width:346px;height:24px;display:block">
			                    <c:if test="${BoardVO.is_notice == 0}">
			                    	${BoardVO.title}
			                    </c:if>
			                    <c:if test="${BoardVO.is_notice == 1}">
			                    	<span style="color:red;font-weight:bold;">${BoardVO.title}</span>
			                    </c:if>
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
	                </c:forEach>
				</c:if>
                
            </ul>
			<!-- contents end --> 
			
			
			<!-- pagination start -->
			<c:if test="${empty boardList }" >
				<ul class="pagination mypagi justify-content-center">
				  <li class="page-item disabled"><a class="page-link" href="#">&#10094;</a></li>
				  <li class="page-item active"><a class="page-link" href="#">1</a></li>
				  <li class="page-item disabled"><a class="page-link" href="#">&#10095;</a></li> 
				</ul>		 
			</c:if>
			<c:if test="${not empty boardList }" >    
				<ul class="pagination mypagi justify-content-center">
					<c:if test="${ pageInfo.page > 1 }">
						<li class="page-item"><a class="page-link" href="myPost.do?page=${pageInfo.page-1}">&#10094;</a></li>
					</c:if>
					<c:if test="${ pageInfo.page <= 1 }">
						<li class="page-item disabled"><a class="page-link">&#10094;</a></li>
					</c:if>
				  
				<c:forEach  var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					<c:if test="${pageInfo.page == i  }">
						<li class="page-item active"><a class="page-link" href="#">${i }</a></li>
					</c:if>
				  <c:if test="${pageInfo.page != i  }">
						<li class="page-item"><a class="page-link" href="myPost.do?page=${i }">${i }</a></li>
					</c:if>
				</c:forEach>
				
					<c:if test="${pageInfo.page >= pageInfo.maxPage }">
						<li class="page-item disabled"><a class="page-link">&#10095;</a></li>
					</c:if>
				  <c:if test="${pageInfo.page < pageInfo.maxPage }">
						<li class="page-item"><a class="page-link" href="myPost.do?page=${pageInfo.page+1}">&#10095;</a></li>
					</c:if> 
				</ul>
			</c:if>
			<!-- pagination end -->
		</div>
	</div>
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>