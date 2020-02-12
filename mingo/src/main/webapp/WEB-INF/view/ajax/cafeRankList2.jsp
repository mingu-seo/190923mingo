<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.PageInfo"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--  리스트가 비어있을 경우 -->
<c:if test="${empty items }">
		<h5> 검색결과 0 건</h5>
		<table class="table table-bordered table-hover table-strip" style="width:100%;">
			<thead class="thead-light">
				<tr>
					<th>식별 번호</th>
					<th>로고</th>
					<th>상호명</th>
					<th>지점명</th>
					<th>주소</th>
					<th>설정</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="6">검색 결과가 없습니다.</td>
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
	<table class="table table-bordered table-hover table-strip" style="width:100%;">
		<thead  class="thead-light">
			<tr>
				<th style="width:100px;">식별 번호</th>
				<th>로고</th>
				<th>상호명</th>
				<th>지점명</th>
				<th>주소</th>
				<th>설정</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${items}" varStatus="i">
				<tr>
						<td>${ item.cafe_id } </td>
						<td><img  class="rounded-circle bg-white" src="./img/brandLogo/${item.logo }" style="width: 80px;height:80px"></td>
						<td>
							<div>${item.name }</div>
						</td>
						<td>${item.branch }</td>
						<td>${ item.cafe_address}</td>
						<td>
							  <button type="button" class="btn btn-secondary mb-2" onclick="location.href='detailView.do?cafe_id=${item.cafe_id }'">상세보기</button>
							  <button type="button" class="btn btn-secondary" onclick="deleteCafe(${item.cafe_id})">초기화</button>
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


