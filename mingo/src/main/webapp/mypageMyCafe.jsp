<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <!--부트 스트랩 관련 파일-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>



    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- 내가 만든 파일-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/styleByHong2.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/choicss1.css">
	
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
			font-size: 2.0em;
			font-weight: bold;
			color:#2E2E2E;
		}
		.collect_cafe_star img{
			width:40px;
		}
		.collect_cafe_avgRate{
			font-size: 2.0em;
			font-weight: bold;
			color:#2E2E2E;
		
		}
		
		.collect_cafe_info_content{
			height:70%;
			padding-top:20px;
		}
		
		.collect_cafe_address {
			font-size:1.2em;   
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
		
		.review_navi_nums{
			width:100%;
			height:100px;
			padding-top:40px;
		}
		  
		.review_navi_nums > div{
			line-height:60px;
			height:60px;
			width:100%;
			
			/* margin:0 auto;
			padding:0 auto; */  
			/* line-height: 200px; */
			text-align:center;  
		}      
		
		.review_navi_nums a{
			margin:0 20px;
		
		}
	
	</style>
	
	<script>
	
	
	</script>
	
	
	
</head>

<body>
    <div class="container-fluid fixed-top bg-dark" style="opacity: 1;">
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
    <div class="container-fluid mypage-header">
        <div class="mypage-header-wrapper">
            <div class="mypage-name">
	            <div class="mypage-img">
	                <img class="rounded-circle" src="img/profile.png">
	            </div>
	            <div class="mypage-userid">밍고</div>
            </div>
        </div>
    </div>
	<div class="container-fluid nav-wrapper">
	    <ul class="nav mypage-nav" style="width:1140px;">
	        <li class="nav-item">
	          <a class="nav-link active"  data-toggle="pill" href="#">계정</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" data-toggle="pill" href="#">활동내역</a>
	        </li>
	    </ul>
	</div>
    <div class="board-wrapper2">
        <div class="list-group list-group-flush board-side shadow">
            <div class="board-side-name">
                <i class="fa fa-gear ml-2 " style="font-size:2em;">&nbsp;&nbsp;활동내역</i>
            </div>
            <a href="#" class="list-group-item mt-2" style="border-top:none;">내가 쓴 리뷰</a>
            <a href="#" class="list-group-item">내가 쓴 게시글</a>
            <a href="#" class="list-group-item">내가 찜한 카페</a>
        </div>
        
        <div class=" board-group shadow ml-4">
            <div class="pb-2 mb-4 board-name" style="border-bottom: 1px solid #6E6E6E;">
               	찜한 카페
            </div>
            
            <div class="collect_cafes">
            	<div class="collect_cafe_each">
            		<div class="collect_cafe_logo">
            			<img src="img/starbucks.png">
            		</div>
            		<div class="collect_cafe_info">
            			<div class="collect_cafe_info_header">
            				<div class="collect_cafe_title">스타벅스 샤로수길점 &nbsp</div>
            				<div class="collect_cafe_star">
            					<img src="img/star_colored.png">
            				</div>
            				<div class="collect_cafe_avgRate">3.6</div>
            			</div>
            			<div class="collect_cafe_info_content">
            				<div class="collect_cafe_address">서울특별시 광진구 자양4동 123-23번지</div>
            				<div class="collect_cafe_eachRate">
            					<div class="each_rate" id="collect_menu">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_price">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_wifiplug">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_service">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_facility">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_product">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            				</div>
            			</div>
            		</div>
            	</div>
            	<div class="collect_cafe_each">
            		<div class="collect_cafe_logo">
            			<img src="img/starbucks.png">
            		</div>
            		<div class="collect_cafe_info">
            			<div class="collect_cafe_info_header">
            				<div class="collect_cafe_title">스타벅스 샤로수길점 &nbsp</div>
            				<div class="collect_cafe_star">
            					<img src="img/star_colored.png">
            				</div>
            				<div class="collect_cafe_avgRate">3.6</div>
            			</div>
            			<div class="collect_cafe_info_content">
            				<div class="collect_cafe_address">서울특별시 광진구 자양4동 123-23번지</div>
            				<div class="collect_cafe_eachRate">
            					<div class="each_rate" id="collect_menu">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_price">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_wifiplug">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_service">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_facility">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_product">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            				</div>
            			</div>
            		</div>
            	</div>
            	<div class="collect_cafe_each">
            		<div class="collect_cafe_logo">
            			<img src="img/starbucks.png">
            		</div>
            		<div class="collect_cafe_info">
            			<div class="collect_cafe_info_header">
            				<div class="collect_cafe_title">스타벅스 샤로수길점 &nbsp</div>
            				<div class="collect_cafe_star">
            					<img src="img/star_colored.png">
            				</div>
            				<div class="collect_cafe_avgRate">3.6</div>
            			</div>
            			<div class="collect_cafe_info_content">
            				<div class="collect_cafe_address">서울특별시 광진구 자양4동 123-23번지</div>
            				<div class="collect_cafe_eachRate">
            					<div class="each_rate" id="collect_menu">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_price">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_wifiplug">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_service">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_facility">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_product">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            				</div>
            			</div>
            		</div>
            	</div>
            	<div class="collect_cafe_each">
            		<div class="collect_cafe_logo">
            			<img src="img/starbucks.png">
            		</div>
            		<div class="collect_cafe_info">
            			<div class="collect_cafe_info_header">
            				<div class="collect_cafe_title">스타벅스 샤로수길점 &nbsp</div>
            				<div class="collect_cafe_star">
            					<img src="img/star_colored.png">
            				</div>
            				<div class="collect_cafe_avgRate">3.6</div>
            			</div>
            			<div class="collect_cafe_info_content">
            				<div class="collect_cafe_address">서울특별시 광진구 자양4동 123-23번지</div>
            				<div class="collect_cafe_eachRate">
            					<div class="each_rate" id="collect_menu">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_price">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_wifiplug">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_service">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_facility">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_product">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            				</div>
            			</div>
            		</div>
            	</div>
            	<div class="collect_cafe_each">
            		<div class="collect_cafe_logo">
            			<img src="img/starbucks.png">
            		</div>
            		<div class="collect_cafe_info">
            			<div class="collect_cafe_info_header">
            				<div class="collect_cafe_title">스타벅스 샤로수길점 &nbsp</div>
            				<div class="collect_cafe_star">
            					<img src="img/star_colored.png">
            				</div>
            				<div class="collect_cafe_avgRate">3.6</div>
            			</div>
            			<div class="collect_cafe_info_content">
            				<div class="collect_cafe_address">서울특별시 광진구 자양4동 123-23번지</div>
            				<div class="collect_cafe_eachRate">
            					<div class="each_rate" id="collect_menu">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_price">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_wifiplug">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_service">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_facility">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            					<div class="each_rate" id="collect_product">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">4.1</div>
            					</div>
            				</div>
            			</div>
            		</div>
            	</div>
            </div>            
         	<div class="review_navi_nums">
				<div>
					<span class="navi_first_btn"><a href="#">맨 처음</a></span>
					<span class="navi_prev10_btn"><a href="#">이전</a></span>
					<a href="#">1</a>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>					
					<span class="navi_next10_btn"><a href="#">다음</a></span>
					<span class="navi_last_btn"><a href="#">맨 끝</a></span>					
				</div>
			</div>
            
        </div>
    </div>

    <div class="jumbotron jumbotron-fluid m-0">
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