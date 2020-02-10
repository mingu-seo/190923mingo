<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.BoardVO"%>
<%@ page import="vo.UserVO"%>
<%@ page import="vo.BoardCommentVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<%
	int listcount = (Integer)request.getAttribute("listcount");
	List<BoardCommentVO> clist = (List<BoardCommentVO>)request.getAttribute("clist");
	BoardCommentVO cvo = (BoardCommentVO) request.getAttribute("cvo");
	
	BoardVO vo = (BoardVO) request.getAttribute("data");
	int nowPage = (Integer) request.getAttribute("page");
	int type = (Integer) request.getAttribute("type");
	
	int s1=0;
	if((Integer) request.getAttribute("s1") != null){
		s1 = (Integer) request.getAttribute("s1");
	}else{
		
	}
	int s2=0;
	if((Integer) request.getAttribute("s2") != null){
		s2 = (Integer) request.getAttribute("s2");
	}
	
	String k="";
	if((String)request.getAttribute("k") != null){
		k = (String)request.getAttribute("k");
	}
	
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
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/boardStyle.css">
</head>
<script type="text/javascript">
	function deleteboard(board_id) {
		var chk =  confirm("삭제하시겠습니까?");
		if (chk){
					location.href="deleteBoard.do?board_id="+board_id+"&page=${page}&type=${type}&s1=${s1}&s2=${s2}&k=${k}";  
		}else{event.preventDefault();}
	}
	function reply(formId) {
		var chk =  confirm("등록하시겠습니까?");
		if (chk){
					//컨텐츠 공백 체크
				
					if($("#"+formId).parent().find('textarea').val().trim() == ""){
						alert("내용을 입력해주세요.");
						$("#"+formId).parent().find('textarea').focus();
						return false;
					}
					$("#"+formId).submit();
					
		}else{event.preventDefault();}
	}
	
	//댓글 등록
	function writeComment123() {
		
		var chk =  confirm("등록하시겠습니까?");
		if (chk){
			//컨텐츠 공백 체크
			if($('#contents').val().trim() == ""){
				alert("내용을 입력해주세요.");
				$('#contents').focus();
				return false;
			}
			writeComment.submit();
		}else{event.preventDefault();}
	}
	
	
	function replyDelete(board_comment_id) {
		var chk =  confirm("삭제하시겠습니까?");
		if (chk){
			location.href='replyDeleteBoard.do?board_id=<%=vo.getBoard_id()%>&type=<%=type%>&page=<%=nowPage%>&s1=${s1}&s2=${s2}&k=${k}&board_comment_id='+board_comment_id;
		}else{event.preventDefault();}
	}
	function replyShow(id){
		if ($('#replyCmt_'+id).is(":visible")) { 
	        $('#replyCmt_'+id).hide(); // id값을 받아서 숨기기 
	        
	    } else { 
	        $('#replyCmt_'+id).show(); // id값을 받아서 보이기 
	    } 
	}
	function upLikeNum(){
		
		$.ajax({
			url: 'upLikeNum.do',
			data: { board_id : ${cvo.board_id},
							user_id : ${data.user_id},
							type : 1 },
			dataType : 'JSON',
		}).done(function(data){
			$('#likeGood > i').text(data.result);
			$('#like-num').text(data.result);
		});
	}
	function upBadNum(){
		$.ajax({
			url: 'upBadNum.do',
			data: { board_id : ${cvo.board_id},
							user_id : ${data.user_id},
							type : 2 },
			dataType : 'JSON',
		}).done(function(data){
			$('#likeBad > i').text(data.result);
		});
	}
	
	
	
$(document).ready(function(){
	
});
	

</script>
<body>
	<!-- 내비게이션 include -->
	<%@ include file="/WEB-INF/view/include/navigation.jsp"%>

	<div class="board-wrapper">
		<%@ include file="/WEB-INF/view/board/boardSideMenu.jsp"%>

		<div class=" board-group shadow ml-4">
			<form action="viewBoard.do" method="post" name="deleteform">

				<div class="mb-4 board-name">
					<c:if test="${data.type == 1 }">
	            	자유게시판
	            </c:if>
					<c:if test="${data.type == 2 }">
	            	정보게시판
	            </c:if>
					<c:if test="${data.type == 3 }">
	            	취업게시판
	            </c:if>
				</div>

				<div class="board-title p-2"><%=vo.getTitle()%></div>

				<div class="board-title-info  p-2" style="overflow: hidden;">

					<div class="float-left"><%=vo.getNickname()%></div>


					<div class="float-right">
						조회 수
						<%=vo.getReadcount()%>
						| 추천 수 <span id="like-num">${data.like_num }</span> |
						<fmt:formatDate value="${data.regdate}" pattern="yyyy.MM.dd HH:mm" />
						| <a
							href="editBoard.do?board_id=<%=vo.getBoard_id()%>&page=${page}&type=${type}&s1=<%=s1%>&s2=<%=s2%>&k=<%=k%>">수정</a>
						| <a href="javascript:void(0);"
							onclick="javascript: deleteboard(<%=vo.getBoard_id()%>)">삭제</a>
					</div>
				</div>
				<div class="p-3">
					<%=vo.getContents()%></div>

				<div class="mybtn-group">
					<button type="button" class="btn btn-secondary float-left"
						onclick="location.href='listBoard.do?type=<%=type %>&page=<%=nowPage%>&s1=<%=s1%>&s2=<%=s2%>&k=<%=k%>' ">목록보기</button>
					
					<button type="button" class="btn float-right mybtn-good"
						name="likeBad" id="likeBad" onclick="upBadNum();">
						<i class="fa fa-thumbs-o-down" style="font-size: 1.5em;">${dislikeNum }</i>
					</button>
					<button type="button" class="btn float-right mybtn-bad"
						name="likeGood" id="likeGood" onclick="upLikeNum();">
						<i class="fa fa-thumbs-o-up" style="font-size: 1.5em;">${likeNum  }</i> 
					</button>

				</div>

			</form>
			<div class="pb-3" style="border-bottom: 1px solid #a1a1a1;">
				<i class="fa fa-comment-o mr-2" style="font-size: 1.5em;"></i>댓글
				${listCount }개
			</div>

			<!-- 댓글목록 -->
			<c:forEach items="${clist}" var="BoardCommentVO">
				<div class="d-flex reply-wrapper">
				<!--  indentation 하기 -->
				<c:if test="${BoardCommentVO.lev > 0 }">
						<c:forEach begin="1" end="${BoardCommentVO.lev }" varStatus="i">
							<c:if test="${!i.last }">
								<div  style="width:40px;overflow:hidden;position:relative;"></div>
							</c:if>
							<c:if test="${i.last }">
								<div  style="width:40px;overflow:hidden;position:relative;"><span class="clamp"></span></div>
							</c:if>
						</c:forEach>
				</c:if>
				<div class="reply flex-grow-1">
					
					
					<form id="form_${BoardCommentVO.board_comment_id }"
						action="replyProcess.do" method="post" name="replyProcess">
						<input type="hidden" name="page" value="<%=vo.getPage() %>" /> 
						<input type="hidden" name="board_id" value="${BoardCommentVO.board_id}">
						<input type="hidden" name="board_comment_id" value="${BoardCommentVO.board_comment_id}"> 
						<input type="hidden" name="ref" value="${BoardCommentVO.ref}"> 
						<input type="hidden" name="lev" value="${BoardCommentVO.lev}"> 
						<input type="hidden" name="seq" value="${BoardCommentVO.seq}">
						<input type="hidden" name="type" value="${data.type }">
						<input type="hidden" name="s1" value="${s1 }">
						<input type="hidden" name="s2" value="${s2 }">
						<input type="hidden" name="k" value="${k }">
							
							<!-- 삭제 된 게시물이면 -->
							<c:if test="${BoardCommentVO.is_deleted == 1 }">
								<div class="reply-name">(삭제된 게시물)</div>
								<div class="reply-content">삭제된 게시물 입니다.</div>
		
								
							</c:if>
							<!-- 삭제 된 게시물이 아니면 -->
							<c:if test="${BoardCommentVO.is_deleted == 0 }">
								<div class="reply-name"><%=vo.getNickname() %></div>
								<div class="reply-content">${BoardCommentVO.contents}</div>
		
								<!-- 날짜 출력 -->
								<fmt:parseDate value="${BoardCommentVO.regdate }" var="tmp"
									pattern="yyyy-MM-dd HH:mm:ss" />
								<fmt:formatDate value="${tmp}" pattern="yyyy.MM.dd HH:mm"
									var="commentRegdate" />
								<div class="reply-date">${commentRegdate }</div>
								<!-- 날짜 출력 끝-->
							</c:if>
	
							<!-- 대댓글쓰기(삭제된 게시물이 아닐 경우에만 댓글 삭제 버튼이 있음) -->
							<c:if test="${BoardCommentVO.is_deleted == 0 }">
								<button type="button" class="btn btn-secondary"
									onclick="replyShow('${BoardCommentVO.board_comment_id }')">댓글</button>
								<button type="button" class="btn btn-secondary"
									onclick="replyDelete(${BoardCommentVO.board_comment_id})">삭제</button>
								<div id="replyCmt_${BoardCommentVO.board_comment_id }"
									style="display: none">
									<textarea class="mt-2" rows="4"
										style="font-size: 0.9em; width: 100%; border: 1px solid #e1e1e1;"
										name="contents" placeholder="주제와 무관한 댓글, 악플은 삭제 될 수 있습니다."></textarea>
									<button type="button" class="btn btn-secondary"
										onclick="javascript:reply('form_${BoardCommentVO.board_comment_id }')">등록</button>
								</div>
							</c:if>
					</form>
				</div>
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


			<!-- 댓글쓰기 -->
			<form action="writeComment.do" method="post" name="writeComment">
				<div class="reply-form p-3">
					<input type="hidden" name="page" value="<%=vo.getPage() %>" /> 
					<input type="hidden" name="type" value="<%=vo.getType() %>" /> 
					<input type="hidden" name="s1" value="${s1 }" /> 
					<input type="hidden" name="s2" value="${s2 }" /> 
					<input type="hidden" name="k" value="${k }" /> 
					<input type="hidden" name="board_id" value="<%=vo.getBoard_id() %>">
					<input type="hidden" name="ref" value="<%=cvo.getRef() %>">
					<input type="hidden" name="lev" value="<%=cvo.getLev() %>">
					<input type="hidden" name="seq" value="<%=cvo.getSeq() %>">
					<input type="hidden" name="board_comment_id"
						value="<%=cvo.getBoard_comment_id() %>">


					<div class="reply-name"><%=vo.getNickname() %></div>
					<textarea class="mt-2" rows="4"
						style="font-size: 0.9em; width: 100%; border: 1px solid #e1e1e1;"
						name="contents" id="contents" placeholder="주제와 무관한 댓글, 악플은 삭제 될 수 있습니다."></textarea>
					<div>
						<button type="button" class="btn btn-secondary"
							onclick="writeComment123()">등록</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- 헤더파일들 include -->
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>