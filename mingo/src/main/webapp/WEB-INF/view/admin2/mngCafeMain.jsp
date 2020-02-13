<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>카페 관리 페이지</title>

<!-- 헤더파일들 include -->
<%@ include file="/WEB-INF/view/include/headHTML.jsp"%>


<!-- 내가 만든 파일-->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/rankStyle2.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/rankScript2.js"></script>

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
<body>
	<!-- 내비게이션 include -->
	<%@ include file="/WEB-INF/view/include/navigation.jsp"%>

	<div class="board-wrapper" style="margin-bottom:0;">
		<div class="list-group list-group-flush board-side shadow">
			<div class="board-side-name">
				<i class="fa fa-cog ml-2 " style="font-size: 2em;">&nbsp;&nbsp;카페 관리</i>
			</div>
			<a href="mngCafeMain.do?page=1" class="list-group-item mt-2" style="border-top: none; font-weight:bold;">카페 목록</a> 
		</div>
		
		<%--  
			pageInfo : page, startPage, endPage, maxPage, listCount
			cafeList : logo, cafe_id, name, branch,address
		--%>
 		<div class="board-group shadow-sm mb-4" style="float:right;">
 			<div class="mb-2" style="font-size: 1.5em;">카페 검색 옵션</div>
	 			<div class="r-wrapper1">
					<div class="r-filter">
						<div class="r-filter-header">
							<span class="r-filter-header-name">시/도</span> 
							<span class="r-filter-header-name">시/군/구</span> 
							<span class="r-filter-header-name">행정동</span> 
							<span class="r-filter-header-name">브랜드</span> 
						</div>
						<div class="r-filter-option">
							<ul class="list-group list-group-flush r-filter-a">
								<li class="list-group-item">
										<div class="custom-control custom-radio">
											<input checked="checked" type="radio" class="custom-control-input" id="sido0"
												name="sido_code" value="-1"> <label
												class="custom-control-label" for="sido0">전체</label>
										</div>
				
								</li>
								<c:forEach var="sido" items="${sidoList}" varStatus="i">
								<li class="list-group-item">
									<div class="custom-control custom-radio">
										<input type="radio" class="custom-control-input" id="sido${i.count }"
											name="sido_code" value="${sido.code }"> <label
											class="custom-control-label" for="sido${i.count }">${sido.name }</label>
									</div>
			
								</li>
								</c:forEach>
								
							</ul>
							<ul class="list-group list-group-flush r-filter-b">
								
							</ul>
							<ul class="list-group list-group-flush r-filter-c">
								
							</ul>
							<ul class="list-group list-group-flush r-filter-d">
								
								
							</ul>
							
						</div>
					</div>
			</div>
			<div>
				<div class="input-group justify-content-center">
					<div class="input-group-prepend">
							<select class="form-control filter" name="af">
								<option value="0">상호명</option>
							</select> 
							<input type="text" class="form-control mr-2" style="width: 188px" name="ak">
							<button type="button" class="form-control" style="width: 80px;" onclick="listCafeRank(1);">검색</button>
					</div>
	
				</div>
			</div>
 		</div>
 		<!-- 필요시 사용 <div class="mb-2" style="font-size: 1.5em;">카페 목록</div>  -->
 		<div class="r-content">
		
				
			
		</div>
		<div class="d-flex justify-content-center align-items-center spin-wrapper" >
			<div  class="spinner-border text-primary" id="test"></div>
		</div>
		
	</div>
	<!-- 푸터 include -->
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>