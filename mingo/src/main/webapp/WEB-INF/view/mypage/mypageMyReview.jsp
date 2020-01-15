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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/choicss1.css">
	
	<style>
		.my_reviews{
			padding:20px 0;
		}
		
		.my_reviews {
			width:100%;   
			/* height:2000px; */     
		} 
		.my_review_each{
			width:100%;     
			margin-bottom:40px;  
			border-bottom:1px solid #D8D8D8;
			
			
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
			width:27%;
			float:left;
			
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
			height:100%;
			  
		}
		.my_comment{
			width:100%;
			height:100%;
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
			
			/* margin:0 auto;
			padding:0 auto; */  
			/* line-height: 200px; */
			text-align:center;  
		}      
		
		.review_navi_nums a{
			margin:0 20px;
		
		}
		
		.my_review_btn{   
			width:13%;
			height:380px;
			float: left;
		}
		.my_review_btn > div{
		}
		
		.my_review_modify_btn, .my_review_delete_btn{
			width:50px;
			height:50px;
			border-radius: 50px;
			line-height: 50px;
			text-align: center;
			background-color: #848484;			
			margin:0 auto;    
			margin-bottom:10px;    
			color:#FFFFFF;
			font-weight: bold;    
		}
	
	</style>
	
	<script>
	$(function(){
		var review_each_height = $('.my_review_bottom img').height()+$('.my_comment').height()+20;
		
		$('.my_review_each').css({
			'height':review_each_height+'px'
		});
		
		$('.cafe_reviews').css({
			'height':review_each_height*5+200+'px'
		});    
	}); 
	
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
               	내가 쓴 리뷰     
            </div>  
            <div class="cafe_reviews">
				<div class="my_review_each">
					<div class="my_review_top">
						<div class="rated_cafe_info">   
							<div>
								<img src="img/starbucks.png"/>
							</div>
							<h2>스타벅스</h2>
							<h2>샤로수길점</h2>
						</div>
						<div class="my_rating">
							<div id="my_rate_header">
								<img src="img/star_colored.png">
								<span>내 점수</span>  
								  
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_taste_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_taste_name">맛</span>
								<span class="my_my_rate">3.1점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_price_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_price_name">가격</span>
								<span class="my_my_rate">5.2점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_service_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_service_name">서비스</span>
								<span class="my_my_rate">1.2점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_facimood_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_facimood_name">시설 및 분위기</span>
								<span class="my_my_rate">3.3점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_wifiplug_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_wifiplug_name">와이파이&콘센트</span>
								<dspaniv class="my_my_rate">1.1점</span>
							</div>  
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_clean_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_clean_name">청결</span>
								<span class="my_my_rate">6.2점</span>
							</div>
						</div>	
						<div class="review_ragdate">
							<p>작성일: 2020.01.02</p>
						</div>
					</div>
					<div class="my_review_bottom">  
						<div>
							<img src="img/cafe_1.jpg"/>
						</div>
						<div class="my_comment">
							<p>숙소가 매우 깨끗했고, 준비가 전체적으로 잘 되어있었어요. 도착시간 때문에 체크인 시간도 조정해주시고 너무 친절했어요 :)</p>
						</div>
					</div>
					<div class="my_review_btn">
						<div class="my_review_modify_btn">
							수정
						</div>
						<div class="my_review_delete_btn">
							삭제
						</div>
					</div>
				</div>
				<div class="my_review_each">
					<div class="my_review_top">
						<div class="rated_cafe_info">   
							<div>
								<img src="img/starbucks.png"/>
							</div>
							<h2>스타벅스</h2>
							<h2>샤로수길점</h2>
						</div>
						<div class="my_rating">
							<div id="my_rate_header">
								<img src="img/star_colored.png">
								<span>내 점수</span>  
								  
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_taste_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_taste_name">맛</span>
								<span class="my_my_rate">3.1점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_price_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_price_name">가격</span>
								<span class="my_my_rate">5.2점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_service_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_service_name">서비스</span>
								<span class="my_my_rate">1.2점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_facimood_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_facimood_name">시설 및 분위기</span>
								<span class="my_my_rate">3.3점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_wifiplug_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_wifiplug_name">와이파이&콘센트</span>
								<dspaniv class="my_my_rate">1.1점</span>
							</div>  
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_clean_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_clean_name">청결</span>
								<span class="my_my_rate">6.2점</span>
							</div>
						</div>	
						<div class="review_ragdate">
							<p>작성일: 2020.01.02</p>
						</div>
					</div>
					<div class="my_review_bottom">  
						<div>
							<img src="img/cafe_1.jpg"/>
						</div>
						<div class="my_comment">
							<p>숙소가 매우 깨끗했고, 준비가 전체적으로 잘 되어있었어요. 도착시간 때문에 체크인 시간도 조정해주시고 너무 친절했어요 :)</p>
						</div>
					</div>
					<div class="my_review_btn">
						<div class="my_review_modify_btn">
							수정
						</div>
						<div class="my_review_delete_btn">
							삭제
						</div>
					</div>
				</div>
				<div class="my_review_each">
					<div class="my_review_top">
						<div class="rated_cafe_info">   
							<div>
								<img src="img/starbucks.png"/>
							</div>
							<h2>스타벅스</h2>
							<h2>샤로수길점</h2>
						</div>
						<div class="my_rating">
							<div id="my_rate_header">
								<img src="img/star_colored.png">
								<span>내 점수</span>  
								  
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_taste_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_taste_name">맛</span>
								<span class="my_my_rate">3.1점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_price_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_price_name">가격</span>
								<span class="my_my_rate">5.2점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_service_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_service_name">서비스</span>
								<span class="my_my_rate">1.2점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_facimood_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_facimood_name">시설 및 분위기</span>
								<span class="my_my_rate">3.3점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_wifiplug_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_wifiplug_name">와이파이&콘센트</span>
								<dspaniv class="my_my_rate">1.1점</span>
							</div>  
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_clean_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_clean_name">청결</span>
								<span class="my_my_rate">6.2점</span>
							</div>
						</div>	
						<div class="review_ragdate">
							<p>작성일: 2020.01.02</p>
						</div>
					</div>
					<div class="my_review_bottom">  
						<div>
							<img src="img/cafe_1.jpg"/>
						</div>
						<div class="my_comment">
							<p>숙소가 매우 깨끗했고, 준비가 전체적으로 잘 되어있었어요. 도착시간 때문에 체크인 시간도 조정해주시고 너무 친절했어요 :)</p>
						</div>
					</div>
					<div class="my_review_btn">
						<div class="my_review_modify_btn">
							수정
						</div>
						<div class="my_review_delete_btn">
							삭제
						</div>
					</div>
				</div>
				<div class="my_review_each">
					<div class="my_review_top">
						<div class="rated_cafe_info">   
							<div>
								<img src="img/starbucks.png"/>
							</div>
							<h2>스타벅스</h2>
							<h2>샤로수길점</h2>
						</div>
						<div class="my_rating">
							<div id="my_rate_header">
								<img src="img/star_colored.png">
								<span>내 점수</span>  
								  
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_taste_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_taste_name">맛</span>
								<span class="my_my_rate">3.1점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_price_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_price_name">가격</span>
								<span class="my_my_rate">5.2점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_service_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_service_name">서비스</span>
								<span class="my_my_rate">1.2점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_facimood_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_facimood_name">시설 및 분위기</span>
								<span class="my_my_rate">3.3점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_wifiplug_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_wifiplug_name">와이파이&콘센트</span>
								<dspaniv class="my_my_rate">1.1점</span>
							</div>  
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_clean_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_clean_name">청결</span>
								<span class="my_my_rate">6.2점</span>
							</div>
						</div>	
						<div class="review_ragdate">
							<p>작성일: 2020.01.02</p>
						</div>
					</div>
					<div class="my_review_bottom">  
						<div>
							<img src="img/cafe_1.jpg"/>
						</div>
						<div class="my_comment">
							<p>숙소가 매우 깨끗했고, 준비가 전체적으로 잘 되어있었어요. 도착시간 때문에 체크인 시간도 조정해주시고 너무 친절했어요 :)</p>
						</div>
					</div>
					<div class="my_review_btn">
						<div class="my_review_modify_btn">
							수정
						</div>
						<div class="my_review_delete_btn">
							삭제
						</div>
					</div>
				</div>
				<div class="my_review_each">
					<div class="my_review_top">
						<div class="rated_cafe_info">   
							<div>
								<img src="img/starbucks.png"/>
							</div>
							<h2>스타벅스</h2>
							<h2>샤로수길점</h2>
						</div>
						<div class="my_rating">
							<div id="my_rate_header">
								<img src="img/star_colored.png">
								<span>내 점수</span>  
								  
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_taste_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_taste_name">맛</span>
								<span class="my_my_rate">3.1점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_price_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_price_name">가격</span>
								<span class="my_my_rate">5.2점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_service_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_service_name">서비스</span>
								<span class="my_my_rate">1.2점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_facimood_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_facimood_name">시설 및 분위기</span>
								<span class="my_my_rate">3.3점</span>
							</div>
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_wifiplug_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_wifiplug_name">와이파이&콘센트</span>
								<dspaniv class="my_my_rate">1.1점</span>
							</div>  
							<div class="my_rate_each2" id="my_rate_each2">
								<span class="my_rate_visual" id="my_clean_visual">
									<img src="img/wifi.png">
								</span>
								<span class="my_rate_name" id="my_clean_name">청결</span>
								<span class="my_my_rate">6.2점</span>
							</div>
						</div>	
						<div class="review_ragdate">
							<p>작성일: 2020.01.02</p>
						</div>
					</div>
					<div class="my_review_bottom">  
						<div>
							<img src="img/cafe_1.jpg"/>
						</div>
						<div class="my_comment">
							<p>숙소가 매우 깨끗했고, 준비가 전체적으로 잘 되어있었어요. 도착시간 때문에 체크인 시간도 조정해주시고 너무 친절했어요 :)</p>
						</div>
					</div>
					<div class="my_review_btn">
						<div class="my_review_modify_btn">
							수정
						</div>
						<div class="my_review_delete_btn">
							삭제
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