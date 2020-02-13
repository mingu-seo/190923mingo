<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty dongList }">
<li class="list-group-item">
	<div class="custom-control custom-radio">
		<input checked="checked" type="radio" class="custom-control-input" id="dong0"
			name="dong_code" value="-1"> <label
			class="custom-control-label" for="dong0">전체</label>
	</div>
</li>
</c:if>
<c:forEach var="dong" items="${dongList }" varStatus="i">
	<li class="list-group-item">
						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input" id="dong${i.count }"
								name="dong_code" value="${dong.code }"> <label
								class="custom-control-label" for="dong${i.count }">${dong.name }</label>
						</div>

					</li>
</c:forEach>