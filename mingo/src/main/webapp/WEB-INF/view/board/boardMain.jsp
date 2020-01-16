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
		
		
    <!-- 내가 만든 파일-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
</head>

<body>
    <!-- 내비게이션 include -->
		<%@ include file="/WEB-INF/view/include/navigation.jsp"%>
		
    <div class="board-wrapper">
        <div class="list-group list-group-flush board-side shadow">
            <div class="board-side-name">
                <i class="fa fa-file-text-o ml-2 " style="font-size:2em;">&nbsp;&nbsp;게시판</i>
            </div>
            <a href="#" class="list-group-item mt-2" style="border-top:none;">자유게시판</a>
            <a href="#" class="list-group-item">정보게시판</a>
            <a href="#" class="list-group-item">취업게시판</a>

        </div>
        <div class=" board-group shadow ml-4">
            <div class="mb-4" style="font-size:2em;">
               자유게시판
            </div>
            
            <div class="list-group list-group-flush board-main">
                <a href="#" class="list-group-item">
                    <div style="float:left;padding:0 14px;">번호</div>
                    <div style="float:left;padding:0 157px;">제목</div>
                    <div style="float:left;padding:0 30px">작성자</div>
                    <div style="float:left;padding:0 30px">등록일</div>
                    <div style="float:left;padding:0 14px">조회</div>
                    <div style="float:left;padding:0 14px">추천</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5555</div>
                    <div id="b-title" style="float:left;">이런건 어떡하죠?</div>
                    <div id="b-username" style="float:left;">홍길동</div>
                    <div id="b-regdate" style="float:left;">20.01.02</div>
                    <div id="b-readcount" style="float:left;">707</div>
                    <div id="b-goodcount" style="float:left;">3</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5556</div>
                    <div id="b-title" style="float:left;">안녕하세요?</div>
                    <div id="b-username" style="float:left;">김길동</div>
                    <div id="b-regdate" style="float:left;">20.03.02</div>
                    <div id="b-readcount" style="float:left;">107</div>
                    <div id="b-goodcount" style="float:left;">0</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5555</div>
                    <div id="b-title" style="float:left;">이런건 어떡하죠?</div>
                    <div id="b-username" style="float:left;">홍길동</div>
                    <div id="b-regdate" style="float:left;">20.01.02</div>
                    <div id="b-readcount" style="float:left;">707</div>
                    <div id="b-goodcount" style="float:left;">3</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5556</div>
                    <div id="b-title" style="float:left;">안녕하세요?</div>
                    <div id="b-username" style="float:left;">김길동</div>
                    <div id="b-regdate" style="float:left;">20.03.02</div>
                    <div id="b-readcount" style="float:left;">107</div>
                    <div id="b-goodcount" style="float:left;">0</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5555</div>
                    <div id="b-title" style="float:left;">이런건 어떡하죠?</div>
                    <div id="b-username" style="float:left;">홍길동</div>
                    <div id="b-regdate" style="float:left;">20.01.02</div>
                    <div id="b-readcount" style="float:left;">707</div>
                    <div id="b-goodcount" style="float:left;">3</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5556</div>
                    <div id="b-title" style="float:left;">안녕하세요?</div>
                    <div id="b-username" style="float:left;">김길동</div>
                    <div id="b-regdate" style="float:left;">20.03.02</div>
                    <div id="b-readcount" style="float:left;">107</div>
                    <div id="b-goodcount" style="float:left;">0</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5555</div>
                    <div id="b-title" style="float:left;">이런건 어떡하죠?</div>
                    <div id="b-username" style="float:left;">홍길동</div>
                    <div id="b-regdate" style="float:left;">20.01.02</div>
                    <div id="b-readcount" style="float:left;">707</div>
                    <div id="b-goodcount" style="float:left;">3</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5556</div>
                    <div id="b-title" style="float:left;">안녕하세요?</div>
                    <div id="b-username" style="float:left;">김길동</div>
                    <div id="b-regdate" style="float:left;">20.03.02</div>
                    <div id="b-readcount" style="float:left;">107</div>
                    <div id="b-goodcount" style="float:left;">0</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5555</div>
                    <div id="b-title" style="float:left;">이런건 어떡하죠?</div>
                    <div id="b-username" style="float:left;">홍길동</div>
                    <div id="b-regdate" style="float:left;">20.01.02</div>
                    <div id="b-readcount" style="float:left;">707</div>
                    <div id="b-goodcount" style="float:left;">3</div>
                </a>
                <a href="#" class="list-group-item">
                    <div id="b-num" style="float:left;">5556</div>
                    <div id="b-title" style="float:left;">안녕하세요?</div>
                    <div id="b-username" style="float:left;">김길동</div>
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
                <button type="button" class="btn btn-secondary btn-write">글쓰기</button>
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

   <!-- 푸터 include -->
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>