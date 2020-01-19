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
    
	<%@ include file="/WEB-INF/view/include/headHTML.jsp"%>

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
    <%@ include file="/WEB-INF/view/include/navigation.jsp"%>
    <div class="container-fluid mypage-header">
        <div class="mypage-header-wrapper">
            <div class="mypage-name">
	            <div class="mypage-img">
	                <img class="rounded-circle" src="upload/user/${userVO.profile_image }">
	            </div>
	            <div class="mypage-userid">${userVO.nickname }</div>
            </div>
        </div>
    </div>
	<div class="container-fluid nav-wrapper">
	    <ul class="nav mypage-nav" style="width:1140px;">
	        <li class="nav-item">
	          <a class="nav-link active"  data-toggle="pill" href="myMain.do?user_id=${user_id }">회원정보</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" data-toggle="pill" href="myCafe.do?user_id=${user_id }">내 카페</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" data-toggle="pill" href="myReview.do?user_id=${user_id }">활동내역</a>
	        </li>
	    </ul>
	</div>
    <div class="board-wrapper2">
        <div class="list-group list-group-flush board-side shadow">
            <div class="board-side-name">
                <i class="fa fa-gear ml-2 " style="font-size:2em;">&nbsp;회원정보</i>
            </div>
            <a href="#" class="list-group-item mt-2" style="border-top:none;">내 정보 관리</a>
            <a href="#" class="list-group-item">비밀번호 변경</a>
            <a href="#" class="list-group-item">회원 탈퇴</a>
            
        </div>  
        
        <div class=" board-group shadow ml-4">
            <div class="pb-4 mb-1 board-name" style="border-bottom: 1px solid #6E6E6E;">
               	내 정보 관리
            </div>  
            <div class="user_info_area">
            	<div class="profile_area">
            		<img src="upload/user/${userVO.profile_image }" id="profile_img">
            		<h2>${userVO.nickname }</h2>
            	</div>
            	
            	<div class="info_area">
            		<br>	
            		<div class="info_each">
	            		<div class="info_title">이용자 유형</div>
	            		<div class="info_content">${userVO.type }</div>            			
            		</div>
            		<div class="info_each">
	            		<div class="info_title">이메일</div>
	            		<div class="info_content">${userVO.email }</div>            			
            		</div>
            		<div class="info_each">
	            		<div class="info_title">이름</div>
	            		<div class="info_content">${userVO.name }</div>            			
            		</div>
            		<div class="info_each">
	            		<div class="info_title">생년월일</div>
	            		<div class="info_content">${userVO.birthday }</div>            			
            		</div>
            		<div class="info_each">
	            		<div class="info_title">성별</div>
	            		<div class="info_content">${userVO.gender }</div>            			
            		</div>
            		<div class="info_each">
	            		<div class="info_title">휴대전화 번호</div>
	            		<div class="info_content">${userVO.phone_num }</div>            			
            		</div>
            		<div class="info_each" id="addr">
	            		<div class="info_title">주소</div>
	            		<div class="info_content">${userVO.address } <br></div>            			
            		</div>
            	</div>
	            <button type="button" onclick="location.href='#'" id="withdraw_user">수정</button>
            </div>
			
        </div>
    </div>
    <%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>