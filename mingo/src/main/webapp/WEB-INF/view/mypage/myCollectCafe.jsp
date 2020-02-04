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
	
	</style>
	
	<script>
		$(function(){
			console.log("작동1");
			var currentPage = 1; 
			console.log(currentPage);
			
			$.ajax({
				url:'myCollectAjax.do',
				type:'GET',
				dataType:'html',
				data:{'currentPage':currentPage},
				success:function(data){
					$('.collect-area').html(data);
					console.log("작동2");
					
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
	                <img class="rounded-circle" src="upload/user/${userVO.profile_image }">
	            </div>
	            <div class="mypage-userid">${userVO.nickname }</div>
            </div>
        </div>
    </div>
	<div class="container-fluid nav-wrapper">
	    <ul class="nav mypage-nav" style="width:1140px;">
	        <li class="nav-item">
	          <a class="nav-link active" href="myMain.do?user_id=${userVO.user_id }">회원정보</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="myCafe.do?user_id=${userVO.user_id }">내 카페</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="myReview.do?user_id=${userVO.user_id }">활동내역</a>
	        </li>
	    </ul>
	</div>
    <div class="board-wrapper2">
        <div class="list-group list-group-flush board-side shadow">
            <div class="board-side-name">
                <i class="fa fa-gear ml-2 " style="font-size:2em;">&nbsp;&nbsp;활동내역</i>
            </div>
            <a href="myReview.do" class="list-group-item mt-2" style="border-top:none;">내가 쓴 리뷰</a>
            <a href="myPost.do" class="list-group-item">내가 쓴 게시글</a>
            <a href="myCollect.do" class="list-group-item">내가 찜한 카페</a>
        </div>
        <div class=" board-group shadow ml-4">
            <div class="pb-2 mb-4 board-name" style="border-bottom: 1px solid #6E6E6E;">
               	찜한 카페
            </div>
            <div class="collect-area">
            
            </div>
            
        </div>
    </div>
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>	
</body>

</html>