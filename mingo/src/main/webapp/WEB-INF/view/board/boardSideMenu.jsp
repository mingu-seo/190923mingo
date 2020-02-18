<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="list-group list-group-flush board-side shadow">
            <div class="board-side-name">
                <i class="fa fa-file-text-o ml-2 " style="font-size:2em;">&nbsp;&nbsp;게시판</i>
            </div>
            
            <c:forEach items="${boardNames}" var="i" varStatus="status" >
            	<c:if test="${status.count == 1 }">
            		<a href="listBoard.do?type=${ i.type }" class="list-group-item mt-2" style="border-top:none;<c:if test="${vo.type == i.type}">font-weight:bold;</c:if>">${i.name }</a>
            	</c:if>
            	<c:if test="${status.count != 1 }">
            		<a href="listBoard.do?type=${ i.type }" class="list-group-item" style="<c:if test="${vo.type == i.type}">font-weight:bold;</c:if>">${i.name }</a>
            	</c:if>
            </c:forEach>
            

</div>