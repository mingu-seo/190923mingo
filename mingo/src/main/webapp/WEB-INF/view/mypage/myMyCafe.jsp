<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
		
	
	</style>
	
	<script>
		$(function(){
			$.ajax({
				url:'myCafeAjax.do',
				type:'GET',
				dataType:'text',
				success:function(data){
					$('.myCafe-area').html(data);
					
				} 
			});  
			
		});
	
	</script>
	
	
	
</head>

<body>
    <%@ include file="/WEB-INF/view/include/navigation.jsp"%>
    <div class="container-fluid mypage-header">
        <div class="mypage-header-wrapper">
            <div class="mypage-name">
	            <div class="mypage-img">
	            	<c:if test="${sessionScope.userVO.profile_image != null }">
	                	<img class="rounded-circle" src="<%=request.getContextPath() %>/upload/user/${sessionScope.userVO.profile_image }">
	                </c:if>
	                <c:if test="${sessionScope.userVO.profile_image == null}">
	                	<img class="rounded-circle" src="<%=request.getContextPath() %>/img/default/profile.png">
	                </c:if>
	            </div>
	            <div class="mypage-userid">${sessionScope.userVO.nickname }</div>
            </div>
        </div>
    </div>
	<div class="container-fluid nav-wrapper">
	    <ul class="nav nav-pills mypage-nav" style="width:1140px;">
	        <li class="nav-item">
	          <a class="nav-link my-link" data-toggle="pill" href="javascript:void(0);" onclick="location.href='myMain.do?user_id=${userVO.user_id }'">회원정보</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link  active my-link" data-toggle="pill" href="javascript:void(0);" onclick="location.href='myCafe.do?user_id=${userVO.user_id }'">내 카페</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link my-link" data-toggle="pill" href="javascript:void(0);" onclick="location.href='myReview.do?user_id=${userVO.user_id }'">활동내역</a>
	        </li>
	    </ul>
	</div>
    <div class="board-wrapper2">
        <div class="list-group list-group-flush board-side shadow">
            <div class="board-side-name">
                <i class="fa fa-gear ml-2 " style="font-size:2em;">&nbsp;내 카페</i>
            </div>
            <a href="#" class="list-group-item mt-2" style="border-top:none;font-weight:bold;">내 카페</a>
        </div>
        
        <div class=" board-group shadow ml-4">
            <div class="pb-2 mb-4 board-name" style="border-bottom: 1px solid #6E6E6E;">
               	내 카페
            </div>
            <div class="myCafe-area"></div>
            
                       
        </div>
    </div>
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>	
</body>

</html>