<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date"%>
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
		}
		.page-item.active .page-link{
		    border-color:gray;
		    background-color: gray;
		}  
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
                <i class="fa fa-gear ml-2 " style="font-size:2em;">&nbsp;활동내역</i>
            </div>
            <a href="myReview.do" class="list-group-item mt-2" style="border-top:none;">내가 쓴 리뷰</a>
            <a href="myPost.do" class="list-group-item">내가 쓴 게시글</a>
            <a href="myCollect.do" class="list-group-item" style="font-weight:bold;">내가 찜한 카페</a>
        </div>
        <div class=" board-group shadow ml-4">
            <div class="pb-2 mb-4 board-name">내가 찜한 카페</div>
            
            <!-- contents start --> 
			<!--  리스트가 비어있을 경우 -->
			<c:if test="${empty cafeList }">
					<h5> 검색결과 0 건</h5>
					<table class="table table-bordered table-hover table-strip" style="width:100%;">
						<thead class="thead-light">
							<tr>
								<th style="width:105px;">로고</th>
								<th style="width:150px;">이름</th>
								<th style="width:200px;">주소</th>
								<th style="width:100px;">평점</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="8">검색 결과가 없습니다.</td>
							</tr>
						</tbody>
					</table>
			</c:if>
			<!--  리스트가 비어있지 않을 경우 -->
			<c:if test="${ not empty cafeList }">
				<h5> 검색결과 ${ pageInfo.listCount }&nbsp;건</h5>
				<table class="table table-bordered table-hover table-strip" style="width:1140px;">
					<thead  class="thead-light">
						<tr>
							<th style="width:105px;text-align:center;">로고</th>
							<th style="width:150px;text-align:center;">이름</th>
							<th style="width:200px;text-align:center;">주소</th>
							<th style="width:100px;text-align:center;">평점</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${cafeList}" varStatus="i">
							<tr>
								<td><img  class="rounded-circle bg-white" src="./img/brandLogo/${item.logo }" style="width: 80px;height:80px"></td>
								<td>
									<div><a href="detailView.do?cafe_id=${item.cafe_id }" style="color:black;">${item.name } ${item.branch }</a></div>
								</td>
								<td>${ item.cafe_address}</td>
								<td>
									<div>${(item.rate_avg eq null ? 0.0:item.rate_avg) }</div>  
									<div class="progress">
									  <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" style="width:${item.rate_avg * 20}%"></div>
									</div>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
			</c:if>
			<!-- contents end --> 
			
			<!-- pagination start -->
			<c:if test="${empty cafeList }" >
				<ul class="pagination mypagi justify-content-center">
				  <li class="page-item disabled"><a class="page-link" href="#">&#10094;</a></li>
				  <li class="page-item active"><a class="page-link" href="#">1</a></li>
				  <li class="page-item disabled"><a class="page-link" href="#">&#10095;</a></li> 
				</ul>		 
			</c:if>
			<c:if test="${not empty cafeList }" >
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