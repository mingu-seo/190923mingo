<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.PageInfo"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--  리스트가 비어있을 경우 -->
<c:if test="${empty items }">
		<h5> 검색결과 0 건</h5>
		<table class="table table-bordered table-hover table-strip" style="width:1140px;">
			<thead class="thead-light">
				<tr>
					<th style="width:43px;">#</th>
					<th style="width:105px;">로고</th>
					<th style="width:150px;">이름</th>
					<th style="width:200px;">주소</th>
					<th>평가</th>
					<th style="width:100px;">좋아요</th>
					<th style="width:100px;">리뷰수</th>
					<th style="width:100px;">평점</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="8">검색 결과가 없습니다.</td>
				</tr>
			</tbody>
		</table>
		<ul class="pagination justify-content-center">
			<li class="page-item disabled"><a class="page-link" href="#">&#10094;&#10094;</a></li>
		  <li class="page-item disabled"><a class="page-link" href="#">&#10094;</a></li>
		  <li class="page-item active"><a class="page-link" href="#">1</a></li>
		  <li class="page-item disabled"><a class="page-link" href="#">&#10095;</a></li> 
		  <li class="page-item disabled"><a class="page-link" href="#">&#10095;&#10095;</a></li>
		</ul>
</c:if>
<!--  리스트가 비어있지 않을 경우 -->
<c:if test="${ not empty items }">
	<h5> 검색결과 ${ pageInfo.listCount }&nbsp;건</h5>
	<table class="table table-bordered table-hover table-strip" style="width:1140px;">
		<thead  class="thead-light">
			<tr>
				<th style="width:43px;text-align:center;">#</th>
				<th style="width:105px;text-align:center;">로고</th>
				<th style="width:150px;text-align:center;">이름</th>
				<th style="width:200px;text-align:center;">주소</th>
				<th style="text-align:center;">평가</th>
				<th style="width:100px;text-align:center;">좋아요</th>
				<th style="width:100px;text-align:center;">리뷰수</th>
				<th style="width:100px;text-align:center;">평점</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${items}" varStatus="i">
				<tr>
						<td>${ i.count + startrow } </td>
						<td><img  class="rounded-circle bg-white" src="./img/brandLogo/${item.logo }" style="width: 80px;height:80px"></td>
						<td>
							<div>${item.name } ${item.branch }</div>
						</td>
						<td>${ item.cafe_address}</td>
						<td>
							<div class="d-flex">
								<div class="flex-fill m-1">
									<span>맛</span>
									<div class="progress" data-toggle="tooltip" title="${item.taste_avg}">
									  <div class="progress-bar progress-bar-striped progress-bar-animated" style="width:${ item.taste_avg * 20}%"></div>
									</div>
								</div>
								<div class="flex-fill m-1">
									<span>가격</span>
									<div class="progress" data-toggle="tooltip" title="${item.price_avg}">
									  <div class="progress-bar progress-bar-striped progress-bar-animated" style="width:${item.price_avg * 20}%"></div>
									</div>
								</div>
								
							</div>
							<div class="d-flex">
								<div class="flex-fill m-1">
									<span>서비스</span>
									<div class="progress" data-toggle="tooltip" title="${item.service_avg}">
									  <div class="progress-bar progress-bar-striped progress-bar-animated" style="width:${item.service_avg * 20}%"></div>
									</div>
								</div>
								<div class="flex-fill m-1">
									<span>분위기</span>
									<div class="progress" data-toggle="tooltip" title="${item.mood_avg}">
									  <div class="progress-bar progress-bar-striped progress-bar-animated" style="width:${item.mood_avg* 20}%"></div>
									</div>
								</div>
								
							</div>
							<div class="d-flex">
								<div class="flex-fill m-1">
									<span>와이파이</span>
									<div class="progress" data-toggle="tooltip" title="${item.wifi_avg}">
									  <div class="progress-bar progress-bar-striped progress-bar-animated" style="width:${item.wifi_avg* 20}%"></div>
									</div>
								</div>
								<div class="flex-fill m-1">
									<span>청결도</span>
									<div class="progress" data-toggle="tooltip" title="${item.clean_avg}">
									  <div class="progress-bar progress-bar-striped progress-bar-animated" style="width:${item.clean_avg* 20}%"></div>
									</div>
								</div>
								
							</div>
							
							
						</td>
						<td><i class="fa fa-heart text-danger"></i>&nbsp;&nbsp;${(item.cafe_like eq null ? 0:item.cafe_like) }개</td>
						<td><i class="fa fa-file-text-o"></i>&nbsp;&nbsp;${ (item.rate_num eq null ? 0:item.rate_num)}개</td>
						<td>
							<div>${(item.rate_avg eq null ? 0.0:item.rate_avg) }</div>  
							<div class="progress">
							  <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" style="width:${item.rate_avg * 20}%"></div>
							</div>
						</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<!-- PageInfo속성 :  page startPage endPage maxPage listCount -->
		<ul class="pagination justify-content-center">
			<c:if test="${ pageInfo.page > 1 }">
				<li class="page-item"><a class="page-link" href="javascript:listCafeRank(1)">&#10094;&#10094;</a></li>
				<li class="page-item"><a class="page-link" href="javascript:listCafeRank(${pageInfo.page -1 })">&#10094;</a></li>
			</c:if>
			<c:if test="${ pageInfo.page <= 1 }">
				<li class="page-item disabled"><a class="page-link">&#10094;&#10094;</a></li>
				<li class="page-item disabled"><a class="page-link">&#10094;</a></li>
			</c:if>
			  
			<c:forEach  var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				<c:if test="${pageInfo.page == i  }">
					<li class="page-item active"><a class="page-link" href="#">${i }</a></li>
				</c:if>
			  <c:if test="${pageInfo.page != i  }">
					<li class="page-item"><a class="page-link" href="javascript:listCafeRank(${i })">${i }</a></li>
				</c:if>
			</c:forEach>
				<c:if test="${pageInfo.page >= pageInfo.maxPage }">
					<li class="page-item disabled"><a class="page-link">&#10095;</a></li>
					<li class="page-item disabled"><a class="page-link">&#10095;&#10095;</a></li>
				</c:if>
			  <c:if test="${pageInfo.page < pageInfo.maxPage }">
					<li class="page-item"><a class="page-link" href="javascript:listCafeRank(${pageInfo.page + 1 })">&#10095;</a></li>
					<li class="page-item"><a class="page-link" href="javascript:listCafeRank(${pageInfo.maxPage })">&#10095;&#10095;</a></li>
				</c:if> 
		 
		</ul>
</c:if>


