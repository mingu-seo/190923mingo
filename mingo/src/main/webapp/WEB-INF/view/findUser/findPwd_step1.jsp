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
    
	<link rel="stylesheet" type="text/css" href="css/findUser/findPwd_step1.css">
	<script type="text/javascript" src="js/findUser/findPwd_step1.js"></script>
</head>

<body>

	<div class="wrap">
    <div class="header"></div>
    <div class="title">
		<span class="t1">MINGO</span>  
		<span class="t2">비밀번호 찾기</span>
		<p class="t3">회원정보로 인증하기</p>   
	</div>
	
	<div class="findPwd_step1">
		<ol class="find_process ">
			<li class="process_active">01.회원정보 입력</li>
			<li class="process">02.비밀번호 재설정</li>
			
		</ol>
		<form action="/step1_process.do" class="formarea" id="findPwdForm">
		
			<p class="formarea">비밀번호를 찾기 위해 회원정보를 입력해 주세요.</p>
			<div class="insertarea">
				<label class="insert_email">
					<span class="insert_email">
						아이디(이메일)
						&nbsp;
					</span>
					<div class="insert_content">
						<input placeholder="이메일을 입력해 주세요." id="email" name="email"class="email_content " value="">
					</div>
				</label>
				
				<label class="insert_bday ">
					<span class="insert_bday">
						생년월일
						&nbsp;
					</span>
					<div class="insert_content">
						<input placeholder="8자리 숫자로 입력해 주세요." id="birthday" name="birthday"class="bday_content " value="">
					</div>
				</label>
				 <label class="insert_phone_num ">
					<span class="insert_phone_num">
						핸드폰 번호
						&nbsp;
					</span>
					<div class="insert_content">
						<input placeholder="'-'없이 11자리 숫자로 입력해 주세요." id="phone_num" name="phone_num"class="phone_num_content " value="">
					</div>
				</label> 
			</div>
		</form>
		<div class="button">
            <button type="button" class="nextbutton" onclick = "javascript:findPwd_step1();">다음</button>
	    </div>
	</div>
	<div class="footer">
		        <p>Copyright © CAFE MINGO All Rights Reserved.</p>
		    </div>
	</div>
	
</body>
</html>