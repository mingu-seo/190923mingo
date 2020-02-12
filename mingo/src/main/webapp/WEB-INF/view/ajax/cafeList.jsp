<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="cafe" items="${cafeList }">
	<div class="grid-item">
		<div class="cafe cafe-img">
			<a href="detailView.do?cafe_id=${cafe.cafe_id }">
			<c:if test="${cafe.url != null}">
   			<a href="detailView.do?cafe_id=${cafe.cafe_id }"><img src='<%=request.getContextPath() %>/upload/cafe/${cafe.url}'></a>
   		</c:if>
      <c:if test="${cafe.url == null}">
  			<a href="detailView.do?cafe_id=${cafe.cafe_id }"><img src='https://placehold.it/200x200'></a>
      </c:if>
		</div>
		<div class="cafe cafe-name ml-1 mt-2 mb-2" style="font-size: 0.9em;">
			<a href="detailView.do?cafe_id=${cafe.cafe_id }">${cafe.name } ${cafe.branch }</a>
		</div>
		<div class="cafe cafe-address mb-1">${cafe.cafe_address }</div>
		<div class="cafe cafe-score float-left">평점 ${cafe.rate_avg }</div>
		<div class="cafe star-rating float-left mt-1 ml-2">
			<div style="width:${cafe.rate_avg * 20}%"></div>
		</div>
		<div style="overflow: hidden; clear: both;">
			<div class="cafe" style="float: left; clear: left;">리뷰
				(${cafe.review_num } 개)</div>
			<div class="cafe cafe-like float-right">
				<i class="fa fa-heart text-danger" style="font-size: 1em;"></i>&nbsp;${cafe.cafe_like}개
			</div>
		</div>
	</div>
</c:forEach>