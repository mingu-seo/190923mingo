<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    <%@ page import="vo.BoardVO" %>
     <%@ page import="vo.UserVO" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
BoardVO vo = (BoardVO) request.getAttribute("vo");
	int nowPage = (Integer) request.getAttribute("page");
%>
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
<script type="text/javascript">
	function deleteboard(board_id) {
		var chk =  confirm("삭제하시겠습니까?");
		if (chk){
					location.href='delete.do?board_id='+board_id;
		}else{event.preventDefault();}
	}
</script>
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
        <form action="view.do" method="post" name="deleteform">
        <div class=" board-group shadow ml-4">
            <div class="mb-4 board-name">
               자유게시판
            </div>
            <div class="board-title p-2" ><%=vo.getTitle()%></div>
            
            <div class="board-title-info  p-2" style="overflow:hidden;">
                
                <div class="float-left" ><%=vo.getUser_id()%></div>
                <div class="float-right">조회 <%=vo.getReadcount()%> | 추천 | 날짜<%=vo.getRegdate()%> | 
                <a href="edit.do?board_id=<%=vo.getBoard_id()%>&page=<%=nowPage%>">수정</a> | 
                	<a href="list.do?page=<%=nowPage%>"  onclick="javascript: deleteboard(<%=vo.getBoard_id()%>)">삭제</a></div>
            </div>
            <div class="p-3"> <%=vo.getContents()%></div>
            
            <div class="mybtn-group">
                <button type="button" class="btn btn-secondary float-left"onclick="location.href='list.do?page=<%=nowPage%>' ">목록보기</button>
                <button type="button" class="btn float-right mybtn-good"><i class="fa fa-thumbs-o-down" style="font-size:1.5em;">1</i></button>
                <button type="button" class="btn float-right mybtn-bad"><i class="fa fa-thumbs-o-up" style="font-size:1.5em;">0</i></button>
                
            </div>
            </form>
            <div class="pb-3" style="border-bottom: 1px solid #a1a1a1;">
                <i class="fa fa-comment-o mr-2" style="font-size:1.5em;"></i>댓글 3개
            </div>
            <div class="reply">
                <div class="reply-name">홍길동</div>
                <div class="reply-content">반갑습니다1</div>
                <div class="reply-date">2020.01.03 13:20</div>
                <button type="button" class="btn btn-secondary ">답글</button>
            </div>
            <div class="reply pl-5">
                <span class="clamp"></span>
                <div class="reply-name">김길동</div>
                <div class="reply-name" style="color:red;">@홍길동</div>
                <div class="reply-content">re:반갑습니다2</div>
                <div>2020.01.03 13:22</div>
                <button type="button" class="btn btn-secondary ">삭제</button>
            </div>
            <div class="reply  mb-5">
                <div class="reply-name">김길동</div>
                <div class="reply-content">반갑습니다2</div>
                <div class="reply-date">2020.01.03 13:22</div>
                <button type="button" class="btn btn-secondary ">답글</button>
            </div>
            <div class="reply-form p-3">
                <div class="reply-name">홍동우</div>
                <textarea class="mt-2" rows="4"  style="font-size:0.9em;width:100%;border:1px solid #e1e1e1;" placeholder="주제와 무관한 댓글, 악플은 삭제 될 수 있습니다."></textarea>
                <div><button type="button" class="btn btn-secondary">등록</button></div>
            </div>
        </div>
 </div>

    <!-- 헤더파일들 include -->
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>