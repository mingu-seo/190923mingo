<%@page import="util.Property"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			width:100%;
			margin:20px 0;
		}
		.logo > img{
			border-radius:50%;
			width:15%;
			filter: drop-shadow(0px 0px 20px #FFFFFF);
		}
		
		#cafe_name, #branch_name{
			font-color:#151515;
			font-size: 2.5em;
			font-weight:bold;
			text-shadow: 0px 0px 15px #FFFFFF;
			float:left;
			margin-right:20px;         
		}
		
		#like-cafe-btn, #collect-cafe-btn{
			float:left;
			margin-right:20px;
			width:40px;
			height:80px;
			line-height: 80px;
			position: relative;
			z-index:100;   
		}
		
		@font-face {
		  font-family: neon;
		  src: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/707108/neon.ttf);
		}  
		  
		#regist-review{
			position: relative;
			z-index:100;   
			float:left;
			width:100px;
			height:80px;
			line-height: 80px;   
		}
		#regist-review > a{
			font-weight: bold;
			font-family: neon;
		    color: #FFBF00;
		    font-size: 2vw;
		    text-shadow: 0 0 3vw #F40A35;		
		}
		
		#like-cafe-btn >img, #collect-cafe-btn >img{
			height:40%;
			line-height:40%; 
		}
		
		
		
		.title{
			width:100%;
			height:100px;
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
		
		/* #cafe_location_title{
			margin-bottom:20px;  
		}
		.cafe_location_map{
			width:700px;
			height:500px;
			padding:10px;
			
		}
		.cafe_location_map > img{
			width:100%;
			height:500px;   
		} */
		
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
		
		.graph_name{
			width:100px;
			float:left;
		}
		
		
		
		.graph_area{
            height:120px;  
            width:400px;
        }
        .graph_stack{
        	float:left;
            width:300px;
            height:40px;
            background-color: #D8D8D8;
            box-sizing: border-box;
            border-radius: 35px;
            line-height: 40px;
            /* position: relative;
            left:60px;   */
        }   

        .graph_rate{
            text-align: right;
            height:100%;
            background-color: #6d512f;
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
            height:30px;
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
			width:500px;
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
		
		::selection {
			background-color: #ECF8E0;
			
		}
		
	</style>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=197a1366c7c3fbd3d1f4e49445d212b0"></script>
	
	
	<script>
		$(function(){
			
			var latitude = ${cafe.latitude};
			var longitude = ${cafe.longitude};
			console.log(latitude);
			console.log(longitude);
			
			/* var container = document.getElementById('cafe-map');
			var options = {
				center: new kakao.maps.LatLng(latitude, longitude),
				level: 3
			};
			var map = new kakao.maps.Map(container, options); */
			
			var mapContainer = document.getElementById('cafe-map'), // 지도를 표시할 div  
		    	mapOption = { 
		        center: new kakao.maps.LatLng(latitude, longitude), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    	};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			 
			// 마커를 표시할 위치와 title 객체 배열입니다 
			var positions = [
			    {
			        title: '카카오', 
			        latlng: new kakao.maps.LatLng(latitude, longitude)
			    },
			    {
			        title: '생태연못', 
			        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
			    },
			    {
			        title: '텃밭', 
			        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
			    },
			    {
			        title: '근린공원',
			        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
			    }
			];
	
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			    
			for (var i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
			}
			
			
			var review_each_height = $('.cafe_review_bottom img').height()+$('.comment').height()+20;
			$('.cafe_review_each').css({
				'height':review_each_height+'px'
			});
			$('.cafe_reviews').css({
				'height':review_each_height*5+200+'px'
			});
				
			
			
			
			$('.info_button').click(function(){
				console.log("click");
				$('.info_button').css({
					'border-bottom':'2px solid #d4b270' 
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
				
				var latitude = ${cafe.latitude};
				var longitude = ${cafe.longitude};
				console.log(latitude);
				console.log(longitude);
				
				var container = document.getElementById('cafe-map');
				var options = {
					center: new kakao.maps.LatLng(latitude, longitude),
					level: 3
				};
				var map = new kakao.maps.Map(container, options);
				
				
			});	  
			$('.review_button').click(function(){
				console.log("click");
				$('.review_button').css({
					'border-bottom':'2px solid #d4b270' 
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
				
				var latitude = ${cafe.latitude};
				var longitude = ${cafe.longitude};
				console.log(latitude);
				console.log(longitude);
				
				var container = document.getElementById('cafe-map');
				var options = {
					center: new kakao.maps.LatLng(latitude, longitude),
					level: 3
				};
				var map = new kakao.maps.Map(container, options);
				
			});	
			
			
			
			$('#menu_btn').click(function(){
				console.log("click");
				$('#menu_btn').css({
					'border-bottom':'2px solid #21610B' 
				});
				$('#facility_btn, #service_btn, #product_btn').css({
					'border-style':'none' 
				});
				$('.menu').css({
					'display':'block'  
				});
				$('.facility, .service, .product').css({
					'display':'none'
				});
			});	
			$('#facility_btn').click(function(){
				console.log("click");
				$('#facility_btn').css({
					'border-bottom':'2px solid #21610B' 
				});
				$('#menu_btn, #service_btn, #product_btn').css({
					'border-style':'none' 
				});
				$('.facility').css({
					'display':'block'  
				});
				$('.menu, .service, .product').css({
					'display':'none'
				});
			});	
			$('#service_btn').click(function(){
				console.log("click");
				$('#service_btn').css({
					'border-bottom':'2px solid #21610B' 
				});
				$('#menu_btn, #facility_btn, #product_btn').css({
					'border-style':'none' 
				});
				$('.service').css({
					'display':'block'  
				});
				$('.menu, .facility, .product').css({
					'display':'none'
				});
			});	
			$('#product_btn').click(function(){
				console.log("click");
				$('#product_btn').css({
					'border-bottom':'2px solid #21610B' 
				});
				$('#menu_btn, #facility_btn, #service_btn').css({
					'border-style':'none' 
				});
				$('.product').css({
					'display':'block'  
				});
				$('.menu, .facility, .service').css({
					'display':'none'
				});
			});	
			
			// 좋아요 클릭 기능 
			var likeValue = $('#likeCafe').val();
			var cafe_id = <%=request.getParameter("cafe_id") %>;
			
			$('#like-cafe-btn').click(function(){
				if ($('#likeCafe').val()==0){
					console.log(likeValue);
					$('#like-img').attr("src", 'img/like.png');
					$.ajax({
						url:'registLike.do',
						type:'POST',
						data:{'cafe_id':cafe_id},
						success:function(data){
							$('#likeCafe').val('1');
						}
					});
					console.log("등록 성공");
					
				} else {
					$('#like-img').attr("src", 'img/likeNone.png');
					$.ajax({
						url:'deleteLike.do',
						type:'POST',
						data:{'cafe_id':cafe_id},
						success:function(data){
							$('#likeCafe').val('0');
						}
					});
					console.log("삭제 성공");
				}
				var likeValue = $('#likeCafe').val();
			});
			
			/* 찜하기 등록 삭제*/
			var collectValue = $('#collectCafe').val();
			$('#collect-cafe-btn').click(function(){
				if ($('#collectCafe').val()==0){
					console.log(collectValue);
					$('#collect-img').attr("src", 'img/collect.png');
					$.ajax({
						url:'registCollect.do',
						type:'POST',
						data:{'cafe_id':cafe_id},
						success:function(data){
							$('#collectCafe').val('1');
						}
					});
					console.log("등록 성공");
					
				} else {
					$('#collect-img').attr("src", 'img/collectNone.png');
					$.ajax({
						url:'deleteCollect.do',
						type:'POST',
						data:{'cafe_id':cafe_id},
						success:function(data){
							$('#collectCafe').val('0');
						}
					});
					console.log("삭제 성공");
				}
				var likeValue = $('#collectCafe').val();
			});
			
			/* 페이징 처리 */
			 
			var currentPage = 1;
			var rate_num = ${cafeRate.rate_num};
			$.ajax({
				url:'reviewViewForm.do',
				type:'GET',
				dataType:'text',
				data:{'cafe_id':cafe_id,
					'currentPage':currentPage,
					'rate_num':rate_num},
				success:function(data){
					$('.review-view').html(data);
					console.log(currentPage);
				}
			});   
			
			// 종합평점 그래프 점수 동적화
			var wifi_width = (${cafeRate.wifi_avg }/5)*300;
			$('#wifi-width').css({
				'width':wifi_width
			}); 
			
			
			
		});        
	 
	
	
	</script>

</head>
<body>
	<!-- 내비게이션 include -->
	<%@ include file="/WEB-INF/view/include/navigation.jsp" %>  
	
	<!-- 빈공간. 코딩 편의를 위해 레이어 앞면에 고정된 메뉴바가 차지하는 만큼 빈공간 부여 -->
	<div class="memubar_space">
		<img src="img/cafe_4.png">
	</div>
	
	<!-- 카페 로고 및 기본 정보 표시란 -->
	<div class="header">  
		<div class="container">
			<div class="logo">
				<img src="upload/cafe/${cafe.logo }">
			</div>
			<div class="title">
				<div id="cafe_name">
					${cafe.name }  
				</div>
				<div id="branch_name">
					${cafe.branch }
				</div>     
				<div id="like-cafe-btn">
					<c:if test="${likeCafe == 0}">
						<img src="img/likeNone.png" id="like-img">
						<input type="hidden" id="likeCafe" value="0">					
					</c:if>
					<c:if test="${likeCafe == 1}">
						<img src="img/like.png" id="like-img">
						<input type="hidden" id="likeCafe" value="1">					
					</c:if>
				</div>     
				<div id="collect-cafe-btn">
					<c:if test="${collectCafe == 0}">
						<img src="img/collectNone.png" id="collect-img">
						<input type="hidden" id="collectCafe" value="0">
					</c:if>
					<c:if test="${collectCafe == 1}">
						<img src="img/collect.png" id="collect-img">
						<input type="hidden" id="collectCafe" value="1">
					</c:if>
				</div>     
				<%-- <div id="regist-review">
					<a href="reviewRegistForm.do?cafe_id=${cafe_id }&user_id=${user_id }">re</a>
				</div>  --%>    
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
				<div class="review_button">후기</div>
				<div class="info_button">소개</div>
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
						<c:forEach var="menu" items="${menuList }">
							<div class="info_each">
								<img src='/upload/menu/${menu.image }'/>
								<div>
									<h6>${menu.name }</h6>
									<h6>${menu.price }원</h6>
								</div>						
							</div>						
						</c:forEach>
					</div>
					<div class="product">
						<c:forEach var="product" items="${productList }">
							<div class="info_each">
								<img src='/upload/product/${product.image }'/>
								<div>
									<h6>${product.name }</h6>
									<h6>${product.price }원</h6>
								</div>						
							</div>						
						</c:forEach>
					</div>
					<div class="facility">
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>와이파이</h6>
								<h6>${facilities.wifi}</h6>
							</div>
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>매장 규모</h6>
								<h6>${facilities.table }</h6>
							</div>
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>인테리어 분위기</h6>
								<h6>${facilities.interior }</h6>
							</div>
						</div>  
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>음악</h6>
								<h6>${facilities.music}</h6>
							</div>
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>플러그 수</h6>
								<h6>${facilities.plug}</h6>
							</div>
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>화장실</h6>
								<h6>${facilities.restroom}</h6>
							</div>
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>테라스</h6>
								<h6>${facilities.terrace}</h6>
							</div>
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>스터디룸</h6>
								<h6>${facilities.studyroom}</h6>
							</div>
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>흡연석</h6>
								<h6>${facilities.smoking}</h6>
							</div>
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div> 
								<h6>주차공간</h6>
								<h6>${facilities.parking}</h6>
							</div>
						</div>
					</div>
					<div class="service">
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>이벤트</h6>
								<h6>${service.event }</h6>
							</div>
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>쿠폰</h6>
								<h6>${service.coupon }</h6>
							</div>
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>마일리지</h6>
								<h6>${service.mileage }</h6>
							</div>
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>담요</h6>
								<h6>${service.blanket }</h6>
							</div>
						</div>
						<div class="info_each">
							<img src="img/coffee.png"/>
							<div>
								<h6>음료 리필</h6>
								<h6>${service.drinkrefill }</h6>
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
						<div id="cafe-map" style="width:500px;height:400px;"></div>	
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
								<div class="rate_num">${cafeRate.cafe_total_avg }점</div>
								<div class="review_num">(리뷰 ${cafeRate.rate_num }개,</div>
								<div class="ranking">자양4동 2위)</div>
							</div>
						</div>	
					</div>
					<div class="rate_visual_total">
						<div class="rate_each">
							<div class="rate_visual" id="taste_visual_tatal">
								<div class="graph_area">
						            <div>
						                <img src="img/taste.png" class="graph_logo">
						            </div>
						            <div class="graph_stack">
						                <div class="graph_rate">
						                    <img src="img/bean.PNG" class="bean_img">
						                    <div class="graph_text">${cafeRate.taste_avg }점</div>
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
						                <img src="img/mood.png" class="graph_logo">
						            </div>
						            <div class="graph_stack">
						                <div class="graph_rate">
						                    <img src="img/bean.PNG" class="bean_img">
						                    <div class="graph_text">${cafeRate.mood_avg }점</div>
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
						                <img src="img/service.png" class="graph_logo">
						            </div>
						            <div class="graph_stack">
						                <div class="graph_rate">
						                    <img src="img/bean.PNG" class="bean_img">
						                    <div class="graph_text">${cafeRate.service_avg }점</div>
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
						                <img src="img/wifi2.png" class="graph_logo">
						            </div>
						            <div class="graph_stack">
						                <div class="graph_rate" id="wifi-width">
						                    <img src="img/bean.PNG" class="bean_img">
						                    <div class="graph_text">${cafeRate.wifi_avg }점</div>
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
						                <img src="img/clean.png" class="graph_logo">
						            </div>
						            <div class="graph_stack">
						                <div class="graph_rate">
						                    <img src="img/bean.PNG" class="bean_img">
						                    <div class="graph_text">${cafeRate.clean_avg }점</div>
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
						                <img src="img/price.png" class="graph_logo">
						            </div>
						            <div class="graph_stack">
						                <div class="graph_rate">
						                    <img src="img/bean.PNG" class="bean_img">
						                    <div class="graph_text">${cafeRate.price_avg }점</div>
						                </div>
						            </div>
						        </div>  
							</div>  
							<div class="rate_name" id="clean_name_tatal"></div>
						</div>
					</div>
				</div>
				<div class="info_title" id="basic_info_title">리뷰</div>
				<div class="review-view">
				
				</div>
			</div>
		</div>
	</div>   
	
	<!-- 푸터 include -->
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>
</html>