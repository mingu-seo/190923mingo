<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	
	
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
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/rankStyle.css">
	<script src="<%=request.getContextPath()%>/js/rankScript.js"></script>
</head>
<script>
	var sido_code=-1;
	var sigungu_code=-1;
	var brand_code=-1;
	var sort_code=1;
	
	var page;
	var startPage;
	var endPage;
	var maxPage;
</script>
<body>
	<!-- 내비게이션 include -->
	<%@ include file="/WEB-INF/view/include/navigation.jsp"%>
	
	<div class="r-wrapper1">
		<div class="r-filter">
			<div class="r-filter-header">
				<span class="r-filter-header-name">시/도</span> 
				<span class="r-filter-header-name">시/군/구</span> 
				<span class="r-filter-header-name">브랜드</span> 
				<span class="r-filter-header-name">성별</span> 
				<span class="r-filter-header-name">정렬 방식</span>
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
					<li class="list-group-item">
						<div class="custom-control custom-radio">
							<input checked="checked" type="radio" class="custom-control-input" id="gender0"
								name="gender" value="-1"> <label
								class="custom-control-label" for="gender0">전체</label>
						</div>

					</li>
					<li class="list-group-item">
						<div class="custom-control custom-radio">
							<input disabled="disabled" type="radio" class="custom-control-input" id="gender1"
								name="gender" value="1"> <label
								class="custom-control-label" for="gender1">남</label>
						</div>

					</li>
					<li class="list-group-item">
						<div class="custom-control custom-radio">
							<input disabled="disabled" type="radio" class="custom-control-input" id="gender2"
								name="gender" value="2"> <label
								class="custom-control-label" for="gender2">여</label>
						</div>

					</li>
				</ul>
				<ul class="list-group list-group-flush r-filter-e">
					<li class="list-group-item">
						<div class="custom-control custom-radio">
							<input checked="checked"  type="radio" class="custom-control-input" id="sort1"
								name="sort" value="1"> <label
								class="custom-control-label" for="sort1">평점 높은 순</label>
						</div>

					</li>
					<li class="list-group-item">
						<div class="custom-control custom-radio">
							<input  type="radio" class="custom-control-input" id="sort2"
								name="sort" value="2"> <label
								class="custom-control-label" for="sort2">평점 낮은 순</label>
						</div>

					</li>
					
					
					
				</ul>
			</div>
		</div>
	</div>
	<div class="r-content">
		
				
			
	</div>
	<div class="d-flex justify-content-center align-items-center spin-wrapper" >
		<div  class="spinner-border text-primary" id="test"></div>
	</div>

	<!-- 푸터 include -->
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>