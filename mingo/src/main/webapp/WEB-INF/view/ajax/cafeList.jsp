<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Random"%>
<% 
long seed = System.currentTimeMillis();
Random rand = new Random(seed);
%>
<c:forEach var="cafe" items="${cafeList }">
	<div class="grid-item">
		<div class="cafe cafe-img">
			<c:if test="${cafe.cafe_img != null}">
   			<a href="detailView.do?cafe_id=${cafe.cafe_id }"><img src='<%=request.getContextPath() %>/upload/cafe/${cafe.cafe_img}'></a>
   		</c:if>
      <c:if test="${cafe.cafe_img == null}">
  			<a href="detailView.do?cafe_id=${cafe.cafe_id }"><img src='<%=request.getContextPath() %>/img/default/cafe_d<%=rand.nextInt(3) %>.jpg'></a>
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