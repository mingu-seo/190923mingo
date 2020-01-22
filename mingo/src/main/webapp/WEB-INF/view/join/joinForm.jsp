<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <link rel="stylesheet" type="text/css" href="css/join/joinForm.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="js/join/joinFormScript.js"></script>
</head>

<body>
    <div class="wrap">
        <div class="header"></div>
        <div class="title">
	        <span class="t1">MINGO</span>    
	        <span class="t2">회원가입</span>
	        <p class="t3">MINGO 에서 활동하실 아이디와 비밀번호, 닉네임 등의 기본정보를 생성합니다.</p>    
      	</div>
    
    <form class="content" action="/loginForm.do" method="post">
       
        
         <div class="main">
	        <label for="email">
	            <span class="insert_email">
	              	  이메일
	              	 &nbsp;
	            </span>
	            <div class="email1">
	               <div class="email2">
						<input class="email-input" id="email" placeholder="아이디로 사용될 이메일 주소를 입력하세요."> 
	        			<button class="email-btn-check" type="button" style="margin-left: 16px;">중복확인</button>
	        		</div>
	        	</div>
	        </label>
        </div>
        <div class="main">
                <label class="pass1">
                    <span class="pass2">
                       비밀번호&nbsp;
                    </span>
                    <div class="first-pass">
                       <div class="input-pass">
                       <input type="password" minlength="10" maxlength="20" required placeholder="비밀번호를 입력해주세요 (10~20자리)" class="input-pass">
                    </div>
                </div>
                </label>
               <div class="first-pass">
                <div class="input-pass">
                <input type="password" minlength="10" maxlength="20" required placeholder="비밀번호를 다시 한번 확인 입력해주세요." class="input-pass">
            </div>
        </div>
        </div>
        
 
        <div class="main">
	        <label for="name">
	            <span class="insert_name">
	              	  이름
	              	 &nbsp;
	            </span>
	            <div class="name1">
	               <div class="name2">
						<input class="name-input" id="name" required placeholder="이름을 입력해주세요."> 
	        		</div>
	        	</div>
	        </label>
        </div>
       
        <div class="main">
	        <label for="nickname">
	            <span class="insert_nickname">
	              	  닉네임
	              	 &nbsp;
	            </span>
	            <div class="nickname1">
	               <div class="nickname2">
						<input class="nickname-input" id="nickname" required placeholder="사용하실 닉네임을 입력해주세요(2~10자,변경불가)" > 
	        			<button class="nick-btn-check" type="button" style="margin-left: 16px;">중복확인</button>
	        		</div>
	        	</div>
	        </label>
        </div>
        
        <div class="main">
	        <label for="birtday">
	            <span class="insert_bday">
	              	  생년월일
	              	 &nbsp;
	            </span>
	            <div class="bday1">
	               <div class="bday2">
						<input class="bday-input" id="birtday" required placeholder="생년월일('-'없이 8자리로 입력해주세요)" minlength="8" maxlength="8"> 
	        		</div>
	        	</div>
	        </label>
        </div>
		<div class="main">
            <div class="gender_select">
                <ul class="gender_button">
                	<li role="radio" aria-checked="false" tabindex="0" class="gender_button">남성</li>
                	<li role="radio" aria-checked="false" tabindex="0" class="gender_button">여성</li>
                </ul>
            </div>
       </div>
           </form>
        </div>
    
        <div class="buttonarea">
            <button type="button" class="returnbutton">이전단계</button>
            <button type="button" class="successbutton" onclick = "location.href = '/loginForm.do' ">가입완료</button>
        </div>
<!-- 
인증번호란 새로 만들기  -->
    <div class="footer">
        <p>Copyright © CAFE MINGO All Rights Reserved.</p>
    </div>
  
    </body>
</html>