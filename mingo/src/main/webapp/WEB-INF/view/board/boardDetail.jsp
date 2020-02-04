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
int listcount = (Integer)request.getAttribute("listcount");
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
	function reply(formId) {
		var chk =  confirm("등록하시겠습니까?");
		if (chk){
					$("#"+formId).submit();
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
	function replyShow(id){
		if ($('#replyCmt_'+id).is(":visible")) { 
	        $('#replyCmt_'+id).hide(); // id값을 받아서 숨기기 
	        
	    } else { 
	        $('#replyCmt_'+id).show(); // id값을 받아서 보이기 
	    } 
	}
	
	

	// 좋아요 버튼 처리
	// 버튼 클릭 > ajax통신 (like url로 전달) > views의 like 메소드에서 리턴하는 값 전달받기 > 성공시 콜백 호출
	$('.likeGood').click(function(){
	  var pk = $(this).attr('likeGood') // 클릭한 요소의 attribute 중 name의 값을 가져온다.
	  $.ajax({
		  url:'registLike.do',
			type:'POST',
			data:{'board_id':board_id},
			
	      success: function(response){
	        // 요청이 성공했을 경우 좋아요/싫어요 개수 레이블 업데이트
	        $('#like_count'+ pk).html("count : "+ response.like_count);
	        $('#dislike_count'+ pk).html("count : "+ response.dislike_count);
	      },
	      error:function(error){
	        // 요청이 실패했을 경우
	        alert(error)
	      }
	  });
	})
	
	// 싫어요 버튼 처리
// 버튼 클릭 > ajax통신 (dislike url로 전달) > views의 dislike 메소드에서 리턴하는 값 전달받기 > 성공시 콜백 호출
$('.dislike').click(function(){
  var pk = $(this).attr('name') // 클릭한 요소의 attribute 중 name의 값을 가져온다.
  $.ajax({
	  url:'deleteLike.do',
		type:'POST',
		data:{'board_id':board_id},

      success: function(response){
        // 요청이 성공했을 경우 좋아요/싫어요 개수 레이블 업데이트
        $('#like_count'+ pk).html("count : "+ response.like_count);
        $('#dislike_count'+ pk).html("count : "+ response.dislike_count);
      },
      error:function(error){
        // 요청이 실패했을 경우
        alert(error)
      }
  });
})
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
                <button type="button" class="btn float-right mybtn-good" name="likeGood" id="likeGood"><i class="fa fa-thumbs-o-down" style="font-size:1.5em;">2</i></button>
                <input type="hidden" id="likeBoard" value="0">
                <button type="button" class="btn float-right mybtn-bad" name="likeBad" id="likeBad"><i class="fa fa-thumbs-o-up" style="font-size:1.5em;">0</i></button>
               
            </div>
           
            </form>
	 	<div class="pb-3" style="border-bottom: 1px solid #a1a1a1;">
                <i class="fa fa-comment-o mr-2" style="font-size:1.5em;"></i>댓글 ${listCount }개
            </div>
            <c:forEach  items="${clist}" var="BoardCommentVO">
           <div class="reply pl-5" >
            
<%
//if(cvo.getLev() != 0){       
//	for (int i=0; i<clist.size(); i++) {
		
	//		for (int j=0; j<clist.get(i).getLev(); j++) { 
//	}
%>
	
<%// }%><% //}%>
								<c:if test="${BoardCommentVO.ref > 0 }">
											<span class="clamp">
										</span>  
								</c:if>
								
				<form id="form_${BoardCommentVO.board_comment_id }" action="replyProcess.do" method="post" name="replyProcess">
				<input type="hidden" name="page" value="<%=vo.getPage() %>"/>
				<input type="hidden" name="board_id" value="${BoardCommentVO.board_id}">
				<input type="hidden" name="board_comment_id" value="${BoardCommentVO.board_comment_id}">
				<input type="hidden" name="ref" value="${BoardCommentVO.ref}">
				<input type="hidden" name="lev" value="${BoardCommentVO.lev}">
				<input type="hidden" name="seq" value="${BoardCommentVO.seq}">
				
                <div class="reply-name"><%=vo.getNickname() %></div>
                <div class="reply-content">${BoardCommentVO.contents}</div>
                <!-- 날짜 계산 -->
                <fmt:parseDate value="${BoardCommentVO.regdate }" var="tmp" pattern="yyyy-MM-dd HH:mm:ss"/>
                <fmt:formatDate value="${tmp}" pattern="yyyy.MM.dd HH:mm" var="commentRegdate" />
                <!-- 날짜 계산 끝-->
                <div class="reply-date">${commentRegdate }</div>  
                
                <button  type="button" class="btn btn-secondary" onclick="replyShow('${BoardCommentVO.board_comment_id }')">댓글</button>
                <button type="button" class="btn btn-secondary" onclick="replyDelete(${BoardCommentVO.board_comment_id})">삭제</button>
                <div id="replyCmt_${BoardCommentVO.board_comment_id }" style="display:none"><textarea  class="mt-2" rows="4"  style="font-size:0.9em;width:100%;border:1px solid #e1e1e1;" name="contents" placeholder="주제와 무관한 댓글, 악플은 삭제 될 수 있습니다."></textarea>
                <button type="button" class="btn btn-secondary" onclick="javascript:reply('form_${BoardCommentVO.board_comment_id }')">등록</button></div>
            	</form>
            </div>
           
            
           </c:forEach>  
            
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
	<input type="hidden" name="ref" value="<%=cvo.getRef() %>">
	<input type="hidden" name="lev" value="<%=cvo.getLev() %>">
	<input type="hidden" name="seq" value="<%=cvo.getSeq() %>">
    <input type="hidden" name="board_comment_id" value="<%=cvo.getBoard_comment_id() %>">        
           
            
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