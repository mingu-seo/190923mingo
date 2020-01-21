<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="cafe" items="${cafeList }">
	<div class="grid-item">
		<div class="cafe cafe-img">
			<a href="#"><img
				src='<%=request.getContextPath() %>/img/cafe.jpg' alt=""></a>
		</div>
		<div class="cafe cafe-name ml-1 mt-2 mb-2" style="font-size: 0.9em;">
			<a href="#">${cafe.name } ${cafe.branch }</a>
		</div>
		<div class="cafe cafe-address mb-1">${cafe.cafe_address }</div>
		<div class="cafe cafe-score float-left">평점 3.9</div>
		<div class="cafe star-rating float-left mt-1 ml-2">
			<div></div>
		</div>
		<div class="cafe cafe-like float-right" style="font-size: 1em">
			<i class="fa fa-heart text-danger" style="font-size: 1em;"></i>&nbsp;133개
		</div>
	</div>
</c:forEach>