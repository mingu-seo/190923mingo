<%@page import="util.Property"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail information page about each cafe</title>

	<!-- 헤더파일들 include -->
	<%@ include file="/WEB-INF/view/include/headHTML.jsp"%>
	
	<!-- 폰트 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!-- jquery ui -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!--  
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/swiper.css"/>
    <script src="js/swiper.min.js"></script>
	-->
	<style>
		/* header 부분 스타일 기본값 */
		.memubar_space{
			height:600px;
			width:100%;   
			left:0px;
			top:0px;    
			position: absolute;
			overflow: hidden;     
		}
		
		.memubar_space img{
			z-index:-1;
			width:100%;
			left:0px;
			top:0px;
			position: absolute;
			
		}
		
		.container{
			width:900px;
		}
		
		.header{
			height:360px;
			margin-top:200px;
			margin-bottom:30px;   
		}   
		
		.logo{
			width:20%;
			margin:20px 0;
		}
		.logo > img{
			width:100%;
			filter: drop-shadow(0px 0px 20px #FFFFFF);
		}
		
		#cafe_name, #branch_name{
			font-color:#151515;
			font-size: 2.5em;
			font-weight:bold;
			text-shadow: 0px 0px 15px #FFFFFF;        
		}
			
		#cafe_name{
			float:left;
			margin-right:20px;  
		}  
		.rate_avg{
			width:100%;
		}  
		
		#star_shape1{
			float:left;  
			width:3%;
			filter: drop-shadow(0px 0px 20px #FFFFFF);
		}
		#rate_num{
			font-weight:bold;
			color:#151515;
			font-size: 1.2em;
			float: left;
			text-shadow: 0px 0px 15px #FFFFFF;   
		}
		.address{
			font-weight:bold;
			color:#151515;  
			font-size: 1.2em;
			text-shadow: 0px 0px 15px #FFFFFF;
		}
		
		.content_button, .cafe_infomation, .cafe_review, .'jumbotron jumbotron-fluid'{
			
			float: left;   
		}
		.'jumbotron jumbotron-fluid'{
			margin:0;
		}
		
		
		
		
		/* 콘텐츠 섹션 선택 버튼 */
		.content_button{
			padding-top:10px;
			width:100%;
		}
		.info_button{
			width:50%;
			height:50px;
			text-align: center;
			font-size: 1.2em;
			float:left;
			line-height: 50px;   		
			
		}
		.review_button{
			width:50%;
			height:50px;
			text-align: center;
			font-size: 1.2em;
			float:left;
			border-bottom:2px solid #21610B;
			line-height: 50px;  		
		}
		.cafe_infomation{
			
			display:none;
			 
		}  
		.content_button{
		 	height:100px;
		}
		
		.detail_info_button{
			height:50px;  
		}
		
		.button_each{
			text-align:center;
			float:right;
			width:80px;
			height:40px;
			line-height: 40px;    
		}
		
		.info_title{
			height:40px;
			border-bottom:1px solid #D8D8D8;
			  
			font-size: 1.5em;
			color:#585858;
			
		}
		
		.basic_info{
			height:200px;
		}
		#basic_info_title{
			margin-bottom: 20px;  
		}
		.detail_info{
			height:350px;  
		}
		
		.menu{
			height:300px;
		}
		.facility{
			height:300px;
			display: none;
		}
		.service{
			height:300px;
			display: none;
		}
		.product{  
			height:300px;
			display: none;
		}
		
		.cafe_photo{  
			height:600px;
		}
		.cafe_location{
			height:600px;
		}  
		
		
		.info_each{
			float:left;
		
		}
		.info_each{
			width:20%;
			
		}
		.info_each > img{
			width:99%;
			
		}
		.info_each > h6{
			font-size:0.8em;
			text-align: center; 
		
		}
		
		#cafe_photo_title{
		 margin-bottom:30px;
		}
		
		.visual{
			width:90%;
			height:500px;
			margin:0 auto;
			  
			
		}
		
		.visual .swiper{
        	height:500px
        	z-index: 10;
        	
        }   
        
        .'swiper swiper-container', ,swiper-wrapper{
        	height:500px;
        }
        
        .visual .swiper-slide{
        	height:500px;
        	background-position:center center;
        	background-repeat:no-repeat;
        	background-size:cover;
        	text-align: center; 
        	float:left;
        }    
		
		#cafe_location_title{
			margin-bottom:20px;  
		}
		.cafe_location_map{
			padding:10px;
			
		}
		.cafe_location_map > img{
			width:100%;
			height:500px;   
		}
		
		.cafe_rates{
			height:500px;
			width:100%;
		}  
		.cafe_reviews{
			height:1000px;
			width:100%;
		} 
		
		 
		
		#star_shape2{
			float:left;
			height:45px;  
		}     
		.rate_info2 .rate_num{
			float:left;
			margin-right:20px;
			font-size: 1.5em;
		}
		.rate_info2 .review_num{
			float:left;
			margin-right:20px;
			font-size: 1.5em;
		}
		.rate_info2 .ranking{
			float:left;
			font-size: 1.5em;
		}    
		
		
		
		
		
		.graph_area{
            height:120px;  
            width:400px;
        }
        .graph_stack{
            width:300px;
            height:40px;
            background-color: #D8D8D8;
            box-sizing: border-box;
            border-radius: 35px;
            line-height: 40px;
            position: relative;
            left:60px;  
        }   

        .graph_rate{
            text-align: right;
            height:100%;
            background-color: #4B610B;
            box-sizing: border-box;
            border-radius: 35px;
            line-height: 40px;
            width:250px;
        }  

        .graph_text{
            float: right;
            position: relative;
            z-index: 110;
        }
        .graph_logo{
            height: 80px;
            float: left;
            position: relative;
            z-index: 100;
            bottom: 25px;
        }
        .bean_img{
            height:60px;
            float: right;
            padding-left: 0px;
            position: relative;
            left:25px;
            bottom:10px;
            z-index: 90;
        }
        .graph_text{
            float: right;
            font-size: 1.2em;
            font-weight: bold;
            color: #FFFFFF;
        }
        
        .rate_visual_total{
        	height:800px;
        	width:100%;
        }     

		.rate_info2{
			height:120px;
			padding:30px 0px;
		}  
		
		info2{  
			height:100px;
		} 
		.rate_each{
			float: left;
		}
		
		
		.cafe_reviews{
			padding:20px 0;
		}
		
		.cafe_reviews {
			width:100%;   
			/* height:2000px; */     
		} 
		.cafe_review_each{
			width:90%;     
			margin-bottom:40px;  
			border-bottom:1px solid #D8D8D8;
			
		} 
		
		.user_info{
			height:55px;
			line-height: 55px;
			margin-bottom:30px;
		}
		.user_info img{
			width:50px;
			height:50px;
			border-radius: 50px;
			float: left;
			margin-right:10px;
		}
		.user_info h2{
			font-size: 20px;
			line-height:20px;
			margin:5px;
			padding-left:10px;   
		}
		
		.rate_visual > img{
			width:20px;
			height:20px;   
		}
		  
		.rating{
			height:300px;
			width:100%;
		}
		
		.rate_each2{
			width:100%;
			/* height:300px; */       
		
		}   
		/* #rate_each2{   
			width:100%;
			
		} */
		
		
		
		.cafe_review_bottom div{
			margin-bottom:10px;
		}
		
		.cafe_review_top{
			width:30%;
			float:left;
			
		}
		
		.cafe_review_bottom{
			width:70%;  
			float:left;
			padding-left:20px;
			box-sizing: border-box;
		}
		
		.cafe_review_bottom img{
			width:100%;
			height:100%;
		}
		.comment{
			width:100%;
			height:100%;
			padding-bottom:20px;
		}  
		
		.review_navi_nums{
			width:100%;
			height:150px;
			 
		}
		  
		.review_navi_nums > div{
			line-height:60px;
			height:60px;
			width:540px;
			margin:0 auto;
			text-align:center;
			
		}      
		
		
		.num{
			
			margin:0 10px;
			width:40px;
			height:40px;
			float:left;
		}
		
		.present{
			width:40px;
			height:40px;
			border-radius: 40px;
			float:left;
			background-color: #86B404;
			text-align: center;
			line-height: 40px;
			margin:10px;	
		}
		.review_navi_nums a{
			color:#2E2E2E;
			font-size:1.3em;
			line-height: 40px;
		}
		.present a{     
			color:#ffffff;
			font-size:1.3em;
			line-height: 40px;
		}
		
		}
		
		
	</style>
	<script>
		$(function(){
			
			
			
			$('document').ready(function() {
				var review_each_height = $('.cafe_review_bottom img').height()+$('.comment').height()+20;
				$('.cafe_review_each').css({
					'height':review_each_height+'px'
				});
				$('.cafe_reviews').css({
					'height':review_each_height*5+200+'px'
				});
			});
			
			   
			$('.info_button').click(function(){
				console.log("click");
				$('.info_button').css({
					'border-bottom':'2px solid #21610B' 
				});
				$('.review_button').css({
					'border-style':'none' 
				});
				$('.cafe_infomation').css({
					'display':'block',
					
				});
				$('.cafe_review').css({
					'display':'none'  
				});
				var swiper = new Swiper('.swiper', {
	                cssMode: true,
	                loop : true,
	                navigation: {
	                nextEl: '.visual .swiper-button-next',
	                prevEl: '.visual .swiper-button-prev',
	                },
	                pagination: {
	                el: '.visual .swiper-pagination'
	                },
	                mousewheel: true,
	                keyboard: true,
	            });   
			});	  
			$('.review_button').click(function(){
				console.log("click");
				$('.review_button').css({
					'border-bottom':'2px solid #21610B' 
				});
				$('.info_button').css({
					'border-style':'none' 
				});
				$('.cafe_review').css({
					'display':'block'  
				});
				$('.cafe_infomation').css({
					'display':'none'
				});
			});	
		});  
	  
	
	
	</script>

</head>
<body>
	
	 <!-- 내비게이션 include -->
		<%@ include file="/WEB-INF/view/include/navigation.jsp"%>
	
	<!-- 빈공간. 코딩 편의를 위해 레이어 앞면에 고정된 메뉴바가 차지하는 만큼 빈공간 부여 -->
	<div class="memubar_space">
		<img src="img/cafe_4.png">
	
	</div>
	
	<!-- 카페 로고 및 기본 정보 표시란 -->
	<div class="header">
		<div class="container">
			<div class="logo">
				<img src="img/starbucks.png">
			</div>
			<div class="title">
				<div id="cafe_name">
					${cafe.name }  
				</div>
				<div id="branch_name">
					${cafe.branch }
				</div>     
			</div>
			<div class="info">
				<div class="rate_avg">
					<img src="img/star_colored.png" id="star_shape1">
					<div id="rate_num">${cafe.rate_avg }점&nbsp;|&nbsp;</div>
				</div>
				<div class="address"> ${cafe.cafe_address }</div>
			</div>	
		</div>
	</div>
	  
	<!-- 상세정보 및 후기 콘텐츠 표기란 -->
	<div class="content">
		<div class="container">
			<div class="content_button">
				<div class="info_button">소개</div>
				<div class="review_button">후기</div>
			</div>			
		</div>
		<div class="container">
			<div class="cafe_infomation">
				<div class="basic_info">
					<div class="info_title" id="basic_info_title">운영정보</div>
					
					<div class="basic_info_content">
						<div class="basic_info_each" id="info_address">&nbsp;ㆍ${cafe.cafe_address }</div>
						<div class="basic_info_each" id="info_tel">&nbsp;ㆍ${cafe.tel }</div>
						<div class="basic_info_each" id="info_mg_time">&nbsp;ㆍ매주 08:00~23:00</div>
					</div>
				</div>
				<div class="detail_info">
					<div class="info_title" id="detail_info_title">상세정보</div>
					<div class="detail_info_button">
						<div class="button_each" id="menu_btn">메뉴</div>
						<div class="button_each" id="facility_btn">시설</div>
						<div class="button_each" id="service_btn">서비스</div>
						<div class="button_each" id="product_btn">상품</div>
					</div>
					<div class="menu">
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>무설탕 흑당라떼</h6>
								<h6>17,000원</h6>
							</div>						
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>무설탕 흑당라떼</h6>
								<h6>17,000원</h6>
							</div>						
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>무설탕 흑당라떼</h6>
								<h6>17,000원</h6>
							</div>						
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>무설탕 흑당라떼</h6>
								<h6>17,000원</h6>
							</div>						
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>무설탕 흑당라떼</h6>
								<h6>17,000원</h6>
							</div>						
						</div>
						
					</div>
					<div class="facility">
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>무설탕 흑당라떼</h6>
								<h6>17,000원</h6>
							</div>
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>무설탕 흑당라떼</h6>
								<h6>17,000원</h6>
							</div>
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>무설탕 흑당라떼</h6>
								<h6>17,000원</h6>
							</div>
						</div>
						
					</div>
					<div class="service">
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>무설탕 흑당라떼</h6>
								<h6>17,000원</h6>
							</div>
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>무설탕 흑당라떼</h6>
								<h6>17,000원</h6>
							</div>
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>무설탕 흑당라떼</h6>
								<h6>17,000원</h6>
							</div>
						</div>
						
					</div>
					<div class="product">		
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>  
								<h6>무설탕 흑당라떼</h6>
								<h6>17,000원</h6>
							</div>
						</div>			
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>무설탕 흑당라떼</h6>
								<h6>17,000원</h6>
							</div>
						</div>			
								   	
					</div>
				</div>
				<div class="cafe_photo">
					<div class="info_title" id="cafe_photo_title">사진</div>
					<div class="visual">
		            	<div class="swiper swiper-container">
		            		<div class="swiper-wrapper">  
		            			<c:forEach items="${imgList }" var="img">
		            			<div class="swiper-slide" style="background-image:url('/upload/cafe/${img.url}')"></div>
		            			</c:forEach>
		            			<!-- <div class="swiper-slide" style="background-image:url('img/cafe_1.jpg')"></div>
		            			<div class="swiper-slide" style="background-image:url('img/cafe_2.jpg')"></div>
		            			<div class="swiper-slide" style="background-image:url('img/cafe_3.jpg')"></div>
		            			<div class="swiper-slide" style="background-image:url('img/cafe_4.png')"></div> -->
		            		</div>  
		            		<div class="swiper-pagination"></div>
		            		<div class="swiper-button-prev"></div>
		            		<div class="swiper-button-next"></div>
		            	</div>	
            		</div>
				</div>
				<div class="cafe_location">
					<div class="info_title" id="cafe_location_title">위치</div>
					<div class="cafe_location_map">
						<img src="img/cafe_map.png">					
					</div>  
				</div>
			</div>		
		</div>
		<div class="container">
			<div class="cafe_review">
				<div class="info_title" id="basic_info_title">종합평점</div>
				<div class="cafe_rates">
					<div class="rate_info2">
						<div class="info2">
							<div class="rate_avg">
								<img src="img/star_colored.png" id="star_shape2">
								<div class="rate_num">3.5점</div>
								<div class="review_num">(리뷰 27개,</div>
								<div class="ranking">자양4동 2위)</div>
							</div>
						</div>	
					</div>
					<div class="rate_visual_total">
						<div class="rate_each">
							<div class="rate_visual" id="taste_visual_tatal">
								<div class="graph_area">
						            <div>
						                <img src="img/wifi.png" class="graph_logo">
						            </div>
						            <div class="graph_stack">
						                <div class="graph_rate">
						                    <img src="img/bean.PNG" class="bean_img">
						                    <div class="graph_text">10점</div>
						                </div>
						            </div>
						        </div>
							</div>
							<div class="rate_name" id="taste_name_tatal"></div>
						</div>
						<div class="rate_each">
							<div class="rate_visual" id="price_visual_tatal">
								<div class="graph_area">
						            <div>
						                <img src="img/wifi.png" class="graph_logo">
						            </div>
						            <div class="graph_stack">
						                <div class="graph_rate">
						                    <img src="img/bean.PNG" class="bean_img">
						                    <div class="graph_text">10점</div>
						                </div>
						            </div>
						        </div>
							</div>
							<div class="rate_name" id="price_name_tatal"></div>
						</div>
						<div class="rate_each">
							<div class="rate_visual" id="service_visual_tatal">
								<div class="graph_area">
						            <div>
						                <img src="img/wifi.png" class="graph_logo">
						            </div>
						            <div class="graph_stack">
						                <div class="graph_rate">
						                    <img src="img/bean.PNG" class="bean_img">
						                    <div class="graph_text">10점</div>
						                </div>
						            </div>
						        </div>
							</div>
							<div class="rate_name" id="service_name_tatal"></div>
						</div>
						<div class="rate_each">
							<div class="rate_visual" id="facimood_visual_tatal">
								<div class="graph_area">
						            <div>
						                <img src="img/wifi.png" class="graph_logo">
						            </div>
						            <div class="graph_stack">
						                <div class="graph_rate">
						                    <img src="img/bean.PNG" class="bean_img">
						                    <div class="graph_text">10점</div>
						                </div>
						            </div>
						        </div>
							</div>
							<div class="rate_name" id="facimood_name_tatal"></div>
						</div>
						<div class="rate_each">
							<div class="rate_visual" id="wifiplug_visual_tatal">
								<div class="graph_area">
						            <div>
						                <img src="img/wifi.png" class="graph_logo">
						            </div>
						            <div class="graph_stack">
						                <div class="graph_rate">
						                    <img src="img/bean.PNG" class="bean_img">
						                    <div class="graph_text">10점</div>
						                </div>
						            </div>
						        </div>
							</div>
							<div class="rate_name" id="wifiplug_name_tatal"></div>
						</div>
						<div class="rate_each">
							<div class="rate_visual" id="clean_visual_tatal">
								<div class="graph_area">
						            <div>
						                <img src="img/wifi.png" class="graph_logo">
						            </div>
						            <div class="graph_stack">
						                <div class="graph_rate">
						                    <img src="img/bean.PNG" class="bean_img">
						                    <div class="graph_text">10점</div>
						                </div>
						            </div>
						        </div>
							</div>
							<div class="rate_name" id="clean_name_tatal"></div>
						</div>
					</div>
				</div>
				<div class="info_title" id="basic_info_title">리뷰</div>
				<div class="cafe_reviews">
					<div class="cafe_review_each">
						<div class="cafe_review_top">
							<div class="user_info">   
								<div>
									<img src="http://placehold.it/50x50"/>
								</div>
								<h2>최재명</h2>
								<h2>1주일 전</h2>
							</div>
							<div class="rating">
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="taste_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="taste_name">맛</span>
									<span class="my_rate">3.1점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="price_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="price_name">가격</span>
									<span class="my_rate">5.2점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="service_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="service_name">서비스</span>
									<span class="my_rate">1.2점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="facimood_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="facimood_name">시설 및 분위기</span>
									<span class="my_rate">3.3점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="wifiplug_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="wifiplug_name">와이파이&콘센트</span>
									<dspaniv class="my_rate">1.1점</span>
								</div>  
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="clean_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="clean_name">청결</span>
									<span class="my_rate">6.2점</span>
								</div>
								
							</div>
						</div>
						<div class="cafe_review_bottom">  
							<div>
								<img src="img/cafe_1.jpg"/>
							</div>
							<div class="comment">
								<p>숙소가 매우 깨끗했고, 준비가 전체적으로 잘 되어있었어요. 도착시간 때문에 체크인 시간도 조정해주시고 너무 친절했어요 :)</p>
							</div>
						</div>
					</div>
					<div class="cafe_review_each">
						<div class="cafe_review_top">
							<div class="user_info">   
								<div>
									<img src="http://placehold.it/50x50"/>
								</div>
								<h2>최재명</h2>
								<h2>1주일 전</h2>
							</div>
							<div class="rating">
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="taste_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="taste_name">맛</span>
									<span class="my_rate">3.1점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="price_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="price_name">가격</span>
									<span class="my_rate">5.2점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="service_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="service_name">서비스</span>
									<span class="my_rate">1.2점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="facimood_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="facimood_name">시설 및 분위기</span>
									<span class="my_rate">3.3점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="wifiplug_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="wifiplug_name">와이파이&콘센트</span>
									<dspaniv class="my_rate">1.1점</span>
								</div>  
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="clean_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="clean_name">청결</span>
									<span class="my_rate">6.2점</span>
								</div>
								
							</div>
						</div>
						<div class="cafe_review_bottom">  
							<div>
								<img src="img/cafe_1.jpg"/>
							</div>
							<div class="comment">
								<p>숙소가 매우 깨끗했고, 준비가 전체적으로 잘 되어있었어요. 도착시간 때문에 체크인 시간도 조정해주시고 너무 친절했어요 :)</p>
							</div>
						</div>
					</div>
					<div class="cafe_review_each">
						<div class="cafe_review_top">
							<div class="user_info">   
								<div>
									<img src="http://placehold.it/50x50"/>
								</div>
								<h2>최재명</h2>
								<h2>1주일 전</h2>
							</div>
							<div class="rating">
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="taste_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="taste_name">맛</span>
									<span class="my_rate">3.1점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="price_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="price_name">가격</span>
									<span class="my_rate">5.2점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="service_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="service_name">서비스</span>
									<span class="my_rate">1.2점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="facimood_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="facimood_name">시설 및 분위기</span>
									<span class="my_rate">3.3점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="wifiplug_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="wifiplug_name">와이파이&콘센트</span>
									<dspaniv class="my_rate">1.1점</span>
								</div>  
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="clean_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="clean_name">청결</span>
									<span class="my_rate">6.2점</span>
								</div>
								
							</div>
						</div>
						<div class="cafe_review_bottom">  
							<div>
								<img src="img/cafe_1.jpg"/>
							</div>
							<div class="comment">
								<p>숙소가 매우 깨끗했고, 준비가 전체적으로 잘 되어있었어요. 도착시간 때문에 체크인 시간도 조정해주시고 너무 친절했어요 :)</p>
							</div>
						</div>
					</div>
					<div class="cafe_review_each">
						<div class="cafe_review_top">
							<div class="user_info">   
								<div>
									<img src="http://placehold.it/50x50"/>
								</div>
								<h2>최재명</h2>
								<h2>1주일 전</h2>
							</div>
							<div class="rating">
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="taste_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="taste_name">맛</span>
									<span class="my_rate">3.1점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="price_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="price_name">가격</span>
									<span class="my_rate">5.2점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="service_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="service_name">서비스</span>
									<span class="my_rate">1.2점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="facimood_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="facimood_name">시설 및 분위기</span>
									<span class="my_rate">3.3점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="wifiplug_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="wifiplug_name">와이파이&콘센트</span>
									<dspaniv class="my_rate">1.1점</span>
								</div>  
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="clean_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="clean_name">청결</span>
									<span class="my_rate">6.2점</span>
								</div>
								
							</div>
						</div>
						<div class="cafe_review_bottom">  
							<div>
								<img src="img/cafe_1.jpg"/>
							</div>
							<div class="comment">
								<p>숙소가 매우 깨끗했고, 준비가 전체적으로 잘 되어있었어요. 도착시간 때문에 체크인 시간도 조정해주시고 너무 친절했어요 :)</p>
							</div>
						</div>
					</div>
					<div class="cafe_review_each">
						<div class="cafe_review_top">
							<div class="user_info">   
								<div>
									<img src="http://placehold.it/50x50"/>
								</div>
								<h2>최재명</h2>
								<h2>1주일 전</h2>
							</div>
							<div class="rating">
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="taste_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="taste_name">맛</span>
									<span class="my_rate">3.1점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="price_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="price_name">가격</span>
									<span class="my_rate">5.2점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="service_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="service_name">서비스</span>
									<span class="my_rate">1.2점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="facimood_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="facimood_name">시설 및 분위기</span>
									<span class="my_rate">3.3점</span>
								</div>
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="wifiplug_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="wifiplug_name">와이파이&콘센트</span>
									<dspaniv class="my_rate">1.1점</span>
								</div>  
								<div class="rate_each2" id="rate_each2">
									<span class="rate_visual" id="clean_visual">
										<img src="img/wifi.png">
									</span>
									<span class="rate_name" id="clean_name">청결</span>
									<span class="my_rate">6.2점</span>
								</div>
								
							</div>
						</div>
						<div class="cafe_review_bottom">  
							<div>
								<img src="img/cafe_1.jpg"/>
							</div>
							<div class="comment">
								<p>숙소가 매우 깨끗했고, 준비가 전체적으로 잘 되어있었어요. 도착시간 때문에 체크인 시간도 조정해주시고 너무 친절했어요 :)</p>
							</div>
						</div>
					</div>
					
				</div>
				<div class="review_navi_nums">
				<div>
					<div class="num">
						<div class="navi_first_btn"><a href="#"><img src="img/arrow_first.png"></a></div>
					</div>  
					<div class="num">
						<div class="navi_prev10_btn"><a href="#"><img src="img/arrow_prev.png"></a></div>
					</div>
					<div class="num"><a href="#">1</a></div>
					<div class="present" ><a href="#">2</a></div> 
					<div class="num"><a href="#">3</a></div>
					<div class="num"><a href="#">4</a></div>
					<div class="num"><a href="#">5</a></div>
					<div class="num">
						<div class="navi_next10_btn"><a href="#"><img src="img/arrow_next.png"></a></div>					
					</div>
					<div class="num">					
						<div class="navi_last_btn"><a href="#"><img src="img/arrow_last.png"></a></div>					
					</div>
				</div>
			</div>
			</div>
			
		</div>
	</div>
	
	<!-- 푸터 include -->
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>