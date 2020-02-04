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
    
	<link rel="stylesheet" type="text/css" href="css/findUser/findPwd_step2.css">
	<script type="text/javascript" src="js/findUser/findPwd_step2.js"></script>
</head>

<body>

	<div class="wrap">
    <div class="header"></div>
    <div class="title">
		<span class="t1">MINGO</span>  
		<span class="t2">비밀번호 찾기</span>
		<p class="t3">비밀번호를 재설정하기</p>   
	</div>
	
	<div class="findPwd_step2">
		<ol class="find_process ">
			<li class="process">01.회원정보 입력</li>
			<li class="process_active">02.비밀번호 재설정</li>
			
		</ol>
		<form action="/updatePwd.do" id="findPwd_step2" method="post">
			<p class="formarea">
			본인을 확인하였습니다.
			<br>새로운 비밀번호를 등록해 주세요
			</p>
			<div class="resultbox">
				<label class="new_pw">
					<span class="new_pw">
						새 비밀번호
						&nbsp;
					</span>
					<div class="insertbox">
						<div class="first_pw">
							<input type="password" id="password" name="password" class="insert_first_pw" minlength="6" maxlength="20" 
							required placeholder="영문,숫자 혼합하여 6~20자 이내" value="">
						</div>
					</div>
				</label>
				<div class="insertbox">
					<div class="confirm_pw">
						<input type="password" id="password_confirm" name="password_confirm" class="insert_confirm_pw " minlength="6" maxlength="20" 
						required placeholder="새 비밀번호를 다시 한번 확인 입력해 주세요" value="">
					</div>
				</div>		
			</div>
		 <input type="hidden" id ="user_id" name="user_id" value="${user_id}" >
		</form>
		
	<div class="buttonarea">
           <button type="button" class="finish_button" onclick = "javascript:findPwd_step2(); ">비밀번호 재설정 완료</button>
    </div>
	</div>
	<div class="footer">
		        <p>Copyright © CAFE MINGO All Rights Reserved.</p>
		    </div>
	</div>
	
</body>
</html>