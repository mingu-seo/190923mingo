<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    
		<!-- 헤더파일들 include -->
		<%@ include file="/WEB-INF/view/include/headHTML.jsp"%>
		
		
    <!-- masonry -->
    <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>

    <!-- imagesloaded-->
    <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.js"></script>

    
    <!-- 내가 만든 파일-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
    <script src="<%=request.getContextPath() %>/js/resultScript.js"></script>
    <script>
			$(document).ready(function(){
				
				function hi(){
					alert('hi');
				}
			});
    </script>
</head>

<body>
    <!-- 내비게이션 include -->
		<%@ include file="/WEB-INF/view/include/navigation.jsp"%>

	<div class="container-fluid result-nav bg-white pb-0">
		<div class="container result-nav-wrapper p-1">
			<ul class="nav nav-pills">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="pill" href="javascript:void(0);" onclick="alert('55')">평점 순</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="pill"
					href="cafeOrderByReview.do">리뷰 순</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="pill"
					href="cafeOrderByLike.do">좋아요 순</a></li>
			</ul>
		</div>
	</div>
	<!-- 본문 영역-->
    <div class="container grid clearfix p-0">
        <c:forEach var="cafe" items="${cafeList }">
        	<div class="grid-item">
            <div class="cafe cafe-img">
                <a href="#"><img src='<%=request.getContextPath() %>/img/cafe.jpg' alt=""></a>
            </div>
            <div class="cafe cafe-name ml-1 mt-2 mb-2" style="font-size:0.9em;"><a href="#">${cafe.name } ${cafe.branch }</a></div>
            <div class="cafe cafe-address mb-1">${cafe.cafe_address }</div>
            <div class="cafe cafe-score float-left">평점 3.9
            </div>
            <div class="cafe star-rating float-left mt-1 ml-2">
            		<div></div>
            	</div>
            <div class="cafe cafe-like float-right" style="font-size:1em"><i
								class="fa fa-heart text-danger"
								style="font-size: 1em;"></i>&nbsp;133개
						</div>
        	</div>
        </c:forEach>
    </div>
    <div class="d-flex justify-content-center align-items-center">
        <div id="test" ></div>
    </div>
    
    <div style="text-align: center;">
        <button class="btn btn-secondary" type="button" id="add" style="width:300px;">More...</button>
    </div>
    
    <!-- 푸터 include -->
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>