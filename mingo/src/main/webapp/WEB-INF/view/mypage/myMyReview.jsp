<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/review.css">
	<style>
		#my-review-title{margin-bottom:100px;}  
		
		/* 패기네이션 색깔 */  
		.page-link{
			color:black;
		}
		.page-item.active .page-link{
		    border-color:gray;
		    background-color: gray;
		} 
	</style>
	<script>
	//deleteReview.do?cafe_id=${review.cafe_id}
	function deleteMyReview(cafe_id){
		var chk =  confirm("삭제하시겠습니까?");
		if (chk){
					location.href="deleteReview.do?cafe_id="+cafe_id;
		}else{event.preventDefault();}
	}
	</script>
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
            <a href="myReview.do" class="list-group-item mt-2" style="border-top:none;font-weight:bold;">내가 쓴 리뷰</a>
            <a href="myPost.do" class="list-group-item">내가 쓴 게시글</a>
            <a href="myCollect.do" class="list-group-item">내가 찜한 카페</a>
        </div>
            
        <div class=" board-group shadow ml-4">
            <div class="pb-2 mb-4 board-name">내가 쓴 리뷰 </div>
            
            <!-- contents start --> 
						<!--  리스트가 비어있을 경우 -->
						<c:if test="${empty reviewList }">
								<ul class="list-group list-group-flush board-main">
				                <li class="list-group-item">
				                    <div  style="line-height:200px;height:200px;font-size:1.5em;color:#e1e1e1;" >남긴 리뷰가 없습니다.</div>
				                </li>
			                </ul>
						</c:if>
						
						
						<!--  리스트가 비어있지 않을 경우 -->
						<c:if test="${ not empty reviewList }">
						<ul class="list-group list-group-flush board-main">
						<c:forEach var="review" items="${reviewList}" varStatus="status">
						<li class="list-group-item">
							<div class="my_review_each">
								
								<div class="my_review_top">
									<div class="rated_cafe_info">   
										<div>
											<img src="./img/brandLogo/${review.logo }" />
										</div>
										<h2>${review.name }</h2>
										<h2>${review.branch }</h2>
										
									</div>
									<div class="my_rating">
										<div id="my_rate_header">
											<img src="img/star_colored.png">
											<span>내 점수</span>  
											<span>${review.score_avg }</span>
										</div>
										<div class="my_rate_each2" >
											<span class="my_rate_visual" id="my_taste_visual">
												<img src="img/taste.png">
											</span>
											<span class="my_rate_name" id="my_taste_name">taste - </span>
											<span class="my_my_rate">${review.taste_score }점</span>
										</div>
										<div class="my_rate_each2" >
											<span class="my_rate_visual" id="my_price_visual">
												<img src="img/price.png">
											</span>
											<span class="my_rate_name" id="my_price_name">price - </span>
											<span class="my_my_rate">${review.price_score }점</span>
										</div>
										<div class="my_rate_each2" >
											<span class="my_rate_visual" id="my_service_visual">
												<img src="img/service.png">
											</span>
											<span class="my_rate_name" id="my_service_name">service - </span>
											<span class="my_my_rate">${review.service_score }점</span>
										</div>
										<div class="my_rate_each2" >
											<span class="my_rate_visual" id="my_facimood_visual">
												<img src="img/mood.png">
											</span>
											<span class="my_rate_name" id="my_facimood_name">mood - </span>
											<span class="my_my_rate">${review.mood_score }점</span>
										</div>
										<div class="my_rate_each2" >
											<span class="my_rate_visual" id="my_wifiplug_visual">
												<img src="img/wifi.png">
											</span>
											<span class="my_rate_name" id="my_wifiplug_name">wifi - </span>
											<span class="my_my_rate">${review.wifi_score }점</span>
										</div>  
										<div class="my_rate_each2" >
											<span class="my_rate_visual" id="my_clean_visual">
												<img src="img/clean.png">
											</span>
											<span class="my_rate_name" id="my_clean_name">clean - </span>
											<span class="my_my_rate">${review.clean_score }점</span>
										</div>
									</div>	
								</div>
								
								<div class="my_review_bottom">  
									<div>
										<!--  널이 아닐때만 이미지 출력 -->  
										<c:if test="${review.image !=null }">
											<img src="<%=request.getContextPath() %>/upload/review/${review.image }"/>
										</c:if>
										<c:if test="${review.image ==null }">
											<img src="img/default_review.png"/>
										</c:if>
									</div> 
									<div class="my_comment">
										${review.contents}
									</div>
									<p id="regdate">
										<fmt:parseDate var="sDate" value="${review.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
										꒐ <fmt:formatDate value="${sDate}" pattern="yyyy-MM-dd" />&nbsp;
									</p>
									<a id="delete" href="javascript:void(0);" onclick="deleteMyReview(${review.cafe_id});">삭제</a>&nbsp;
									<a id="blank">꒐</a>&nbsp;
									<a id="modify" href="modifyReviewForm.do?cafe_id=${review.cafe_id}">수정</a>&nbsp;
								</div>
										
							</div>
							</li>
						</c:forEach>
						</ul>
						</c:if>
						
						<!-- contents end --> 
						<!-- pagination start -->
						<c:if test="${empty reviewList }" >
							<ul class="pagination mypagi justify-content-center">
							  <li class="page-item disabled"><a class="page-link" href="#">&#10094;</a></li>
							  <li class="page-item active"><a class="page-link" href="#">1</a></li>
							  <li class="page-item disabled"><a class="page-link" href="#">&#10095;</a></li> 
							</ul>		 
						</c:if>
						<c:if test="${not empty reviewList }" >
							<ul class="pagination mypagi justify-content-center">
								<c:if test="${ pageInfo.page > 1 }">
									<li class="page-item"><a class="page-link" href="myReview.do?page=${pageInfo.page-1}">&#10094;</a></li>
								</c:if>
								<c:if test="${ pageInfo.page <= 1 }">
									<li class="page-item disabled"><a class="page-link">&#10094;</a></li>
								</c:if>
							  
							<c:forEach  var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
								<c:if test="${pageInfo.page == i  }">
									<li class="page-item active"><a class="page-link" href="#">${i }</a></li>
								</c:if>
							  <c:if test="${pageInfo.page != i  }">
									<li class="page-item"><a class="page-link" href="myReview.do?page=${i }">${i }</a></li>
								</c:if>
							</c:forEach>
							
								<c:if test="${pageInfo.page >= pageInfo.maxPage }">
									<li class="page-item disabled"><a class="page-link">&#10095;</a></li>
								</c:if>
							  <c:if test="${pageInfo.page < pageInfo.maxPage }">
									<li class="page-item"><a class="page-link" href="myReview.do?page=${pageInfo.page+1}">&#10095;</a></li>
								</c:if> 
							</ul>
						</c:if>
						<!-- pagination end -->
        </div>
    </div>
    
     
    
    
    <%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>