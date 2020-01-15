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
		
		.user_info_area{
			text-align: center;
			width:100%;
			height:450px;
			padding:40px 0;  
		}
		.profile_area{
			padding-top:30px;
			width:40%;
			height:300px;
			float: left;
			text-align:center;
			 
			
		}
		#profile_img{
			width:180px;
			height:180px;
			border-radius: 180px;
			margin-bottom:30px;
		}
		
		
		.info_area{
			width:60%;
			height:300px;	
			float: left;
		}
		.info_each{
			width:100%;
			height:30px;  
		}
		
		.info_each > div{
			float:left;
			font-size: 1.0em;
		}
		
		.info_title{
			width:30%;
			height:100%;
			text-align:right;
			padding-right:20px;
			border-right:1px solid #BDBDBD;
			font-weight: bold;
			color:#084B8A;
		}
		.info_content{
			width:70%;
			height:100%;
			padding-left:20px; 
			/* font-weight: bold; */			
			color:#151515;
			text-align: left;  
		}
		#addr{
			height:60px;
		}
		#withdraw_user{
			margin-top:40px;  
			width:100px;  
			height:40px;
			border:none;
			background-color: #0B3861;
			color:#FFFFFF;
		}
		#withdraw_user:hover{
			background-color: #A9D0F5;
			color:#000000;
			font-weight: bold;
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
	            <div class="mypage-userid">관리자</div>
            </div>
        </div>
    </div>
	<div class="container-fluid nav-wrapper">
	    <ul class="nav mypage-nav" style="width:1140px;">
	        <li class="nav-item">
	          <a class="nav-link active"  data-toggle="pill" href="#">회원관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" data-toggle="pill" href="#">카페관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" data-toggle="pill" href="#">게시판관리</a>
	        </li>
	    </ul>
	</div>
    <div class="board-wrapper2">
        <div class="list-group list-group-flush board-side shadow">
            <div class="board-side-name">
                <i class="fa fa-gear ml-2 " style="font-size:2em;">&nbsp;&nbsp;회원구분</i>
            </div>
            <a href="#" class="list-group-item mt-2" style="border-top:none;">이용자</a>
            <a href="#" class="list-group-item">매니저</a>
            
        </div>  
        
        <div class=" board-group shadow ml-4">
            <div class="pb-4 mb-1 board-name" style="border-bottom: 1px solid #6E6E6E;">
               	상세정보 
            </div>  
            <div class="user_info_area">
            	<div class="profile_area">
            		<img src="img/userProfile.png" id="profile_img">
            		<h2>mingo</h2>
            	</div>
            	
            	<div class="info_area">
            		<div class="info_each">
	            		<div class="info_title">user_id</div>
	            		<div class="info_content">1</div>            			
            		</div>
            		<div class="info_each">
	            		<div class="info_title">이용자 유형</div>
	            		<div class="info_content">손님</div>            			
            		</div>
            		<div class="info_each">
	            		<div class="info_title">이메일</div>
	            		<div class="info_content">0ptimist0@naver.com</div>            			
            		</div>
            		<div class="info_each">
	            		<div class="info_title">이름</div>
	            		<div class="info_content">최재명</div>            			
            		</div>
            		<div class="info_each">
	            		<div class="info_title">생년월일</div>
	            		<div class="info_content">1992.10.02</div>            			
            		</div>
            		<div class="info_each">
	            		<div class="info_title">성별</div>
	            		<div class="info_content">남자</div>            			
            		</div>
            		<div class="info_each">
	            		<div class="info_title">휴대전화 번호</div>
	            		<div class="info_content">010-2692-7297</div>            			
            		</div>
            		<div class="info_each" id="addr">
	            		<div class="info_title">주소</div>
	            		<div class="info_content">서울특별시 동대문구 장안2동 <br> 316-4 301호(골든빌)</div>            			
            		</div>
            		
            		<div class="info_each">
	            		<div class="info_title">가입일</div>
	            		<div class="info_content">2020.01.09 16:25</div>            			
            		</div>
            	</div>
	            <button type="button" onclick="location.href='#'" id="withdraw_user">탈퇴처리</button>
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