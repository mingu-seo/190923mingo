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
				url:'myPostAjax.do',
				type:'GET',
				dataType:'html',
				data:{'currentPage':currentPage},
				success:function(data){
					$('.myPost-area').html(data);
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
            
            <div class="pb-2 mb-4 board-name" >
               	내가 쓴 게시글
            </div>
            <div class="myPost-area">
            
            </div>
            
            <div class="input-group justify-content-center">
                <div class="input-group-prepend">
                    <select class="form-control filter" >
                        <option>전체기간</option>
                        <option>1주</option>
                        <option>1개월</option>
                        <option>1년</option>
                    </select>
                    <select class="form-control filter" >
                        <option>제목</option>
                        <option>내용</option>
                        <option>글쓴이</option>
                        <option>제목+내용</option>
                    </select>
                    
                    <input type="text" class="form-control mr-2" style="width:188px">
                    <button tpye="button" class="form-control" style="width:80px;">검색</button>
                </div>
            </div>  
        </div>
    </div>
    <%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>