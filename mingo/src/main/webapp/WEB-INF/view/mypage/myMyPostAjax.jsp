<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%> 
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
		.review_navi_nums{width:100%;height:200px;padding-top:40px;text-align:center;}
		.review_navi_nums > div{line-height:60px;height:60px;width:auto;display: inline-block;}      
		.num-area{width:auto;height:40px;float:left;}
		.num{margin:0 10px;width:40px;height:40px;float:left;}
		.present{width:40px;height:40px;border-radius: 40px;float:left;background-color: #86B404;text-align: center;line-height: 40px;margin:10px;}
		.num-btn{width:100%;height:auto;}
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
            <div style="box-sizing: border-box;float:left;width:100px;text-align:center;">번호</div>
            <div style="box-sizing: border-box;float:left;width:350px;text-align:center;">제목</div>
            <div style="box-sizing: border-box;float:left;width:110px;text-align:center;">게시판</div>
            <div style="box-sizing: border-box;float:left;width:150px;text-align:center;">등록일</div>
            <!-- <div style="float:left;padding:0 14px">조회</div>
            <div style="float:left;padding:0 14px">추천</div> -->
        </a>
        <c:forEach items="${boardList}" var="post" varStatus="status">
         <a href="#" class="list-group-item">
             <div id="b-num" style="box-sizing: border-box;float:left;text-align:center;width:100px;">${post.board_id }</div>
             <div id="b-title" style="box-sizing: border-box;float:left;width:350px;">${post.title }</div>
             <div id="b-username" style="box-sizing: border-box;float:left;text-align:center;width:110px;">${userVO.type }</div>
             <div id="b-regdate" style="box-sizing: border-box;float:left;text-align:center;width:150px;">
             	<fmt:parseDate var="sDate" value="${post.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
             	<fmt:formatDate value="${sDate}" pattern="yyyy-MM-dd" />
             </div>
             <%-- <div id="b-readcount" style="float:left;padding:0 14px">${post.readcount }</div>
             <div id="b-goodcount" style="float:left;padding:0 14px">${post.like_num }</div> --%>
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