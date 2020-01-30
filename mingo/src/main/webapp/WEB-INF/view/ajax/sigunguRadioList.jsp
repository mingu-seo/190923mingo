<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty sigunguList }">
<li class="list-group-item">
						<div class="custom-control custom-radio">
							<input checked="checked" type="radio" class="custom-control-input" id="sigungu0"
								name="sigungu_code" value="${sigungu.code }"> <label
								class="custom-control-label" for="sigungu0">전체</label>
						</div>

					</li>
</c:if>
<c:forEach var="sigungu" items="${sigunguList }" varStatus="i">
	<li class="list-group-item">
						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input" id="sigungu${i.count }"
								name="sigungu_code" value="${sigungu.code }"> <label
								class="custom-control-label" for="sigungu${i.count }">${sigungu.name }</label>
						</div>

					</li>
</c:forEach>