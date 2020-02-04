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
			
			
			var user_id = ${userVO.user_id};  
			
			
			/* 페이징 처리 함수 */
			var pasing = function(currentPage, user_id){
				$.ajax({
					url:'myPostAjax.do',
					type:'GET',
					dataType:'html',
					data:{'user_id':user_id,
						'currentPage':currentPage},
					success:function(data){
						$('.myPost-area').html(data);
					}
				});
				
			};
	
			/* 번호 클릭 */
			$('.num-btn').click(function(){
				var currentPage = $(this).text();
				pasing(currentPage, user_id);
			});
			
			/* 맨 처음으로 */
			$('.navi_first_btn').click(function(){
				var currentPage = 1;
				pasing(currentPage, user_id);
			});
			
			/* 이전 5개 */
			$('.navi_prev10_btn').click(function(){
				var beginPage = ${beginPage};
				if (beginPage==1){   
					var currentPage = 1;
				} else{
					var currentPage = beginPage-5;
				}
				pasing(currentPage, user_id);
			});
			
			/* 다음 5개 */
			$('.navi_next10_btn').click(function(){
				var beginPage = ${beginPage};
				var endPage = ${endPage};
				var maxPage = ${maxPage};
				if (endPage==maxPage){   
					var currentPage = Math.floor((maxPage-1)/5)*5+1;
				} else{
					var currentPage = beginPage+5;
				}
				pasing(currentPage, user_id);
			});
			
			/* 맨 끝으로 */
			$('.navi_last_btn').click(function(){
				var currentPage = $('.max-btn').val();
				pasing(currentPage, user_id);
			});
	
		});
	
	</script>
	
</head>
<body>
    
            
    <div class="list-group list-group-flush board-main">
        <a href="#" class="list-group-item">
            <div style="float:left;padding:0 14px;">번호</div>
            <div style="float:left;padding:0 157px;">제목</div>
            <div style="float:left;padding:0 30px">게시판</div>
            <div style="float:left;padding:0 30px">등록일</div>
            <div style="float:left;padding:0 14px">조회</div>
            <div style="float:left;padding:0 14px">추천</div>
        </a>
        <c:forEach items="${boardList}" var="post" varStatus="status">
         <a href="#" class="list-group-item">
             <div id="b-num" style="float:left;">${post.board_id }</div>
             <div id="b-title" style="float:left;">${post.title }</div>
             <div id="b-username" style="float:left;">${userVO.type }</div>
             <div id="b-regdate" style="float:left;">${post.regdate }</div>
             <div id="b-readcount" style="float:left;">${post.readcount }</div>
             <div id="b-goodcount" style="float:left;">${post.like_num }</div>
         </a>
        </c:forEach>
    </div>
    <div class="review_navi_nums">
		<div>
			<div class="num">
				<div class="navi_first_btn"><div><img src="img/arrow_first.png"></div></div>
				<input type="hidden" value="1" class="min-btn">			
			</div>  
			<div class="num">
				<div class="navi_prev10_btn"><div><img src="img/arrow_prev.png"></div></div>
			</div>
			<div class="num-area">
				<c:forEach var="num" begin="${beginPage}" end="${endPage}" step="1">
					<c:if test="${currentPage == num}">
						<div class="present" ><div class="num-btn">${num}</div></div> 					
					</c:if>
					<c:if test="${currentPage != num}">
						<div class="num" ><div class="num-btn">${num}</div></div> 					
					</c:if>
				</c:forEach>					
			</div>
			
			<div class="num">
				<div class="navi_next10_btn"><div><img src="img/arrow_next.png"></div></div>					
			</div>
			<div class="num">					
				<div class="navi_last_btn"><div><img src="img/arrow_last.png"></div></div>					
				<input type="hidden" value="${maxPage}" class="max-btn">
			</div>
		</div>
	</div>
            
        
</body>

</html>