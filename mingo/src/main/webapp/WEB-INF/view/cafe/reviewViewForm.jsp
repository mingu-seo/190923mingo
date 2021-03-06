<%@page import="util.Property"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail information page about each cafe</title>

<!--부트 스트랩 관련 파일-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


	<!-- 헤더파일들 include -->
	<%@ include file="/WEB-INF/view/include/headHTML.jsp"%>
	
	<!-- 폰트 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="http://code.jquery.com/jquery-3.4.1.js"></script>

	<!-- jquery ui -->

    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!--  
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/swiper.css"/>
    <script src="js/swiper.min.js"></script>
	-->
	
	<style>
		.review_navi_nums{width:80%;height:200px;padding-top:40px;text-align:center;}
		.review_navi_nums > div{line-height:60px;height:60px;width:auto;display: inline-block;}      
		.num-area{width:auto;height:40px;float:left;}
		.num{margin:0 10px;width:40px;height:40px;float:left;cursor:pointer;}
		.present{cursor:pointer;width:40px;height:40px;border-radius: 40px;float:left;background-color: #86B404;text-align: center;line-height: 40px;margin:10px;}
		.num-btn{width:100%;height:auto;}
	</style>
	
	<script>
		$(function(){	
			
			var cafe_id = $('.cafe_id').val();  
			var rate_num = ${cafeRate.rate_num};
			
			/* 페이징 처리 함수 */
			var pasing = function(currentPage, cafe_id, rate_num){
				$.ajax({
					url:'reviewViewForm.do',
					type:'GET',
					dataType:'text',
					data:{'cafe_id':cafe_id,
						'currentPage':currentPage,
						'rate_num':rate_num},
					success:function(data){
						$('.review-view').html(data);
					}
				});
				var rate_num = ${cafeRate.rate_num};
			};
	
			/* 번호 클릭 */
			$('.num-btn').click(function(){
				var currentPage = $(this).text();
				pasing(currentPage, cafe_id, rate_num);
			});
			
			/* 맨 처음으로 */  
			$('.navi_first_btn').click(function(){
				var currentPage = 1;
				pasing(currentPage, cafe_id, rate_num);
			});
			
			/* 이전 5개 */
			$('.navi_prev10_btn').click(function(){
				if (${beginPage}==1){ 
					var currentPage = 1;
				} else{
					var currentPage = ${beginPage}-5;
				}
				pasing(currentPage, cafe_id, rate_num);
			});  
			
			/* 다음 5개 */  
			$('.navi_next10_btn').click(function(){
				if (${endPage}==${maxPage}){
					var currentPage = Math.floor((${maxPage}-1)/5)*5+1;
				} else{
					var currentPage = ${beginPage}+5;
				}
				pasing(currentPage, cafe_id, rate_num);
			});
			
			/* 맨 끝으로 */  
			$('.navi_last_btn').click(function(){
				var currentPage = $('.max-btn').val();
				pasing(currentPage, cafe_id, rate_num);
			});
			
		});  
	</script>
    
</head>
<body>
	
	
	<div class="cafe_reviews">
		<c:forEach items="${reviewList}" var="review" varStatus="status">
			<input type="hidden" value=${review.cafe_id } class="cafe_id">  
			<c:forEach items="${reviewUsers}" var="user_vo" varStatus="status">
				<c:if test="${review.user_id == user_vo.user_id}">
					<c:set var="user" value="${user_vo }"/>
				</c:if>
			</c:forEach>
			
			<div class="cafe_review_each">
				<div class="cafe_review_top">
					<div class="user_info">   
						<div>
							<c:if test="${user.profile_image==null}">
								<img src="img/user_default.png"/>
							</c:if>
							<c:if test="${user.profile_image!=null}">
								<img src="upload/user/${user.profile_image}"/>
							</c:if>
						</div>
						<h2>${user.nickname }</h2>
						<fmt:parseDate var="sDate" value="${review.regdate }" pattern="yyyy-MM-dd HH:mm:ss" />
						<h2><fmt:formatDate value="${sDate}" pattern="yyyy-MM-dd" /></h2>
					</div>
					<div class="rating">
						<div class="rate_each2" id="rate_each2">
							<span class="rate_visual" id="taste_visual">
								<img src="img/taste.png">
							</span>
							<span class="rate_name" id="taste_name">taste - </span>
							<span class="my_rate">${review.taste_score }점</span>  
						</div>  
						<div class="rate_each2" id="rate_each2">
							<span class="rate_visual" id="price_visual">
								<img src="img/price.png">
							</span>
							<span class="rate_name" id="price_name">price - </span>
							<span class="my_rate">${review.price_score }점</span>
						</div>
						<div class="rate_each2" id="rate_each2">
							<span class="rate_visual" id="service_visual">
								<img src="img/service.png">
							</span>
							<span class="rate_name" id="service_name">service - </span>
							<span class="my_rate">${review.service_score }점</span>
						</div>
						<div class="rate_each2" id="rate_each2">
							<span class="rate_visual" id="facimood_visual">
								<img src="img/mood.png">
							</span>
							<span class="rate_name" id="facimood_name">mood - </span>
							<span class="my_rate">${review.mood_score }점</span>
						</div>
						<div class="rate_each2" id="rate_each2">
							<span class="rate_visual" id="wifiplug_visual">
								<img src="img/wifi.png">
							</span>
							<span class="rate_name" id="wifiplug_name">wifi - </span>
							<span class="my_rate">${review.wifi_score }점</span>
						</div>  
						<div class="rate_each2" id="rate_each2">
							<span class="rate_visual" id="clean_visual">
								<img src="img/clean.png">
							</span>
							<span class="rate_name" id="clean_name">clean - </span>
							<span class="my_rate">${review.clean_score }점</span>
						</div>
					</div>
				</div>
				<div class="cafe_review_bottom">  
					<div>
						<c:if test="${review.image==null }">
							<img src="img/default_review.png"/>
						</c:if>
						<c:if test="${review.image!=null }">
							<img src="upload/review/${review.image }"/>
						</c:if>
					</div>
					<div class="comment"> 
						<p>${review.contents }</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="review_navi_nums">
		<div>
			<div class="num">
				<div class="navi_first_btn"><div><img src="img/arrow_first.png"></div></div>
				<input type="hidden" value="1" class="min-btn">			
			</div>  
			<div class="num">
				<div class="navi_prev10_btn"><div><img src="img/arrow_prev.png"></div></div>
			</div>
			<div class="num-area">
				<c:forEach var="num" begin="${beginPage}" end="${endPage}" step="1">
					<c:if test="${currentPage == num}">
						<div class="present" ><div class="num-btn">${num}</div></div> 					
					</c:if>
					<c:if test="${currentPage != num}">
						<div class="num" ><div class="num-btn">${num}</div></div> 					
					</c:if>
				</c:forEach>					
			</div>
			
			<div class="num">
				<div class="navi_next10_btn"><div><img src="img/arrow_next.png"></div></div>					
			</div>
			<div class="num">					
				<div class="navi_last_btn"><div><img src="img/arrow_last.png"></div></div>					
				<input type="hidden" value="${maxPage}" class="max-btn">
			</div>
		</div>
	</div>
			
</body>
</html>