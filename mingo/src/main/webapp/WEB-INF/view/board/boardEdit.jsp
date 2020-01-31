<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="vo.BoardVO"%>
<%
	BoardVO vo = (BoardVO) request.getAttribute("vo");
%>
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
<script type="text/javascript">
	function modifyboard() {
		if (confirm("수정하시겠습니까?")){
			modifyform.submit();	
		}
		
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
            <c:if test="${board.type == 1 }">
            	<a href="listBoard.do" class="list-group-item mt-2" style="border-top:none;">자유게시판</a>
            </c:if>
            <a href="#" class="list-group-item">정보게시판</a>
            <a href="#" class="list-group-item">취업게시판</a>

        </div>
        <form action="updateBoard.do" method="post" name="modifyform">
        <input type="hidden" name="board_id" value="<%=vo.getBoard_id()%>" /> 
		<input type="hidden" name="page" value="<%=request.getParameter("page")%>" />
        <div class=" board-group shadow ml-4">
            <div class="mb-4 board-name">
               자유게시판
               <span style="font-size: 0.5em;">수정하기</span>
            </div>
            
            <input type="text" class="form-control" name="title" value="<%=vo.getTitle()%>">
            <textarea class="mt-2 p-2" rows="20" name="contents" style="font-size:1em;width:100%;border:1px solid #e1e1e1;" ><%=vo.getContents()%></textarea>
            <div style="text-align: center;">
                <button type="button" class="btn btn-secondary"onclick="location.href='listBoard.do' ">취소</button>
                <button type="button" class="btn btn-secondary"onclick="javascript:modifyboard()">수정완료</button>
            </div>
        </div>
        </form>
    </div>

    <!-- 푸터 include -->
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>