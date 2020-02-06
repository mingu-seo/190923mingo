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
		.myReview-area{
			height:3000px;
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
			var user_id = ${userVO.user_id};
			console.log(currentPage);
			  
			$.ajax({
				url:'myReviewAjax.do',
				type:'GET',
				dataType:'html',
				data:{'currentPage':currentPage},
				success:function(data){
					$('.myReview-area').html(data);
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
               	내가 쓴 리뷰     
            </div>
            <div class="myReview-area">
            	
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>