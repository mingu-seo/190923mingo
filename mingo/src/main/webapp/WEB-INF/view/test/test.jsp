<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 

	 이 파일은 홍동우가 만든
	 jsp 출력 확인용 테스트 파일입니다.
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>cafe_id</th>
		<th>name</th>
		<th>branch</th>
		<th>sido_code</th>
		<th>sido_name</th>
		<th>sigungu_code</th>
		<th>sigungu_name</th>
		<th>dong_code</th>
		<th>dong_name</th>
		<th>cafe_address</th>
		<th>longitude</th>
		<th>latitude</th>
		<th>manager_id</th>
		<th>tel</th>
	</tr>
	<c:forEach var="cafe" items="${cafeList }">
	<tr>
		<td>${cafe.cafe_id }</td>
		<td>${cafe.name}</td>
		<td>${cafe.branch}</td>
		<td>${cafe.sido_code}</td>
		<td>${cafe.sido_name}</td>
		<td>${cafe.sigungu_code}</td>
		<td>${cafe.sigungu_name}</td>
		<td>${cafe.dong_code}</td>
		<td>${cafe.dong_name}</td>
		<td>${cafe.cafe_address}</td>
		<td>${cafe.longitude}</td>
		<td>${cafe.latitude}</td>
		<td>${cafe.manager_id}</td>
		<td>${cafe.tel}</td>
	</tr>
</c:forEach>
</table>

</body>
</html>