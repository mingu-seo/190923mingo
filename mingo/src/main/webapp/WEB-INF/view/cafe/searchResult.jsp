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
		
		
    <!-- masonry -->
    <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>

    <!-- imagesloaded-->
    <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.js"></script>

    
    <!-- 내가 만든 파일-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
    <script src="<%=request.getContextPath() %>/js/resultScript.js"></script>
    <script>

    </script>
</head>

<body>
    <!-- 내비게이션 include -->
		<%@ include file="/WEB-INF/view/include/navigation.jsp"%>
	
    <div class="container-fluid result-nav bg-white pb-0">
        <div class="container result-nav-wrapper">
            <div><button type="button" class="btn btn-secondary nav-btn">추가</button></div>
            <div><button type="button" class="btn btn-secondary nav-btn">필터2</button></div>
            <div><button type="button" class="btn btn-secondary nav-btn">필터3</button></div>
        </div>
    </div>
    <!-- 본문 영역-->
    <div class="container grid clearfix p-0">
        
        
        
        <div class="grid-item">
            <div class="cafe cafe-img">
                <img src='<%=request.getContextPath() %>/img/cafe.jpg' alt="">
            </div>
            <div class="cafe cafe-name">스타벅스 자양2점</div>
            <div class="cafe cafe-address">서울시 광진구 자양 3동</div>
            <div class="cafe cafe-score">평점 3.9</div>
        </div>
        
        
        
        
        
        
        
        
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