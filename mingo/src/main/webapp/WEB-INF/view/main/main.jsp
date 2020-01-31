<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>

<!-- 헤더파일들 include -->
<%@ include file="/WEB-INF/view/include/headHTML.jsp"%>

<!-- masonry -->
<script
	src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>

<!-- imagesloaded-->
<script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.js"></script>

<!-- 내가 만든 파일-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/mainStyle.css">
<script src="<%=request.getContextPath()%>/js/scriptForMain.js"></script>
<style>
.nav-pills .my-link.active, .nav-pills .show>.my-link {
	color: #fff;
	background-color: #6c757d;
	border-radius: 20px;
}

.my-link:focus, .my-link:hover {
	text-decoration: none;
	color: black;
	background-color: #f1f1f1;
	border-radius: 20px;
}
</style>
</head>

<body>
	<!-- 내비게이션 include -->
	<%@ include file="/WEB-INF/view/include/navigation.jsp"%>

	<header class="jumbotron jumbotron-fluid text-center bg-cover m-0">
		<div class="container search-area">
			<form class="form pl-4 pr-4" action="searchCafe.do" method="post"
				onsubmit="return pushLast();">
				<div class="form-row">
					<div class="col-sm-10">
						<div class="form-row">
							<div class="col-4 pb-1 pt-1">
								<select class="form-control rounded-edge" name="sido_code"
									id="sido_code">
									<option value="-1">시/도</option>
									<option value="11">서울</option>
									<option value="26">부산</option>
									<option value="27">대구</option>
									<option value="28">인천</option>
									<option value="29">광주</option>
									<option value="30">대전</option>
									<option value="31">울산</option>
									<option value="36">세종</option>
									<option value="41">경기</option>
									<option value="42">강원</option>
									<option value="43">충북</option>
									<option value="44">충남</option>
									<option value="45">전북</option>
									<option value="46">전남</option>
									<option value="47">경북</option>
									<option value="48">경남</option>
									<option value="50">제주</option>
								</select>
							</div>
							<div class="col-4 pb-1 pt-1" id="">
								<select class="form-control rounded-edge" name="sigungu_code"
									id="sigungu_code">
									<option value="-1" class="start1">시/군/구</option>
								</select>
							</div>
							<div class="col-4 pb-1 pt-1">
								<select class="form-control rounded-edge" name="dong_code"
									id="dong_code">
									<option value="-1" class="start2">행정동</option>
								</select>
							</div>


						</div>
						<div class="form-row">
							<div class="col-12 pb-1 pt-1">
								<input type="text" name="name" class="form-control rounded-edge">
							</div>
						</div>
					</div>
					<div class="col-sm-2 pb-1 pt-1">
						<input type="submit" value="검색" class="form-control rounded-edge"
							style="height: 100%;">
					</div>
				</div>
			</form>
		</div>

	</header>

	<div class="container-fluid bg-light">
		<div class="container bg-light">
		
			<div class="row">
				<div class="col-lg-7 mb-1 bg-light mt-4">
					<div class="container rank-header shadow-sm">
						<h1 class="mt-2">
							종합순위 <a href="rankCafe.do"  data-toggle="tooltip" title="더보기" data-placement="left" class="fa fa-plus-square-o detail-icon"
								style="font-size: 1.3em; float: right;"></a>
						</h1>

					</div>
					<div class="container rank-filter pt-1 pb-1 shadow-sm">
						<ul class="nav nav-pills">
							<li class="nav-item"><a class="nav-link my-link active"
								data-toggle="pill" href="javascript:void(0);"
								onclick="listByFilter2(1,this);">평점 순</a></li>
							<li class="nav-item"><a class="nav-link my-link"
								data-toggle="pill" href="javascript:void(0);"
								onclick="listByFilter2(2,this);">리뷰 순</a></li>
							<li class="nav-item"><a class="nav-link my-link"
								data-toggle="pill" href="javascript:void(0);"
								onclick="listByFilter2(3,this);">좋아요 순</a></li>
						</ul>
					</div>
					<div
						class="list-group list-group-flush rank-contents shadow-sm grid">
						<!--  여기에 랭크 카페 Ajax로 리스트가 들어감 -->
						<!-- 기본 스피너 출력 -->
						<div class="list-group-item p-1 grid-item w-100 d-flex justify-content-center align-items-center" style="height:444px;background-color:#f8f9fa;">
							<div class="spinner-border text-primary"></div>
						</div>
						

					</div>

				</div>
				
				<div class="col-lg-5 mb-1 mt-4 latest-review shadow-sm slideshow-container">
					<c:forEach var="review" items="${reviewList }">
						<div class="mySlides myFade">
							<div class="review-header pl-3 pr-3 pb-3 pt-0 clearfix">
							 <c:if test="${ empty review.profile_image }">
							 	<img src="./img/default/profile.png" class="rounded-circle float-left mt-3">
							 </c:if>
							 <c:if test="${not empty review.profile_image }" >
								<img src="./upload/user/${review.profile_image }" class="rounded-circle float-left mt-3">
								</c:if>
								<div style="height: 80px;" class="ml-3 mt-3 float-left">
									
									<!-- 날짜 계산 시작-->
									<c:set value="${review.regdate }" var="dateString"/>
									<fmt:parseDate value="${dateString }" var="dateObject" pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:parseNumber value="${dateObject.time / (1000*60*60*24) }" integerOnly="true" var="past_D"/>
									<fmt:parseNumber value="${dateObject.time / (1000*60*60) }"  var="past_H"/>
									<fmt:parseNumber value="${dateObject.time / (1000*60) }"   var="past_M"/>
									
									<c:set value="<%= new Date() %>" var="nowDate"/>
									<fmt:parseNumber value="${nowDate.time / (1000*60*60*24)}" integerOnly="true" var="now_D" />
									<fmt:parseNumber value="${nowDate.time / (1000*60*60)}"  var="now_H" />
									<fmt:parseNumber value="${nowDate.time / (1000*60)}"   var="now_M" />
									
									<fmt:parseNumber value="${now_D - past_D }" var="sub_D" integerOnly="true"/>  
									<fmt:parseNumber value="${now_H - past_H }" var="sub_H" integerOnly="true"/>  
									<fmt:parseNumber value="${now_M - past_M }" var="sub_M" integerOnly="true"/>  
									<!--  날짜 계산 끝 -->
									<a href="detailView.do?cafe_id=${review.cafe_id }" style="display:block;">
										<div id="review-header-cname">${review.name  }&nbsp;${review.branch }</div>
										<div id="review-header-addr">${review.sido_name }&nbsp;${review.sigungu_name }&nbsp;${review.dong_name }</div>
									</a>
									<c:if test="${ sub_D >= 1  }">
										<div id="review-header-name">${ review.nickname }&nbsp;님&nbsp;&nbsp;&nbsp;&nbsp;${ sub_D }일 전</div>
									</c:if>
									<c:if test="${ sub_D < 1  }">
										<c:if test="${ sub_H >= 1 }">
											<div id="review-header-name">${ review.nickname }&nbsp;님&nbsp;&nbsp;&nbsp;&nbsp;${ sub_H }시간 전</div>
										</c:if>
										<c:if test="${ sub_H < 1 }">
											<div id="review-header-name">${ review.nickname }&nbsp;님&nbsp;&nbsp;&nbsp;&nbsp;${ sub_M }분 전</div>
										</c:if>
									</c:if>
									
								</div>
							</div>
							
							<div class="pt-3 pb-3" style="height: 380px; overflow-y:auto; overflow-x: hidden; border-bottom:1px solid #e1e1e1">
								<div class="pr-1">
									<c:if test="${ not empty review.image }">
										<img id="review-img" src="./upload/review/${review.image }" class="mb-3">
									</c:if>
								</div>
								<div class="review-content">${review.contents}</div>
							</div>
							<div class="review-footer clearfix">
								<div id="review-header-star"><i
								class="fa fa fa-star" style="color:#ffd700"
								></i></div>
								<div id="review-header-score" class="ml-2">${review.score_avg }</div>
									<div id="button-wrapper" class="float-right pt-2 pb-2">
										<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
	  								<a class="next" onclick="plusSlides(1)">&#10095;</a>	
	  							</div>
							</div>
						</div>
						</c:forEach>
					</div>
					
			</div>
			<div class="row">
				<div class="col-lg-7 mb-5 board-area">
					<div class="container bg-light board p-2 shadow-sm">
						<div class="container">
							<span style="font-size: 1.8em;">자유게시판</span> <a href="listBoard.do"
								class="fa fa-plus-square-o detail-icon" data-toggle="tooltip" title="더보기" data-placement="left"
								style="font-size: 3em; float: right;"></a>
						</div>
						<ul class="list-group list-group-flush board-ul w-100">
							<c:forEach var="board" items="${boardList }">
								<li class="list-group-item p-0"><a href="viewBoard.do?board_id=${board.board_id }">${board.title }</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="container bg-light board p-2 shadow-sm">
						<div class="container">
							<span style="font-size: 1.8em;">정보게시판</span> <a href="listBoard.do"
								class="fa fa-plus-square-o detail-icon" data-toggle="tooltip" title="더보기" data-placement="left"
								style="font-size: 3em; float: right;"></a>
						</div>
						<ul class="list-group list-group-flush board-ul w-100">
							<c:forEach var="board" items="${boardList2 }">
								<li class="list-group-item p-0"><a href="viewBoard.do?board_id=${board.board_id }">${board.title }</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>

				<div class="col-lg-5 mb-5 p-0 swiper-container bg-light">
					<!-- Additional required wrapper -->
					<div class="swiper-wrapper" style="margin-top: 10px;">
						<!-- Slides -->
						<div class="swiper-slide"
							style="background-image: url('/img/cafe.jpg');"></div>
						<div class="swiper-slide"
							style="background-image: url('/img/cafe2.jpg');"></div>
						<div class="swiper-slide"
							style="background-image: url('/img/cafe3.jpg');"></div>

					</div>
					<!-- If we need pagination -->
					<div class="swiper-pagination"></div>

					<!-- If we need navigation buttons -->
					<div class="swiper-button-prev"></div>
					<div class="swiper-button-next"></div>

					<!-- If we need scrollbar -->
					<div class="swiper-scrollbar"></div>
				</div>
			</div>
		</div>
	</div>


	<!-- 푸터 include -->
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>



</body>

</html>