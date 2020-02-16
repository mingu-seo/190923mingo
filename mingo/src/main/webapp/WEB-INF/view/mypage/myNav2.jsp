<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid nav-wrapper">
    <ul class="nav nav-pills mypage-nav" style="width:1140px;">
        <li class="nav-item">
          <a class="nav-link my-link" data-toggle="pill" href="javascript:void(0);" onclick="location.href='myMain.do?user_id=${userVO.user_id }'">회원정보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active my-link" data-toggle="pill" href="javascript:void(0);" onclick="location.href='myReview.do?user_id=${userVO.user_id }'">활동내역</a>
        </li>
        <c:if test="${sessionScope.userVO.type == 2 }">
	        <li class="nav-item">
	          <a class="nav-link my-link" data-toggle="pill" href="javascript:void(0);" onclick="location.href='myCafe.do?user_id=${userVO.user_id }'">내 카페</a>
	        </li>
        </c:if>
    </ul>
</div>