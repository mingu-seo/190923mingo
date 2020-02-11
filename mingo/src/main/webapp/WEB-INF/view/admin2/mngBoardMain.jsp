<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>게시판 관리 페이지</title>

<!-- 헤더파일들 include -->
<%@ include file="/WEB-INF/view/include/headHTML.jsp"%>


<!-- 내가 만든 파일-->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/boardStyle.css">

<style>

td{
	font-size:0.9em;
}
</style>

</head>
<script>
	function deleteBoard(type){
		var chk =  confirm("삭제하시겠습니까?");
		if (chk){
					location.href="deleteBoardMeta.do?type="+type;
		}else{event.preventDefault();}
	}
	$(document).ready(function(){
		$('#addBtn').click(function(){
			var $trs = $('tbody > tr')
			if( $trs.length >=4){
					alert('게시판은 4개까지 만들 수 있습니다.');
			}else{
					$('#frm').submit();
			}
			
		});
		
		
	});
	
	
	
</script>
<body>
	<!-- 내비게이션 include -->
	<%@ include file="/WEB-INF/view/include/navigation.jsp"%>

	<div class="board-wrapper">
		<div class="list-group list-group-flush board-side shadow">
			<div class="board-side-name">
				<i class="fa fa-cog ml-2 " style="font-size: 1.8em;">&nbsp;&nbsp;게시판 관리</i>
			</div>
			<a href="mngBoardMain.do" class="list-group-item mt-2" style="border-top: none; font-weight:bold;">게시판 목록</a>
		</div>
		
		<%--  
			pageInfo : page, startPage, endPage, maxPage, listCount
			userList : user_id, email,password,nickname,name,birthday,gender,type,phone_num,profile_image,address
		--%>
 		
		<div class=" board-group shadow ml-4" id="here">
			<div class="mb-4" style="font-size: 2em;">게시판 목록
				<button type="button" class="float-right btn btn-secondary" data-toggle="modal" data-target="#myModal">
    			추가하기
  			</button>
  			<!-- The Modal -->
  			<form action="mngBoardMain.do" method="post" id="frm">  
			  <div class="modal fade" id="myModal">
			    <div class="modal-dialog">
			      <div class="modal-content">
			      
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h4 class="modal-title">게시판 추가</h4>
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        
			        <!-- Modal body -->
			        <div class="modal-body">
			          <input type="text" name="name" placeholder="게시판 이름을 입력하세요" class="form-control rounded-edge">
			        </div>
			        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-danger" data-dismiss="modal" id="addBtn">확인</button>
			        </div>
			        
			      </div>
			    </div>
			  </div>
			  </form>
			</div>
			
			<table class="table table-hover table-striped">
				<thead>
					<tr>
						<th>게시판 타입</th>
						<th>게시판 이름</th>
						<th>등록된 글 수</th>
						<th>등록된 공지글 수</th>
						<th>설정</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${list}">
						<tr>
							<td>${i.type }</td>
							<td>${i.name }</td>
							<td>${i.list_num }</td>
							<td>${i.notice_num }</td>
							<td>
								<button type="button" class="btn btn-secondary" onclick="deleteBoard(${i.type})">삭제</button>
							</td>
						</tr>
					</c:forEach>
					
				
				</tbody>
				
			</table>
			
		</div>
	</div>
	<!-- 푸터 include -->
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>