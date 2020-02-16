<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		
		.user_info_area{
			text-align: center;
			width:100%;
			padding:40px 0 0 0;  
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
	            	<c:if test="${userVO.profile_image != null && userVO.profile_image !=''}">
	                	<img class="rounded-circle" src="<%=request.getContextPath() %>/upload/user/${userVO.profile_image }">
	                </c:if>
	                <c:if test="${!(userVO.profile_image != null && userVO.profile_image !='')}">
	                	<img class="rounded-circle" src="<%=request.getContextPath() %>/img/default/profile.png">
	                </c:if>
	            </div>
	            <div class="mypage-userid">${userVO.nickname }<span style="font-size:0.8em;">님</span></div>
            </div>
        </div>
    </div>
    <!-- mypage 내비게이션 -->
    <%@ include file="/WEB-INF/view/mypage/myNav.jsp"%>
    
    
    <div class="board-wrapper2">
        <div class="list-group list-group-flush board-side shadow">
            <div class="board-side-name">
                <i class="fa fa-gear ml-2 " style="font-size:2em;">&nbsp;회원정보</i>
            </div>
            <a href="myMain.do" class="list-group-item mt-2" style="border-top:none;font-weight:bold;">내 정보 관리</a>
            <a href="myUserModifyForm1.do" class="list-group-item">비밀번호 변경</a>
            <a href="deleteUserForm.do" class="list-group-item">회원 탈퇴</a>
            
        </div>  
        
        <div class=" board-group shadow ml-4">
            <div class="pb-4 mb-1 board-name" style="border-bottom: 1px solid #6E6E6E;">
               	내 정보 관리
            </div>  
            <div class="user_info_area">
            	<div class="profile_area">
            		<c:if test="${userVO.profile_image != null && userVO.profile_image !=''}">
            		<img src="<%=request.getContextPath() %>/upload/user/${userVO.profile_image }" id="profile_img">
            		</c:if>
            		<c:if test="${!(userVO.profile_image != null && userVO.profile_image !='')}">
            		<img src="<%=request.getContextPath() %>/img/default/profile.png" id="profile_img">
            		</c:if>
            		<h2>${userVO.nickname }</h2>
            	</div>
            	
            	<div class="info_area">
            		<br>	
            		<div class="info_each">
	            		<div class="info_title">이용자 유형</div>
	            		<c:if test="${userVO.type == 1 }">
	            			<div class="info_content">일반 회원</div>
	            		</c:if>
	            		<c:if test="${userVO.type == 2 }">
	            			<div class="info_content">사장님 회원</div>
	            		</c:if>            			
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
	            		<c:if test="${userVO.gender == 1 }">
	            		<div class="info_content">여자</div>
	            		</c:if>
	            		<c:if test="${userVO.gender == 2 }">
	            		<div class="info_content">남자</div>
	            		</c:if>            			
            		</div>
            		<div class="info_each">
	            		<div class="info_title">휴대전화 번호</div>
	            		<c:set value="${userVO.phone_num }" var="pn"/>
	            		<c:if test="${!(userVO.phone_num != null && userVO.phone_num !='')}">
	            		<div class="info_content">미등록</div> 
	            		</c:if>
	            		<c:if test="${(userVO.phone_num != null && userVO.phone_num !='')}">
	            		<div class="info_content">${fn:substring(pn,0,3)}-${fn:substring(pn,3,7)}-${fn:substring(pn,7,11)}  </div> 
	            		</c:if>         			
            		</div>
            		<div class="info_each" id="addr">
	            		<div class="info_title">주소</div>
	            		<c:if test="${!(userVO.jibun_address != null && userVO.jibun_address !='')}">
	            		<div class="info_content">미등록</div>  
	            		</c:if>
	            		<c:if test="${userVO.jibun_address != null && userVO.jibun_address !=''}">
	            		<div class="info_content">${userVO.jibun_address }</div>  
	            		</c:if>          			
            		</div>
            	</div>
	            <button type="button" onclick="location.href='modifyUserForm.do'" class="btn btn-secondary" style="width:150px;">수정</button>
            </div>
			
        </div>
    </div>
    <%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>