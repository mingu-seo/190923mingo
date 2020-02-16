<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
		.collect_cafe_each{
			width:100%;
			height:200px;
			box-sizing: border-box;
			border:1px solid #D8D8D8;
			padding:10px;  
		}
		.collect_cafe_logo{
			width:25%;
			height:100%;
			  
			float:left;
		}
		.collect_cafe_logo img{
			height:100%;
		}
		
		
		.collect_cafe_info{
			float:left;
			height:100%;  
			width:75%;
			box-sizing: border-box;
			padding-left:20px;   
			
		}
		
		.collect_cafe_info_header{
			line-height:60px;
			height:30%;  
			width:95%;   
			border-bottom:1px solid #D8D8D8;  
		}
		
		.collect_cafe_info_header div{
			float:left;
			height:100%;
		}
		.collect_cafe_title{
			font-size: 1.5em;
			font-weight: bold;
			color:#2E2E2E;
		}
		.collect_cafe_star img{
			width:40px;
		}
		.collect_cafe_avgRate{
			font-size: 1.5em;
			font-weight: bold;
			color:#2E2E2E;
		
		}
		
		.collect_cafe_info_content{
			height:70%;
			padding-top:20px;
		}
		
		.collect_cafe_address {
			font-size:1.0em;   
			height:20%;
			margin-bottom:10px;  
			
		}
		.collect_cafe_eachRate{
			height:80%;
			
		}
		.each_rate{
			width:170px;
			height:35px;
			padding:5px;
			float:left;
			
		}
		.each_rate div{  
			line-height: 25px;   	
			float:left;
		}
		
		
		.collect_graphic{
			position:relative;
			width:110px;  
			height:25px;
			line-height: 25px;          	
		}
		.collect_graphic div{
		}
		
		.bar_total{
			position:absolute;
			transform: translateY(-50%);
			top:50%;
			width:100px;
			height:10px;
			background-color: #D8D8D8;
			border-radius: 7px;
			margin:auto;
		}
		.bar_rate{
			width:70%;  
			height:10px;
			background-color: #FFBF00;
			border-radius: 7px;
		}
		
		.collect_img img{
			position:relative;
			bottom:2px; 
			right:2px;
			width:15px;
			z-index: 10;
		}
		.rate{
			font-size: 0.8em;
			font-weight: bold;
		}
		
		.review_navi_nums{width:100%;height:200px;padding-top:40px;text-align:center;}
		.review_navi_nums > div{line-height:60px;height:60px;width:auto;display: inline-block;}      
		.num-area{width:auto;height:40px;float:left;}
		.num{margin:0 10px;width:40px;height:40px;float:left;}
		.present{width:40px;height:40px;border-radius: 40px;float:left;background-color: #86B404;text-align: center;line-height: 40px;margin:10px;}
		.num-btn{width:100%;height:auto;}
		
		
	
	</style>
	
	<script>
	$(function(){
		
		
		var user_id = ${userVO.user_id};  
		var myCollect_num = ${myCollect_num};
		
		/* 페이징 처리 함수 */
		var pasing = function(currentPage, user_id){
			$.ajax({
				url:'myCollectAjax.do',
				type:'GET',
				dataType:'html',
				data:{'user_id':user_id,
					'currentPage':currentPage},
				success:function(data){
					$('.collect-area').html(data);
				}
			});
			
		};

		/* 번호 클릭 */
		$('.num-btn').click(function(){
			var currentPage = $(this).text();
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
    
    
            
          <!-- 여기부터 -->
          <div class="collect_cafes">
          	<c:forEach items="${cafeRateList }" var="cafeRate" varStatus="status">
				<c:forEach items="${cafeList}" var="cafe_vo" varStatus="status">
					<c:if test="${cafeRate.cafe_id == cafe_vo.cafe_id}">
						<c:set var="cafe" value="${cafe_vo }"/>
					</c:if>
				</c:forEach>
          
	           	<div class="collect_cafe_each">
	           		<div class="collect_cafe_logo">
	           			<img src="./img/brandLogo/${cafe.logo }"  style="border:1px solid #E6E6E6;border-radius: 100%;">    
	           		</div>
	           		<div class="collect_cafe_info">
	           			<div class="collect_cafe_info_header">
	           				<div class="collect_cafe_title">${cafe.name }&nbsp${cafe.branch }&nbsp</div>
	           				<div class="collect_cafe_star">
	           					<img src="img/star_colored.png">
	           				</div>
	           				<div class="collect_cafe_avgRate">${cafe.rate_avg }</div>
	           			</div>
	           			<div class="collect_cafe_info_content">
	           				<div class="collect_cafe_address">${cafe.cafe_address }</div>
	           				<div class="collect_cafe_eachRate">
	           					<div class="each_rate" id="collect_menu">
	           						<div class="collect_img">
	           							<img src="img/wifi.png">
	           						</div>
	           						<div class="collect_graphic">
	           							<div class="bar_total" >
	           								<div class="bar_rate" style="width:${cafeRate.wifi_avg*20 }px;"></div>
	           								<div class="bean_img">
	           									<img src="">
	           								</div>
	           							</div>
	           						</div>
	           						<div class="rate">${cafeRate.wifi_avg }</div>
	           					</div>
	           					<div class="each_rate" id="collect_price">
	           						<div class="collect_img">
	           							<img src="img/wifi.png">
	           						</div>
	           						<div class="collect_graphic">
	           							<div class="bar_total">
	           								<div class="bar_rate"style="width:${cafeRate.clean_avg*20 }px;"></div>
	           								<div class="bean_img">
	           									<img src="">
	           								</div>
	           							</div>
	           						</div>
	           						<div class="rate">${cafeRate.clean_avg }</div>
	           					</div>
	           					<div class="each_rate" id="collect_wifiplug">
	           						<div class="collect_img">
	           							<img src="img/wifi.png">
	           						</div>
	           						<div class="collect_graphic">
	           							<div class="bar_total">
	           								<div class="bar_rate"style="width:${cafeRate.price_avg*20 }px;"></div>
	           								<div class="bean_img">
	           									<img src="">
	           								</div>
	           							</div>
	           						</div>
	           						<div class="rate">${cafeRate.price_avg }</div>
	           					</div>
	           					<div class="each_rate" id="collect_service">
	           						<div class="collect_img">
	           							<img src="img/wifi.png">
	           						</div>
	           						<div class="collect_graphic">
	           							<div class="bar_total">
	           								<div class="bar_rate"style="width:${cafeRate.taste_avg*20 }px;"></div>
	           								<div class="bean_img">
	           									<img src="">
	           								</div>
	           							</div>
	           						</div>
	           						<div class="rate">${cafeRate.taste_avg }</div>
	           					</div>
	           					<div class="each_rate" id="collect_facility">
	           						<div class="collect_img">
	           							<img src="img/wifi.png">
	           						</div>
	           						<div class="collect_graphic">
	           							<div class="bar_total">
	           								<div class="bar_rate"style="width:${cafeRate.mood_avg*20 }px;"></div>
	           								<div class="bean_img">
	           									<img src="">
	           								</div>
	           							</div>
	           						</div>
	           						<div class="rate">${cafeRate.mood_avg }</div>
	           					</div>
	           					<div class="each_rate" id="collect_product">
	           						<div class="collect_img">
	           							<img src="img/wifi.png">
	           						</div>
	           						<div class="collect_graphic">
	           							<div class="bar_total">
	           								<div class="bar_rate"style="width:${cafeRate.service_avg*20 }px;"></div>
	           								<div class="bean_img">
	           									<img src="">
	           								</div>
	           							</div>
	           						</div>
	           						<div class="rate">${cafeRate.service_avg }</div>
	           					</div>
	           				</div>
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
	
          <!-- 여기까지 -->
       
</body>

</html>