<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <!--부트 스트랩 관련 파일-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>



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
    <div class="container-fluid fixed-top bg-dark" style="opacity: 1;">
        <div class="container">
            <nav class="navbar navbar-expand-sm navbar-dark">
                <a class="navbar-brand" href="#"><i class="fa fa-coffee"
                        style="font-size:1.5em;font-weight:bold;">&nbsp;Mingo</i></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">카페</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">게시판</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">랭킹/통계</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ml-auto">    
                        <li class="nav-item">
                            <a class="nav-link" href="#">회원가입</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">로그인</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <div class="container-fluid mypage-header">
        <div class="mypage-header-wrapper">
            <div class="mypage-name">
	            <div class="mypage-img">
	                <img class="rounded-circle" src="img/profile.png">
	            </div>
	            <div class="mypage-userid">밍고</div>
            </div>
        </div>
    </div>
	<div class="container-fluid nav-wrapper">
	    <ul class="nav mypage-nav" style="width:1140px;">
	        <li class="nav-item">
	          <a class="nav-link active"  data-toggle="pill" href="#">계정</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" data-toggle="pill" href="#">활동내역</a>
	        </li>
	    </ul>
	</div>
    <div class="board-wrapper2">
        <div class="list-group list-group-flush board-side shadow">
            <div class="board-side-name">
                <i class="fa fa-gear ml-2 " style="font-size:2em;">&nbsp;&nbsp;활동내역</i>
            </div>
            <a href="#" class="list-group-item mt-2" style="border-top:none;">내가 쓴 리뷰</a>
            <a href="#" class="list-group-item">내가 쓴 게시글</a>
            <a href="#" class="list-group-item">내가 찜한 카페</a>
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
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5555</div>
                    <div id="b-title" style="float:left;">이런건 어떡하죠?</div>
                    <div id="b-username" style="float:left;">자유게시판</div>
                    <div id="b-regdate" style="float:left;">20.01.02</div>
                    <div id="b-readcount" style="float:left;">707</div>
                    <div id="b-goodcount" style="float:left;">3</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5556</div>
                    <div id="b-title" style="float:left;">안녕하세요?</div>
                    <div id="b-username" style="float:left;">자유게시판</div>
                    <div id="b-regdate" style="float:left;">20.03.02</div>
                    <div id="b-readcount" style="float:left;">107</div>
                    <div id="b-goodcount" style="float:left;">0</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5555</div>
                    <div id="b-title" style="float:left;">이런건 어떡하죠?</div>
                    <div id="b-username" style="float:left;">자유게시판</div>
                    <div id="b-regdate" style="float:left;">20.01.02</div>
                    <div id="b-readcount" style="float:left;">707</div>
                    <div id="b-goodcount" style="float:left;">3</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5556</div>
                    <div id="b-title" style="float:left;">안녕하세요?</div>
                    <div id="b-username" style="float:left;">취업게시판</div>
                    <div id="b-regdate" style="float:left;">20.03.02</div>
                    <div id="b-readcount" style="float:left;">107</div>
                    <div id="b-goodcount" style="float:left;">0</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5555</div>
                    <div id="b-title" style="float:left;">이런건 어떡하죠?</div>
                    <div id="b-username" style="float:left;">자유게시판</div>
                    <div id="b-regdate" style="float:left;">20.01.02</div>
                    <div id="b-readcount" style="float:left;">707</div>
                    <div id="b-goodcount" style="float:left;">3</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5556</div>
                    <div id="b-title" style="float:left;">안녕하세요?</div>
                    <div id="b-username" style="float:left;">취업게시판</div>
                    <div id="b-regdate" style="float:left;">20.03.02</div>
                    <div id="b-readcount" style="float:left;">107</div>
                    <div id="b-goodcount" style="float:left;">0</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5555</div>
                    <div id="b-title" style="float:left;">이런건 어떡하죠?</div>
                    <div id="b-username" style="float:left;">취업게시판</div>
                    <div id="b-regdate" style="float:left;">20.01.02</div>
                    <div id="b-readcount" style="float:left;">707</div>
                    <div id="b-goodcount" style="float:left;">3</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5556</div>
                    <div id="b-title" style="float:left;">안녕하세요?</div>
                    <div id="b-username" style="float:left;">자유게시판</div>
                    <div id="b-regdate" style="float:left;">20.03.02</div>
                    <div id="b-readcount" style="float:left;">107</div>
                    <div id="b-goodcount" style="float:left;">0</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5555</div>
                    <div id="b-title" style="float:left;">이런건 어떡하죠?</div>
                    <div id="b-username" style="float:left;">취업게시판</div>
                    <div id="b-regdate" style="float:left;">20.01.02</div>
                    <div id="b-readcount" style="float:left;">707</div>
                    <div id="b-goodcount" style="float:left;">3</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5556</div>
                    <div id="b-title" style="float:left;">안녕하세요?</div>
                    <div id="b-username" style="float:left;">자유게시판</div>
                    <div id="b-regdate" style="float:left;">20.03.02</div>
                    <div id="b-readcount" style="float:left;">107</div>
                    <div id="b-goodcount" style="float:left;">0</div>
                </a>
                
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

    <div class="jumbotron jumbotron-fluid m-0">
        <div class="container">
            <div class="footer clearfix mb-2">
                <a href="#" class="fa fa-coffee" style="font-size:3em;float:left;font-weight: bold;">&nbsp;Mingo</a>
                <a href="#" class="fa fa-twitter" style="font-size:3em;float:right"></a>
                <a href="#" class="fa fa-facebook" style="font-size:3em;float:right;margin-right:20px;"></a>
                <a href="#" class="fa fa-youtube" style="font-size:3em;float:right;margin-right:20px;"></a>
            </div>
            <p style="font-size:1.1em">
		                서울특별시 금천구 대륭테크노타운 3차 8F | 대표이사:홍길동 | 사업자등록번호:123-45-12345<br>
		                통신판매업신고번호: 2019-서울금천-12345 | 대표메일: honggildong@naver.com<br>
                Copyright. All Rights Reserved.
            </p>
        </div>

    </div>
</body>

</html>