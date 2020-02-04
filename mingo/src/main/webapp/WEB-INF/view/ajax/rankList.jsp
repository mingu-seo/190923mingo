<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<% String src1="https://picsum.photos/80/80"; %>
<% String src2="https://placehold.it/80x80"; %>
<c:forEach var="rank" items="${rankList }" varStatus="i">
	<a href="detailView.do?cafe_id=${rank.cafe_id }" class="list-group-item p-1 grid-item w-100" >
		<div class="rank-num rounded-lg">${i.count }</div>  
		<div class="rank-img rounded-circle">
			<img src="./img/brandLogo/${rank.logo }" style="width: 80px;height:80px">
		</div>
		<div class="rank-info">
			<div class="rank-name">${rank.name } ${rank.branch }</div>
			
			<div class="float-right" style="width:83px;">
			<div class="float-right ml-3"
				style="font-size: 0.8em; margin-top: 3px;">(${rank.review_num }개)</div>
			<div class="rank-score">${rank.rate_avg }</div>  
			</div>
			<br>
			<div class="rank-address">${rank.cafe_address }</div>
			<div class="star-rating float-right">
				<div style="width:${rank.rate_avg * 20}%"></div>
			</div>
			<div class="float-right" style="clear:both;">
				<i class="fa fa-heart text-danger" style="font-size: 1em;"></i>&nbsp;${rank.cafe_like}개
			</div>
		</div>
	</a>
</c:forEach>
