<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
	<link rel="stylesheet" type="text/css" href="css/findUser/findId_step2.css">
</head>

<body>

	<div class="wrap">
    <div class="header"></div>
    <div class="title">
		<span class="t1">MINGO</span>  
		<span class="t2">아이디 찾기</span>
		<p class="t3">아이디 확인하기</p>   
	</div>
	
	<div class="findId_step2">
		<ol class="find_process ">
			<li class="process">01.회원정보 입력</li>
			<li class="process_active">02.아이디 확인</li>
			
		</ol>
		<form class="formarea">
			<p class="formarea">회원님의 아이디(이메일) 입니다.
			</p>
			<div class="resultarea">
				<div class="findId_result ">
					<input readonly class="findId_result_show" value="" style="font-weight:bold">
						
				</div>
			</div>
		</form>
		
		<div class="buttonarea">
            <button type="button" class="findpw_button"  onclick = "location.href = '/findPwd_step1.do' ">비밀번호찾기</button>
            <button type="button" class="login_button"  onclick = "location.href = '/loginForm.do' ">로그인</button>
        </div>
	</div>
	<div class="footer">
		        <p>Copyright © CAFE MINGO All Rights Reserved.</p>
		    </div>
	</div>
	
</body>
</html>