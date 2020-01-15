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
            <div class="mb-4 board-name">
               자유게시판
               <span style="font-size: 0.5em;">글쓰기</span>
            </div>
            
            <input type="text" class="form-control" placeholder="제목을 입력해 주세요.">
            <textarea class="mt-2 p-2" rows="20"  style="font-size:1em;width:100%;border:1px solid #e1e1e1;" placeholder="주제와 무관한 댓글, 악플은 삭제 될 수 있습니다."></textarea>
            <div style="text-align: center;">
                <button type="button" class="btn btn-secondary">취소</button>
                <button type="button" class="btn btn-secondary">작성완료</button>
            </div>
        </div>
    </div>

    <!-- 푸터 include -->
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>