<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

		<!-- 헤더파일들 include -->
		<%@ include file="/WEB-INF/view/include/headHTML.jsp"%>
		
		
    <!-- 내가 만든 파일-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
	
	<style>
		.nav-pills .my-link.active, .nav-pills .show>.my-link {
			color: #fff;
			background-color: #6c757d;
			border-radius: 20px;
		}
		
		.my-link:focus, .my-link:hover {
			text-decoration: none;
			color: black;
			background-color: #f1f1f1;
			border-radius: 20px;
		}
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
	
</head>

<body>
    <!-- 내비게이션 include -->
		<%@ include file="/WEB-INF/view/include/navigation.jsp"%>
		
    <div class="container-fluid mypage-header">
        <div class="mypage-header-wrapper">
            <div class="mypage-name">
	            <div class="mypage-img">
	                <img class="rounded-circle" src="img/admin2/admin.png">
	            </div>
	            <div class="mypage-userid">관리자</div>
            </div>
        </div>
    </div>
	<div class="container-fluid nav-wrapper">
		<div class="container">
	    <ul class="nav nav-pills" style="width:1140px;">
	        <li class="nav-item">
	          <a class="nav-link  my-link active"  data-toggle="pill" href="mngUserForm.do">회원관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link  my-link" data-toggle="pill" href="mngCafeForm.do">카페관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link  my-link" data-toggle="pill" href="mngBoardForm.do">게시판관리</a>
	        </li>
	    </ul>
	   </div>
	</div>
    <div class="board-wrapper2">
        <div class="list-group list-group-flush board-side shadow">
            <div class="board-side-name">
                <i class="fa fa-gear ml-2 " style="font-size:2em;">&nbsp;&nbsp;회원구분</i>
            </div>
            <a href="#" class="list-group-item mt-2" style="border-top:none;">일반회원</a>
            <a href="#" class="list-group-item">사장님</a>
            
        </div>  
        
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
		
			<ul class="pagination mypagi justify-content-center">
        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
        <li class="page-item active"><a class="page-link" href="#">1</a></li>
        <li class="page-item "><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">4</a></li>
        <li class="page-item"><a class="page-link" href="#">5</a></li>
        <li class="page-item"><a class="page-link" href="#">6</a></li>
        <li class="page-item"><a class="page-link" href="#">7</a></li>
        <li class="page-item"><a class="page-link" href="#">8</a></li>
        <li class="page-item"><a class="page-link" href="#">9</a></li>
        <li class="page-item"><a class="page-link" href="#">10</a></li>
        <li class="page-item"><a class="page-link" href="#">Next</a></li> 
      </ul>
			
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

   	<!-- 푸터 include -->
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>