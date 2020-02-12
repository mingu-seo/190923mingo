<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid fixed-top bg-dark" style="opacity: 1;">
        <div class="container">
            <nav class="navbar navbar-expand-md navbar-dark">
                <a class="navbar-brand" href="goMain.do"><i class="fa fa-coffee"
                        style="font-size:1.5em;font-weight:bold;">&nbsp;Mingo</i></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="searchCafe.do">카페</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="listBoard.do?type=1">게시판</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="rankCafe.do">랭킹/통계</a>  
                        </li>


                    </ul>
                    <ul class="navbar-nav ml-auto">
                    <c:choose>
						<c:when test="${sessionScope.userVO != null && sessionScope.admin == null}">
	                    	<li class="nav-item" style="color:white">
								<a class="nav-link">${sessionScope.userVO.nickname} 님</a>  
							</li>
	                        <li class="nav-item">
	                            <a class="nav-link" href="myMain.do">MY</a>
	                        </li> 
	                    	<li class="nav-item">
	                            <a class="nav-link" href="/logout.do">로그아웃</a>
	                        </li>
						</c:when>
						<c:when test="${sessionScope.userVO == null && sessionScope.admin != null}">
	                    	<li class="nav-item" style="color:white">
								<a class="nav-link"><i class="fa fa-cogs"></i>관리자 </a>
							</li>
	                    	<li class="nav-item">
	                            <a class="nav-link" href="/logout.do">로그아웃</a>
	                        </li>
						</c:when>
						<c:otherwise>
						
						<li class="nav-item">
	                            <a class="nav-link" href="join_step1.do">회원가입</a>
	                        </li>
	                        <li class="nav-item">
	                            <a class="nav-link" href="loginForm.do">로그인</a>
	                        </li>
	                        
							
						
						</c:otherwise>
					</c:choose>
                    </ul>
                </div>
            </nav>
        </div>
    </div>