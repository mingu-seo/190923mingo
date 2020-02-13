<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <link rel="stylesheet" type="text/css" href="css/join/joinForm_host.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="js/join/joinFormScript_host.js"></script>
</head>

<body>
    <div class="wrap">
        <div class="header"></div>
        <div class="title">
	        <span class="t1">
	        <a href="/goMain.do" class="join-title">MINGO</a>
	        </span>    
	        <span class="t2">회원가입</span>
	        <p class="t3">사장님 회원님의 회원가입 페이지입니다.</p>    
      	</div>
    
    <form id="joinForm_host" action="joinProcess.do" method="post">
       
        
         <div class="main">
	        <label for="email">
	            <span class="insert_email">
	              	  이메일
	              	 &nbsp;
	            </span>
	            <div class="email1">
	               <div class="email2">
						<input  id="email" name ="email" placeholder="아이디로 사용될 이메일 주소를 입력하세요."> 
	        			<button class="email-btn-check" type="button"  style="margin-left: 16px;">중복확인</button>
	        		</div>
	        	</div>
	        </label>
        </div>
        <div class="main">
                <label class="password">
                    <span class="insert_password">
                       비밀번호&nbsp;
                    </span>
                    <div class="pass1">
                       <div class="pass2">
                       <input type="password" name ="password" id="password" minlength="10" maxlength="20" required placeholder="영문,숫자 혼합하여 6~20자리 이내" >
                    </div>
                </div>
                </label>
                <br>
                
                
               <div class="pass1">
                <div class="pass2">
                <input type="password" name="password_confirm" id="password_confirm" minlength="10" maxlength="20" required placeholder="비밀번호를 다시 한번 입력해주세요." >
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
						<input id="name" name="name"required placeholder="한글로만 2~6자이내로 입력하세요."> 
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
						<input id="nickname" name="nickname"required placeholder="한글,영어,숫자만 2~10자 이내 (변경불가)" > 
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
						<input id="birthday" name ="birthday" required placeholder="'-'없이 8자리 숫자로 입력하세요." minlength="8" maxlength="8"> 
	        		</div>
	        	</div>
	        </label>
        </div>
            
         <div class="main">
	        <label for="business_num">
	            <span class="insert_business_num">
	              	  사업자 등록번호 
	              	 &nbsp;
	            </span>
	            <div class="business_num1">
	               <div class="business_num2">
						<input id="business_num" name="business_num"  required placeholder="사업자 등록번호를 입력해주세요"> 
	        		</div>
	        	</div>
	        </label>
        </div>
        
		<div class="main">
            <div class="gender_select">  
                <ul class="gender_button">
                	<li role="radio" aria-checked="false" value="1" id="female" class="gender_button gbtn">여성</li> <!-- 1 -->
                	<li role="radio" aria-checked="false" value="2" id="male" class="gender_button gbtn">남성</li> <!-- 2 -->
                </ul>
            </div>
            </div>
       
       		<input type="hidden" id="gender" name="gender" value="2"/>
       		<input type="hidden" id="type_host"  name ="type" value="2"/>
           </form>
        </div>
    
        <div class="buttonarea">
            <button type="button" id="returnbutton"class="returnbutton" >다시작성</button>
            <button type="button" class="successbutton" onclick = "joinFormFn();">가입완료</button>
        </div>
<!-- 
인증번호란 새로 만들기  -->
    <div class="footer">
  
    </body>
</html>