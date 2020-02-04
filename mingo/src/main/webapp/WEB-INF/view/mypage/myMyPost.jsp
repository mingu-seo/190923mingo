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
	                    <div id="b-username" style="float:left;">${userVO.nickname }</div>
	                    <div id="b-regdate" style="float:left;">${post.regdate }</div>
	                    <div id="b-readcount" style="float:left;">${post.readcount }</div>
	                    <div id="b-goodcount" style="float:left;">${post.like_num }</div>
	                </a>
                </c:forEach>
            </div>
            <ul class="pagination mypagi justify-content-center">
                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item active"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">6</a></li>
                <li class="page-item"><a class="page-link" href="#">7</a></li>
                <li class="page-item"><a class="page-link" href="#">8</a></li>
                <li class="page-item"><a class="page-link" href="#">9</a></li>
                <li class="page-item"><a class="page-link" href="#">10</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                
            </ul>
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