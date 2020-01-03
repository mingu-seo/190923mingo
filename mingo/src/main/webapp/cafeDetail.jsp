<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail information page about each cafe</title>
<!--부트 스트랩 관련 파일-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<style>
		/* header 부분 스타일 기본값 */
		.memubar_space{
			height:100px;
		}
		.logo{
			width:20%;
		}
		.logo > img{
			width:100%;
		}	
		#cafe_name{
			float:left;
			margin-right
		}
		.rate_avg > img{
			float:left;
			width:5%;
		}
		#rate_num{
			font-size: 2.0em;  
		} 
		
		
		
		
		
	</style>

</head>
<body>
	<!-- 로고, 메뉴 네비게이션 -->
	<div class="container-fluid fixed-top bg-dark" style="opacity: 0.9;">
	    <div class="container">
	        <nav class="navbar navbar-expand-sm navbar-dark">
	            <a class="navbar-brand" href="#"><i class="fa fa-coffee"
	                    style="font-size:1.5em;font-weight:bold;">&nbsp;Mingo</i></a>
	            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	                <span class="navbar-toggler-icon"></span>
	            </button>
	            <div class="collapse navbar-collapse" id="collapsibleNavbar">
	                <ul class="navbar-nav">
	                    <li class="nav-item">
	                        <a class="nav-link" href="#">카페</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="#">게시판</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="#">랭킹/통계</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="#">내정보</a>
	                    </li>
	                </ul>
	                <ul class="navbar-nav ml-auto">
	                    <li class="nav-item">
	                        <a class="nav-link" href="#">회원가입</a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link" href="#">로그인</a>
	                    </li>
	                </ul>
	            </div>
	        </nav>
	    </div>
	</div>
	
	<!-- 빈공간. 코딩 편의를 위해 레이어 앞면에 고정된 메뉴바가 차지하는 만큼 빈공간 부여 -->
	<div class="memubar_space"></div>
	
	<!-- 카페 로고 및 기본 정보 표시란 -->
	<div class="header">
		<div class="container">
			<div class="logo">
				<img src="img/starbucks.png">
			</div>
			<div class="title">
				<div id="cafe_name">
					<h2>스타벅스</h2>
				</div>
				<div id="branch_name">
					<h2>건대입구점</h2>
				</div>     
			</div>
			<div class="info">
				<div class="rate_avg">
					<img src="img/star_colored.png">
					<div id="rate_num">3.5점</div>
				</div>
				<div class="address">서울특별시 광진구 자양4동 123-23번지</div>
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
					<div class="title"></div>
					<hr>
					<div class="basic_info_content">
						<div class="basic_info_each" id="info_address"></div>
						<div class="basic_info_each" id="info_tel"></div>
						<div class="basic_info_each" id="info_mg_time"></div>
					</div>
				</div>
				<div class="detail_info">
					<div class="detail_info_button">
						<div class="button_each" id="menu_btn"></div>
						<div class="button_each" id="facility_btn"></div>
						<div class="button_each" id="service_btn"></div>
						<div class="button_each" id="product_btn"></div>
					</div>
					<div class="menu">
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>						
						</div>
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>						
						</div>
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>						
						</div>
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>						
						</div>
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>						
						</div>
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>						
						</div>
					</div>
					<div class="facility">
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>
						</div>
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>
						</div>
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>
						</div>
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>
						</div>
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>
						</div>
					</div>
					<div class="service">
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>
						</div>
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>
						</div>
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>
						</div>
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>
						</div>
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>
						</div>
					</div>
					<div class="product">
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>
						</div>			
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>
						</div>			
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>
						</div>			
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>
						</div>			
						<div class="info_each">
							<img src="http://placehold.it/100x100"/>
							<div>
								<h4>무설탕 흑당라떼</h4>
								<h4>17,000원</h4>
							</div>
						</div>			
					</div>
				</div>
				<div class="cafe_photo"></div>
				<div class="cafe_location"></div>
			</div>		
		</div>
		<div class="container">
			<div class="cafe_review">
				<div class="cafe_rates">
					<div class="rate_info">
						<div class="info">
							<div class="rate_avg">
								<img src="img/star_colored.png">
								<div class="rate_num">3.5</div>
								<div class="review_num">27개</div>
								<div class="ranking">2/9</div>
							</div>
						</div>	
					</div>
					<div class="rate_visual">
						<div class="rate_each">
							<div class="rate_visual" id="taste_visual_tatal"></div>
							<div class="rate_name" id="taste_name_tatal"></div>
						</div>
						<div class="rate_each">
							<div class="rate_visual" id="price_visual_tatal"></div>
							<div class="rate_name" id="price_name_tatal"></div>
						</div>
						<div class="rate_each">
							<div class="rate_visual" id="service_visual_tatal"></div>
							<div class="rate_name" id="service_name_tatal"></div>
						</div>
						<div class="rate_each">
							<div class="rate_visual" id="facimood_visual_tatal"></div>
							<div class="rate_name" id="facimood_name_tatal"></div>
						</div>
						<div class="rate_each">
							<div class="rate_visual" id="wifiplug_visual_tatal"></div>
							<div class="rate_name" id="wifiplug_name_tatal"></div>
						</div>
						<div class="rate_each">
							<div class="rate_visual" id="clean_visual_tatal"></div>
							<div class="rate_name" id="clean_name_tatal"></div>
						</div>
					</div>
				</div>
				<div class="cafe_reviews">
					<div class="cafe_review_each">
						<div class="cafe_review_left">
							<div class="user_info">
								<img src="http://placehold.it/100x100"/>
								<h2>최재명</h2>
								<h2>1주일 전</h2>
							</div>
							<div class="rating">
								<div class="rate_each">
									<div class="rate_visual" id="taste_visual"></div>
									<div class="rate_name" id="taste_name"></div>
								</div>
								<div class="rate_each">
									<div class="rate_visual" id="price_visual"></div>
									<div class="rate_name" id="price_name"></div>
								</div>
								<div class="rate_each">
									<div class="rate_visual" id="service_visual"></div>
									<div class="rate_name" id="service_name"></div>
								</div>
								<div class="rate_each">
									<div class="rate_visual" id="facimood_visual"></div>
									<div class="rate_name" id="facimood_name"></div>
								</div>
								<div class="rate_each">
									<div class="rate_visual" id="wifiplug_visual"></div>
									<div class="rate_name" id="wifiplug_name"></div>
								</div>  
								<div class="rate_each">
									<div class="rate_visual" id="clean_visual"></div>
									<div class="rate_name" id="clean_name"></div>
								</div>
								
							</div>
						</div>
						<div class="cafe_review_right">
							<div>
								<img src="http://placehold.it/100x100"/>
							</div>
							<div class="comment"></div>
						</div>
					</div>
				</div>
				<div class="review_navi_nums">
					<span class="navi_first_btn"></span>
					<span class="navi_prev10_btn"></span>
					<a href="#"></a>
					<a href="#"></a>
					<a href="#"></a>
					<a href="#"></a>
					<a href="#"></a>					
					<span class="navi_next10_btn"></span>
					<span class="navi_last_btn"></span>
				</div>
			</div>
			
		</div>
	</div>
	
	<!-- footer -->
	<div class="jumbotron jumbotron-fluid">
	    <div class="container">
	        <div class="footer clearfix mb-2">
	            <a href="#" class="fa fa-coffee" style="font-size:3em;float:left;font-weight: bold;">&nbsp;Mingo</a>
	            <a href="#" class="fa fa-twitter" style="font-size:3em;float:right"></a>
	            <a href="#" class="fa fa-facebook" style="font-size:3em;float:right;margin-right:20px;"></a>
	            <a href="#" class="fa fa-youtube" style="font-size:3em;float:right;margin-right:20px;"></a>
	        </div>
	        <p style="font-size:1.1em">
	        	서울특별시 금천구 대륭테크노타운 3차 8F | 대표이사:홍길동 | 사업자등록번호:123-45-12345<br>
	           	통신판매업신고번호: 2019-서울금천-12345 | 대표메일: honggildong@naver.com<br>
	            Copyright. All Rights Reserved.
	        </p>
	    </div>
	</div>
</body>
</html>