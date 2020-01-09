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
		.userList_area{
			width:100%;
			height:600px;
		}
		.list_header{
			width:100%;
			height:50px;
			border-bottom:1px solid #1C1C1C;
		}    
		.list_content{
			width:100%;
			height:50px;
			border-bottom:1px solid #D8D8D8;
		}
		
		.list_header div{
			text-align: center;
			line-height: 50px;
			font-size: 1.2em;
			font-weight: bold;
		}
		.list_content div{
			text-align: center;
			line-height: 50px;
			font-size: 1.2em;
		}
		
		.l_id{
			width:15%;
			height:100%;
		}
		.l_name{
			width:20%;
			height:100%;
		}
		.l_email{
			width:40%;
			height:100%;
		}
		.l_regdate{
			width:25%;
			height:100%;
		}
		
		.review_navi_nums{
			width:100%;
			height:60px;
			 
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
		.search_area{
			padding:20px;
		}
		.search_area_inner{
			height:35px;
			width:600px;
			margin:0 auto;
		}
		.select_btn {
			width:120px;  
			height:35px;
			box-sizing: border-box; 
			marign:0; 
			border-radius: 3px;
			border:1px solid #D8D8D8;
		}
		.search_field{
			width:180px;  
			height:35px;  			
			box-sizing: border-box; 
			marign:0; 	
			border-radius: 3px;
			box-shadow: none;
			border:1px solid #D8D8D8;
		}
		.search_btn{
			width:150px;  
			height:35px;
			background-color: initial;
			border:none;
			color:#1C1C1C;
			font-size:1.0em;
			padding:0px;
			box-sizing: border-box;
			marign:0;
			border:1px solid #D8D8D8;
			border-radius: 3px;
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
          
        
        <div class=" board-group shadow ml-4">
            <div class="pb-4 mb-1 board-name" style="border-bottom: 1px solid #6E6E6E;">
               	회원목록     
            </div>  
            
            <div class="userList_area">
            	<div class="list_header">
            		<div class="l_id" style="float:left">아이디</div>
            		<div class="l_name" style="float:left">이름</div>
            		<div class="l_email" style="float:left">이메일</div>
            		<div class="l_regdate" style="float:left">가입일</div>
            	</div>
            	<div class="list_content">
            		<div class="l_id" style="float:left">1</div>
            		<div class="l_name" style="float:left">최재명</div>
            		<div class="l_email" style="float:left">0ptimist0@naver.com</div>
            		<div class="l_regdate" style="float:left">2020-01-09 10:21</div>
            	</div>
            	<div class="list_content">
            		<div class="l_id" style="float:left">1</div>
            		<div class="l_name" style="float:left">최재명</div>
            		<div class="l_email" style="float:left">0ptimist0@naver.com</div>
            		<div class="l_regdate" style="float:left">2020-01-09 10:21</div>
            	</div>
            	<div class="list_content">
            		<div class="l_id" style="float:left">1</div>
            		<div class="l_name" style="float:left">최재명</div>
            		<div class="l_email" style="float:left">0ptimist0@naver.com</div>
            		<div class="l_regdate" style="float:left">2020-01-09 10:21</div>
            	</div>
            	<div class="list_content">
            		<div class="l_id" style="float:left">1</div>
            		<div class="l_name" style="float:left">최재명</div>
            		<div class="l_email" style="float:left">0ptimist0@naver.com</div>
            		<div class="l_regdate" style="float:left">2020-01-09 10:21</div>
            	</div>
            	<div class="list_content">
            		<div class="l_id" style="float:left">1</div>
            		<div class="l_name" style="float:left">최재명</div>
            		<div class="l_email" style="float:left">0ptimist0@naver.com</div>
            		<div class="l_regdate" style="float:left">2020-01-09 10:21</div>
            	</div>
            	<div class="list_content">
            		<div class="l_id" style="float:left">1</div>
            		<div class="l_name" style="float:left">최재명</div>
            		<div class="l_email" style="float:left">0ptimist0@naver.com</div>
            		<div class="l_regdate" style="float:left">2020-01-09 10:21</div>
            	</div>
            	<div class="list_content">
            		<div class="l_id" style="float:left">1</div>
            		<div class="l_name" style="float:left">최재명</div>
            		<div class="l_email" style="float:left">0ptimist0@naver.com</div>
            		<div class="l_regdate" style="float:left">2020-01-09 10:21</div>
            	</div>
            	<div class="list_content">
            		<div class="l_id" style="float:left">1</div>
            		<div class="l_name" style="float:left">최재명</div>
            		<div class="l_email" style="float:left">0ptimist0@naver.com</div>
            		<div class="l_regdate" style="float:left">2020-01-09 10:21</div>
            	</div>
            	<div class="list_content">
            		<div class="l_id" style="float:left">1</div>
            		<div class="l_name" style="float:left">최재명</div>
            		<div class="l_email" style="float:left">0ptimist0@naver.com</div>
            		<div class="l_regdate" style="float:left">2020-01-09 10:21</div>
            	</div>
            	<div class="list_content">
            		<div class="l_id" style="float:left">1</div>
            		<div class="l_name" style="float:left">최재명</div>
            		<div class="l_email" style="float:left">0ptimist0@naver.com</div>
            		<div class="l_regdate" style="float:left">2020-01-09 10:21</div>
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
			
			<div class="search_area">
                <div class="search_area_inner">
                    <select class="select_btn" >
                        <option>전체기간</option>
                        <option>1주</option>
                        <option>1개월</option>
                        <option>1년</option>
                    </select>
                    <select class="select_btn" >
                        <option>제목</option>
                        <option>내용</option>
                        <option>글쓴이</option>
                        <option>제목+내용</option>
                    </select>
                    
                    <input type="text" class="search_field">
                    <button type="button" class="search_btn" >검색</button>
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