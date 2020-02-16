<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>유저관리 페이지</title>

<!-- 헤더파일들 include -->
<%@ include file="/WEB-INF/view/include/headHTML.jsp"%>


<!-- 내가 만든 파일-->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/boardStyle.css">

<style>
.nav-pills .my-link.active, .nav-pills .show>.my-link {
	color: #fff;
	background-color: #6c757d;
	border-radius: 20px;
}

.my-link:focus, .my-link:hover {
	text-decoration: none;
	color: black;
	background-color: #f1f1f1;
	border-radius: 20px;
}

td{
	font-size:0.9em;
}
</style>

</head>
<script>
	function deleteUser(id){
		var chk =  confirm("삭제하시겠습니까?");
		if (chk){
					location.href="deleteUserAdmin.do?user_id="+id;  
		}else{event.preventDefault();}
	}
</script>
<body>
	<!-- 내비게이션 include -->
	<%@ include file="/WEB-INF/view/include/navigation.jsp"%>

	<div class="board-wrapper">
		<div class="list-group list-group-flush board-side shadow">
			<div class="board-side-name">
				<i class="fa fa-cog ml-2 " style="font-size: 2em;">&nbsp;&nbsp;회원관리</i>
			</div>
			<a href="mngUserMain.do?page=1" class="list-group-item mt-2" style="border-top: none; font-weight:bold;">일반
				회원 목록</a> <a href="getOwnerList.do?page=1" class="list-group-item">사장님 회원 목록</a>
		</div>
		
		<%--  
			pageInfo : page, startPage, endPage, maxPage, listCount
			userList : user_id, email,password,nickname,name,birthday,gender,type,phone_num,profile_image,address
		--%>
 		
		<div class=" board-group shadow ml-4">
			<div class="mb-4" style="font-size: 2em;">일반 회원 목록</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Id</th>
						<th>Profile_image</th>
						<th>Email</th>
						<th>Nickname</th>
						<th>Name</th>
						<th>Birthday</th>
						<th>Gender</th>
						<th>설정</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty userList}" >
					<tr>
						<td colspan="8">데이터가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty userList}" >
					<c:forEach var="user" items="${userList}">
					<tr>
						<td>${user.user_id }</td>
						<td>
							<c:if test="${user.profile_image == null }" >
								<img class="rounded-circle"   src="<%=request.getContextPath()%>/upload/user/profile.png" style="width:80px; height:80px;"/>
							</c:if>
							<c:if test="${user.profile_image != null }" >
								<img class="rounded-circle" src="<%=request.getContextPath()%>/upload/user/${user.profile_image}" style="width:80px; height:80px;"/>
							</c:if>
						</td>
						<td>${user.email }</td>
						<td>${user.nickname }</td>
						<td>${user.name }</td>
						<td>${user.birthday }</td>
						<td>
							<c:if test="${user.gender == 1 }">
								여자
							</c:if>
							<c:if test="${user.gender == 2 }">
								남자
							</c:if>
						</td>
						<td>
							<button type="button" class="btn btn-secondary" onclick="deleteUser(${user.user_id});">삭제</button>
						</td>
					</c:forEach>
				</c:if>
				
					
				</tbody>
			</table>
			
			<c:if test="${empty userList }" >
				<ul class="pagination mypagi justify-content-center">
				  <li class="page-item disabled"><a class="page-link" href="#">&#10094;</a></li>
				  <li class="page-item active"><a class="page-link" href="#">1</a></li>
				  <li class="page-item disabled"><a class="page-link" href="#">&#10095;</a></li> 
				</ul>		 
			</c:if>
			<c:if test="${not empty userList }" >
				<ul class="pagination mypagi justify-content-center">
					<c:if test="${ pageInfo.page > 1 }">
						<li class="page-item"><a class="page-link" href="mngUserMain.do?page=${pageInfo.page-1}">&#10094;</a></li>
					</c:if>
					<c:if test="${ pageInfo.page <= 1 }">
						<li class="page-item disabled"><a class="page-link">&#10094;</a></li>
					</c:if>
				  
				<c:forEach  var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					<c:if test="${pageInfo.page == i  }">
						<li class="page-item active"><a class="page-link" href="#">${i }</a></li>
					</c:if>
				  <c:if test="${pageInfo.page != i  }">
						<li class="page-item"><a class="page-link" href="mngUserMain.do?page=${i }">${i }</a></li>
					</c:if>
				</c:forEach>
				
					<c:if test="${pageInfo.page >= pageInfo.maxPage }">
						<li class="page-item disabled"><a class="page-link">&#10095;</a></li>
					</c:if>
				  <c:if test="${pageInfo.page < pageInfo.maxPage }">
						<li class="page-item"><a class="page-link" href="mngUserMain.do?page=${pageInfo.page+1}">&#10095;</a></li>
					</c:if> 
				</ul>
			</c:if>
			<form action="mngUserMain.do?">
				<input type="hidden" name="page" value="1"> 
				<div class="input-group justify-content-center">
					<div class="input-group-prepend">
							<select class="form-control filter" name="af">
								<option value="0">이름</option>
								<option value="1">닉네임</option>
							</select> 
							<input type="text" class="form-control mr-2" style="width: 188px" name="ak">
							<button type="button" class="form-control" style="width: 80px;">검색</button>
					</div>
	
				</div>
			</form>
		</div>
	</div>
	<!-- 푸터 include -->
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>