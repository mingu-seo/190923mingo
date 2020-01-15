<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
	
	<!-- 헤더파일들 include -->
	<%@ include file="/WEB-INF/view/include/headHTML.jsp"%>
	
	
	<!-- 내가 만든 파일-->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
	<script src="<%=request.getContextPath() %>/js/scriptForMain.js"></script>
</head>

<body>
	<!-- 내비게이션 include -->
	<%@ include file="/WEB-INF/view/include/navigation.jsp"%>
	
	<header class="jumbotron jumbotron-fluid text-center bg-cover m-0">
		<div class="container search-area">
			<form class="form pl-4 pr-4">
				<div class="form-row">
					<div class="col-sm-10">
						<div class="form-row">
							<div class="col-4 pb-1 pt-1">
								<select class="form-control rounded-edge">
									<option>서울시</option>
									<option>경기도</option>
									<option>경기도</option>
									<option>경기도</option>
									<option>경기도</option>
									<option>경기도</option>
									<option>경기도</option>
									<option>경기도</option>
									<option>경기도</option>
									<option>경기도</option>
									<option>인천</option>
								</select>
							</div>
							<div class="col-4 pb-1 pt-1">
								<select class="form-control rounded-edge">
									<option>광진구</option>
									<option>금천구</option>
								</select>
							</div>
							<div class="col-4 pb-1 pt-1">
								<select class="form-control rounded-edge">
									<option>자양4동</option>
									<option>노유동</option>
								</select>
							</div>


						</div>
						<div class="form-row">
							<div class="col-12 pb-1 pt-1">
								<input type="text" class="form-control rounded-edge">
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
				<div class="col-lg-7 mb-5 bg-light mt-4 ">
					<div class="container rank-header shadow-sm">
						<h1 class="mt-2">종합순위</h1>

					</div>
					<div class="container rank-filter pt-1 pb-1 shadow-sm">
						<button type="button" class="btn btn-secondary">별점순</button>
						<button type="button" class="btn btn-secondary">리뷰순</button>
						<button type="button" class="btn btn-secondary">브랜드순</button>
					</div>
					<div class="list-group list-group-flush rank-contents shadow-sm">

						<a href="#" class="list-group-item p-1">
							<div class="rank-num rounded-lg">1</div>
							<div class="rank-img rounded-circle">
								<img src="http://placehold.it/80x80">
							</div>
							<div class="rank-info">
								<div class="rank-name">밍고카페</div>
								<div class="float-right ml-3"
									style="font-size: 0.8em; margin-top: 3px;">(133개)</div>
								<div class="rank-score">8.3</div>
								<br>
								<div class="rank-address">서울시 광진구 자양3동</div>
								<div class="rank-star">★★★★☆</div>
							</div>
						</a> <a href="#" class="list-group-item p-1">
							<div class="rank-num rounded-lg">2</div>
							<div class="rank-img rounded-circle">
								<img src="http://placehold.it/80x80">
							</div>
							<div class="rank-info">
								<div class="rank-name">밍고카페</div>
								<div class="float-right ml-3"
									style="font-size: 0.8em; margin-top: 3px;">(133개)</div>
								<div class="rank-score">8.3</div>
								<br>
								<div class="rank-address">서울시 광진구 자양3동</div>
								<div class="rank-star">★★★★☆</div>
							</div>
						</a> <a href="#" class="list-group-item p-1">
							<div class="rank-num rounded-lg">3</div>
							<div class="rank-img rounded-circle">
								<img src="http://placehold.it/80x80">
							</div>
							<div class="rank-info">
								<div class="rank-name">밍고카페</div>
								<div class="float-right ml-3"
									style="font-size: 0.8em; margin-top: 3px;">(133개)</div>
								<div class="rank-score">8.3</div>
								<br>
								<div class="rank-address">서울시 광진구 자양3동</div>
								<div class="rank-star">★★★★☆</div>
							</div>
						</a> <a href="#" class="list-group-item p-1">
							<div class="rank-num rounded-lg">4</div>
							<div class="rank-img rounded-circle">
								<img src="http://placehold.it/80x80">
							</div>
							<div class="rank-info">
								<div class="rank-name">밍고카페</div>
								<div class="float-right ml-3"
									style="font-size: 0.8em; margin-top: 3px;">(133개)</div>
								<div class="rank-score">8.3</div>
								<br>
								<div class="rank-address">서울시 광진구 자양3동</div>
								<div class="rank-star">★★★★☆</div>
							</div>
						</a> <a href="#" class="list-group-item p-1">
							<div class="rank-num rounded-lg">5</div>
							<div class="rank-img rounded-circle">
								<img src="http://placehold.it/80x80">
							</div>
							<div class="rank-info">
								<div class="rank-name">밍고카페</div>
								<div class="float-right ml-3"
									style="font-size: 0.8em; margin-top: 3px;">(133개)</div>
								<div class="rank-score">8.3</div>
								<br>
								<div class="rank-address">서울시 광진구 자양3동</div>
								<div class="rank-star">★★★★☆</div>
							</div>
						</a>

					</div>
				</div>
				<div class="col-lg-5 mb-5 mt-4 latest-review shadow-sm">
					<div class="review-header p-3 clearfix">

						<img src="./img/profile.png" class="rounded-circle float-left">
						<div style="height: 80px; margin-left: 90px; position: relative">
							<div id="review-header-name">밍고님</div>

							<div id="review-header-score">3.9</div>
							<div id="review-header-star">☆</div>
							<div id="review-header-date">3일전</div>
						</div>
					</div>
					<div style="height: 428px; overflow-y: scroll; overflow-x: hidden;">
						<div class="pr-1">
							<img id="review-img" src="./img/cafe.jpg">
						</div>
						<div class="review-content pt-3">Lorem ipsum dolor sit amet
							consectetur adipisicing elit. Deleniti magnam eum earum,
							doloribus, delectus odio sit ipsam maiores tenetur possimus iusto
							officia illo, tempora repudiandae qui quis dolorum deserunt.
							Nesciunt est dolorem magni ab dolorum exercitationem repudiandae
							commodi perspiciatis, atque similique. Sunt molestias repudiandae
							quisquam. Tempore dignissimos saepe voluptatibus explicabo culpa,
							unde odit perspiciatis porro praesentium enim doloremque quaerat
							ipsum obcaecati quisquam fugiat dolorum voluptatum non
							cupiditate! Minus tenetur est, harum delectus enim facere nihil
							nam voluptatem? Minus asperiores aliquam accusantium vero
							praesentium reprehenderit repellendus corrupti tempore quae
							voluptatum! Est, aperiam accusamus! Officia, fuga ex quis ipsa
							accusantium omnis quam.</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-7 mb-5 board-area">
					<div class="container bg-light board p-2 shadow-sm">
						<div class="container">
							<span style="font-size: 1.8em;">자유게시판</span> <a href="#"
								class="fa fa-plus-square-o detail-icon"
								style="font-size: 3em; float: right;"></a>
						</div>
						<ul class="list-group list-group-flush board-ul w-100">
							<li class="list-group-item p-0"><a href="#">자유1</a></li>
							<li class="list-group-item p-0"><a href="#">자유2</a></li>
							<li class="list-group-item p-0"><a href="#">자유3</a></li>
							<li class="list-group-item p-0"><a href="#">자유4</a></li>
							<li class="list-group-item p-0"><a href="#">자유5</a></li>
							<li class="list-group-item p-0"><a href="#">자유6</a></li>
							<li class="list-group-item p-0"><a href="#">자유7</a></li>
							<li class="list-group-item p-0"><a href="#">자유8</a></li>

						</ul>
					</div>
					<div class="container bg-light board p-2 shadow-sm">
						<div class="container">
							<span style="font-size: 1.8em;">정보게시판</span> <a href="#"
								class="fa fa-plus-square-o detail-icon"
								style="font-size: 3em; float: right;"></a>
						</div>
						<ul class="list-group list-group-flush board-ul w-100">
							<li class="list-group-item p-0"><a href="#">정보1</a></li>
							<li class="list-group-item p-0"><a href="#">정보2</a></li>
							<li class="list-group-item p-0"><a href="#">정보3</a></li>
							<li class="list-group-item p-0"><a href="#">정보4</a></li>
							<li class="list-group-item p-0"><a href="#">정보5</a></li>
							<li class="list-group-item p-0"><a href="#">정보6</a></li>
							<li class="list-group-item p-0"><a href="#">정보7</a></li>
							<li class="list-group-item p-0"><a href="#">정보8</a></li>

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