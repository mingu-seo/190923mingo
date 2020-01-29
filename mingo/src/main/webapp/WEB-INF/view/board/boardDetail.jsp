<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    <%@ page import="vo.BoardVO" %>
     <%@ page import="vo.UserVO" %>
     <%@ page import="vo.BoardCommentVO" %>
     <%@page import="java.util.List"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%
List<BoardCommentVO> clist = (List<BoardCommentVO>)request.getAttribute("clist");
	BoardCommentVO cvo = (BoardCommentVO) request.getAttribute("cvo");
	BoardVO vo = (BoardVO) request.getAttribute("data");
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
					location.href='deleteBoard.do?board_id='+board_id+'&page=<%=nowPage%>';
		}else{event.preventDefault();}
	}
	function reply(user_id) {
		var chk =  confirm("등록하시겠습니까?");
		if (chk){
					replyProcess.submit();
		}else{event.preventDefault();}
	}
	function writeComment123(user_id) {
		
		var chk =  confirm("등록하시겠습니까?");
		if (chk){
			writeComment.submit();
		}else{event.preventDefault();}
	}
	function replyDelete(board_comment_id) {
		var chk =  confirm("삭제하시겠습니까?");
		if (chk){
			location.href='replyDeleteBoard.do?board_id=<%=vo.getBoard_id()%>&page=<%=nowPage%>&board_comment_id='+board_comment_id;
		}else{event.preventDefault();}
	}
	function replyShow(){
		if ($('#replyCmt').is(":visible")) { 
	        $('#replyCmt').hide(); // id값을 받아서 숨기기 
	        
	    } else { 
	        $('#replyCmt').show(); // id값을 받아서 보이기 
	         
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
            <a href="listBoard.do" class="list-group-item mt-2" style="border-top:none;">자유게시판</a>
            <a href="#" class="list-group-item">정보게시판</a>
            <a href="#" class="list-group-item">취업게시판</a>
        </div>
			
		<div class=" board-group shadow ml-4" >
     	<form action="viewBoard.do" method="post" name="deleteform">
           
            <div class="mb-4 board-name">
               자유게시판
            </div>
           
            <div class="board-title p-2" ><%=vo.getTitle()%></div>
            
            <div class="board-title-info  p-2" style="overflow:hidden;">
                
                <div class="float-left" ><%=vo.getNickname()%></div>
                
                
                <div class="float-right">조회 수 <%=vo.getReadcount()%> | 추천 수  11 | <fmt:formatDate value="${data.regdate}" pattern="yyyy.MM.dd HH:mm"/> | 
                <a href="editBoard.do?board_id=<%=vo.getBoard_id()%>&page=<%=nowPage%>">수정</a> | 
                	<a href="listBoard.do?page=<%=nowPage%>"  onclick="javascript: deleteboard(<%=vo.getBoard_id()%>)">삭제</a></div>
            </div>
            <div class="p-3"> <%=vo.getContents()%></div>
            
            <div class="mybtn-group">
                <button type="button" class="btn btn-secondary float-left"onclick="location.href='listBoard.do?page=<%=nowPage%>' ">목록보기</button>
                <button type="button" class="btn float-right mybtn-good"><i class="fa fa-thumbs-o-down" style="font-size:1.5em;">1</i></button>
                <button type="button" class="btn float-right mybtn-bad"><i class="fa fa-thumbs-o-up" style="font-size:1.5em;">0</i></button>
                
            </div>
           
            </form>
	 	<div class="pb-3" style="border-bottom: 1px solid #a1a1a1;">
                <i class="fa fa-comment-o mr-2" style="font-size:1.5em;"></i>댓글 ${listCount }개
            </div>
            <form action="replyProcess.do" method="post" name="replyProcess">
            <c:forEach  items="${clist}" var="BoardCommentVO">
	<input type="hidden" name="page" value="<%=vo.getPage() %>"/>
	<input type="hidden" name="board_id" value="<%=vo.getBoard_id() %>">
	<input type="hidden" name="board_re_ref" value="${BoardCommentVO.ref}">
	<input type="hidden" name="board_re_lev" value="${BoardCommentVO.lev}">
	<input type="hidden" name="board_re_seq" value="${BoardCommentVO.seq}">
            
            
           <div class="reply">
                <div class="reply-name"><%=vo.getNickname() %></div>
                <div class="reply-content">${BoardCommentVO.contents}</div>
                <!-- 날짜 계산 -->
                <fmt:parseDate value="${BoardCommentVO.regdate }" var="tmp" pattern="yyyy-MM-dd HH:mm:ss"/>
                <fmt:formatDate value="${tmp}" pattern="yyyy.MM.dd HH:mm" var="commentRegdate" />
                <!-- 날짜 계산 끝-->
                <div class="reply-date">${commentRegdate }</div>  
                
                <button id="replyBtn" type="button" class="btn btn-secondary" onclick="replyShow()">답글</button>
                <button type="button" class="btn btn-secondary" onclick="replyDelete(${BoardCommentVO.board_comment_id})">삭제</button>
                <div id="replyCmt" style="display:none"><textarea  class="mt-2" rows="4"  style="font-size:0.9em;width:100%;border:1px solid #e1e1e1;" name="contents" placeholder="주제와 무관한 댓글, 악플은 삭제 될 수 있습니다."></textarea>
                <button type="button" class="btn btn-secondary" onclick="javascript:reply(<%=vo.getUser_id()%>)">등록</button></div>
            </div>
            </c:forEach>
            </form>
             
            
           <!--  <div class="reply pl-5">
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
             -->
             
            <form action="writeComment.do" method="post" name="writeComment">
            <div class="reply-form p-3" >
    <input type="hidden" name="page" value="<%=vo.getPage() %>"/>
	<input type="hidden" name="board_id" value="<%=vo.getBoard_id() %>">
	<input type="hidden" name="board_re_ref" value="<%=cvo.getRef() %>">
	<input type="hidden" name="board_re_lev" value="<%=cvo.getLev() %>">
	<input type="hidden" name="board_re_seq" value="<%=cvo.getSeq() %>">
            
                <div class="reply-name"><%=vo.getNickname()%></div>
                <textarea class="mt-2" rows="4"  style="font-size:0.9em;width:100%;border:1px solid #e1e1e1;" name="contents" placeholder="주제와 무관한 댓글, 악플은 삭제 될 수 있습니다."></textarea>
                <div><button type="button" class="btn btn-secondary" onclick="writeComment123(<%=vo.getUser_id()%>)">등록</button></div>
			</div>
        </form>
   </div>
</div>

    <!-- 헤더파일들 include -->
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>