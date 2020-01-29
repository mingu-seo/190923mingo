<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css" href="css/join/join_step1.css">

<title>Document</title>
</head>

<body>
	<div class="wrap">
		<div class="header"></div>
		<div class="title">
			<span class="t1">MINGO</span> <span class="t2">회원가입</span>
			<p class="t3">본인이 해당하시는 가입 유형을 아래에서 선택해 주세요.</p>

			<ul class="join">
				<li class="person"><a class="click" href="#">
						<div class="join-person">
							<img src="<%=request.getContextPath()%>/img/joinImg/person.png"
								width="80px" height="80px">
							<div class="join-person-persontitle">
								<h3 class="join-person-persontitle1">개인 회원가입</h3>
							</div>
							<p class="persontitle-content">카페 리뷰작성과 모든 카페 리뷰들을 확인하실 수
								있습니다.</p>
						</div>
						<div class="button1-select">
							<button type="button" class="buttonchoose"  onclick = "location.href = '/join_step2.do' ">선택하기</button>
						</div>
				</a></li>
				<li class="cafeperson"><a class="click" href="#">
						<div class="join-person">
							<img src="<%=request.getContextPath()%>/img/joinImg/person.png"
								width="80px" height="80px">
							<div class="join-person-persontitle">
								<h3 class="join-person-persontitle1">사장님 회원가입</h3>
							</div>
							<p class="persontitle-content">사장님의 카페 등록 및 관리가 가능합니다.</p>
						</div>
						<div class="button1-select">
							<button type="button" class="buttonchoose"  onclick = "location.href = '/joinForm_host.do' ">선택하기</button>
						</div>
				</a></li>
			</ul>
			<div class="reload">
				<p>
					이미 계정이 있으신가요? <a href="/loginForm.do">로그인</a>
				</p>
			</div>
			<div class="footer">
				<p>Copyright © CAFE MINGO All Rights Reserved.</p>
			</div>
		</div>
</body>
</html>