<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		.my_reviews{
			padding:20px 0;
		}
		
		.my_reviews {
			width:auto;   
			/* height:2000px; */     
		} 
		.my_review_each{
			width:100%;     
			margin-bottom:40px;  
			border-bottom:1px solid #D8D8D8;
			height:auto;
			overflow: hidden;
			
		} 
		
		.rated_cafe_info{
			height:55px;
			line-height: 55px;
			margin-bottom:30px;
		}
		.rated_cafe_info img{  
			width:50px;
			height:50px;
			border-radius: 50px;
			float: left;
			margin-right:10px;
		}
		.rated_cafe_info h2{
			font-size: 20px;
			font-weight:bold;
			line-height:20px;
			margin:5px;
			padding-left:10px;   
		}
		
		.my_rate_visual > img{
			width:20px;
			height:20px;   
		}
		  
		.my_rating{
			height:250px;
			width:100%;
		}
		
		.my_rate_each2{
			width:100%;
			/* height:300px; */       
		
		}   
		/* #rate_each2{   
			width:100%;
			
		} */ 
		
		#my_rate_header{
			height:40px;
			width:50%;
			line-height:40px;   
			/* border-bottom:1px solid #D8D8D8; */
		}
		#my_rate_header img{
			width:30px;
			float: left;
			
		}
		#my_rate_header span{
			font-weight: bold;
			
		}
		    
		.my_rating > div{
			width:100%;   
			line-height: 30px;

		}
		
		.my_review_bottom div{
			margin-bottom:10px;
		}
		
		.my_review_top{     
			height:auto;
			width:35%;
			float:left;
			margin-left:30px;   
			
		}
		
		.review_ragdate{
			text-align: right;  
		}
		
		
		
		.my_review_bottom{
			width:60%;  
			float:left;
			padding-left:20px;
			box-sizing: border-box;
			   
		}
		  
		.my_review_bottom img{
			width:100%;
			height:auto;
			  
		}
		.my_comment{
			width:100%;
			height:auto;
			padding-bottom:20px;
		}  
		
		.review_navi_nums{
			width:100%;
			height:60px;
		}
		  
		.review_navi_nums > div{
			line-height:60px;
			height:60px;
			width:90%;
			text-align:center;  
		}      
		
		.review_navi_nums a{
			margin:0 20px;
		
		}
		
		.my_review_btn{   
			width:13%;
			height:100px;
			/* float: left; */
		}
		.my_review_btn > div{
		}
		
		.my_review_modify_btn, .my_review_delete_btn{
			width:50px;
			height:50px;
			border-radius: 50px;
			line-height: 50px;
			text-align: center;
			/* background-color: #848484;			
			margin:0 auto;    
			margin-bottom:10px;    
			color:#FFFFFF; */
			font-weight: bold;    
		}
		
		.review_navi_nums{width:100%;height:200px;padding-top:40px;text-align:center;}
		.review_navi_nums > div{line-height:60px;height:60px;width:auto;display: inline-block;}      
		.num-area{width:auto;height:40px;float:left;}
		.num{margin:0 10px;width:40px;height:40px;float:left;}
		.present{width:40px;height:40px;border-radius: 40px;float:left;background-color: #86B404;text-align: center;line-height: 40px;margin:10px;}
		.num-btn{width:100%;height:auto;}
		
		#modify, #delete, #blank{float:left;margin-right:5px;}
		.my_review_each:nth-child(1){margin-top:50px;}
	</style>
	
	<script>
		$(function(){
			/* var review_each_height = $('.my_review_bottom img').height()+$('.my_comment').height()+20;
			$('.my_review_each').css({
				'height':review_each_height+'px'
			});
			$('.cafe_reviews').css({
				'height':review_each_height*5+200+'px'
			}); */
			
			var user_id = ${userVO.user_id};
			console.log("아이디"+user_id);
			/* 페이징 처리 함수 */
			var pasing = function(currentPage, user_id){
				$.ajax({
					url:'myReviewAjax.do', 
					type:'GET',
					dataType:'html',
					data:{'currentPage':currentPage},
					success:function(data){
						$('.myReview-area').html(data);
					}
				});  
				
			};
	
			/* 번호 클릭 */
			$('.num-btn').click(function(){
				console.log("클릭");
				var currentPage = $(this).text();
				console.log(currentPage);
				pasing(currentPage, user_id);
			});
			
			/* 맨 처음으로 */
			$('.navi_first_btn').click(function(){
				var currentPage = 1;
				pasing(currentPage, user_id);
			});
			
			/* 이전 5개 */
			$('.navi_prev10_btn').click(function(){
				var beginPage = ${beginPage};
				if (beginPage==1){   
					var currentPage = 1;
				} else{
					var currentPage = beginPage-5;
				}
				pasing(currentPage, user_id);
			});
			
			/* 다음 5개 */
			$('.navi_next10_btn').click(function(){
				var beginPage = ${beginPage};
				var endPage = ${endPage};
				var maxPage = ${maxPage};
				if (endPage==maxPage){   
					var currentPage = Math.floor((maxPage-1)/5)*5+1;
				} else{
					var currentPage = beginPage+5;
				}
				pasing(currentPage, user_id);
			});
			
			/* 맨 끝으로 */
			$('.navi_last_btn').click(function(){
				var currentPage = $('.max-btn').val();
				pasing(currentPage, user_id);
			});

		}); 
		
	</script>
</head>

<body>
  	<div class="cafe_reviews">
        <c:forEach items="${reviews }" var="review" varStatus="status">
			<c:forEach items="${cafeList}" var="cafe_vo" varStatus="status">
				<c:if test="${review.cafe_id == cafe_vo.cafe_id}">
					<c:set var="cafe" value="${cafe_vo }"/>
				</c:if>
			</c:forEach>
			<div class="my_review_each">
				<div class="my_review_bottom">  
					<div>
						<img src="upload/review/${review.image }"/>
					</div>
					<div class="my_comment">
						<p>${review.contents}</p>
						<fmt:parseDate var="sDate" value="${review.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
    	
						<p>꒐ 작성일: <fmt:formatDate value="${sDate}" pattern="yyyy-MM-dd" />&nbsp;
							<a id="modify" href="modifyReviewForm.do?cafe_id=${cafe.cafe_id}">수정</a>&nbsp;
							<a id="blank">꒐</a>&nbsp;
							<a id="delete" href="deleteReview.do?cafe_id=${cafe.cafe_id}">삭제</a>&nbsp;
						</p>
						
					</div>
				</div>
				<div class="my_review_top">
					<div class="rated_cafe_info">   
						<div>
							<img src="./img/brandLogo/${cafe.logo }" />
						</div>
						<h2>${cafe.name }</h2>
						<h2>${cafe.branch }</h2>
					</div>
					<div class="my_rating">
						<div id="my_rate_header">
							<img src="img/star_colored.png">
							<span>내 점수</span>  
							  
						</div>
						<div class="my_rate_each2" id="my_rate_each2">
							<span class="my_rate_visual" id="my_taste_visual">
								<img src="img/taste.png">
							</span>
							<span class="my_rate_name" id="my_taste_name">taste - </span>
							<span class="my_my_rate">${review.taste_score }점</span>
						</div>
						<div class="my_rate_each2" id="my_rate_each2">
							<span class="my_rate_visual" id="my_price_visual">
								<img src="img/price.png">
							</span>
							<span class="my_rate_name" id="my_price_name">price - </span>
							<span class="my_my_rate">${review.price_score }점</span>
						</div>
						<div class="my_rate_each2" id="my_rate_each2">
							<span class="my_rate_visual" id="my_service_visual">
								<img src="img/service.png">
							</span>
							<span class="my_rate_name" id="my_service_name">service - </span>
							<span class="my_my_rate">${review.service_score }점</span>
						</div>
						<div class="my_rate_each2" id="my_rate_each2">
							<span class="my_rate_visual" id="my_facimood_visual">
								<img src="img/mood.png">
							</span>
							<span class="my_rate_name" id="my_facimood_name">mood - </span>
							<span class="my_my_rate">${review.mood_score }점</span>
						</div>
						<div class="my_rate_each2" id="my_rate_each2">
							<span class="my_rate_visual" id="my_wifiplug_visual">
								<img src="img/wifi.png">
							</span>
							<span class="my_rate_name" id="my_wifiplug_name">wifi - </span>
							<span class="my_my_rate">${review.wifi_score }점</span>
						</div>  
						<div class="my_rate_each2" id="my_rate_each2">
							<span class="my_rate_visual" id="my_clean_visual">
								<img src="img/clean.png">
							</span>
							<span class="my_rate_name" id="my_clean_name">clean - </span>
							<span class="my_my_rate">${review.clean_score }점</span>
						</div>
					</div>	
					
				</div>
				
			</div>
		</c:forEach>  
	
	</div>
	<c:if test="${myReview_num!=0}">
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
	</c:if>
	<c:if test="${myReview_num==0}">
		<div style="height:300px;font-size: 1.5em; font-weight: bold; color:#D8D8D8; text-align:center;line-height:300px;">
			내가 작성한 후기가 없습니다.
		</div>
	</c:if>
	
</body>

</html>