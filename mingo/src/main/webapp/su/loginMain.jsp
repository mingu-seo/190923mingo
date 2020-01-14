<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--부트 스트랩 관련 파일-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">


    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <style>
 
	*{
    	margin: 0; padding: 0;
	}
	.wrap{
	    width: 1200px;
	    margin: 0 auto;
	  
	}
	.header{
	    background-color:white; height: 180px; width: 100%; 
	    color: black; text-align: center; line-height: 100px;
	}
	.title{
	   width: 1200px;
	   height: 150px;
	    text-align: center;
	}
	.t1{
	    font-family: 'Noto Sans KR', sans-serif;
	    font-size: 40px;
	    font-weight: 700;
	    color:rgb(63, 96, 204);
	    margin-right: 8px;
	}
	.t2{
	    font-family: 'Noto Sans KR', sans-serif;
	    font-size: 40px;
	    font-weight: 700;
	    color:black;
	    margin-right: 8px;
	}
	.t3{
	    font-family: 'Noto Sans KR', sans-serif;
	    font-size: 18px;
	    color: #666666;
	    line-height: 54px
	    }
	.email1 > .email2{
	    position: relative;
	    float: left;
	    font-size: 14px;
	    font-weight: bold;
	
	}
	.emailaddress{
	    
	    font-size: 16px;
	    width: 380px;
	    height: 52px;
	    color: rgb(33, 33, 33);
	    background-color: transparent;
	    border-top:0 solid black;
	    border-left:0 solid black;
	    border-right:0 solid black;
	    text-align: left;
	    outline:none;
		
	}
	.pass1 > .pass2{
	    position: relative;
	    float: left;
	    font-size: 14px;
	    font-weight: bold;

	}
	
	.input-pass{
	    font-size: 16px;
	    width: 380px;
	    height: 60px; 
	    color: rgb(33, 33, 33);
	    background-color: transparent;
	    border-top:0 solid black;
	    border-left:0 solid black;
	    border-right:0 solid black;
	    text-align: left;
	    outline:none;
	    padding: 8px 0px;
	}
	 
	.loginbutton{
	    font-size: 16px;
	    width: 140px;
	    min-width: 140px;
	    height: 52px;
	    line-height: 50px;
	    background-color: rgb(63, 96, 204);
	    color: rgb(255, 255, 255);
	    padding: 0px;
	    border-radius: 26px;
	    border-width: initial;
	    border-style: none;
	    border-color: initial;
	    border-image: initial;
	    transition: background-color 0.3s ease 0s;
	    z-index: 1;
	}
	.joinbutton{
	    font-size: 16px;
	    width: 140px;
	    min-width: 140px;
	    height: 52px;
	    line-height: 50px;
	    background-color: rgb(127, 128, 129);
	    color: rgb(255, 255, 255);
	    padding: 0px;
	    border-radius: 26px;
	    border-width: initial;
	    border-style: none;
	    border-color: initial;
	    border-image: initial;
	    transition: background-color 0.3s ease 0s;
	    z-index: 1;
	}
	.loginbutton:hover{
	    background-color:rgb(1, 70, 150);
	}
	.joinbutton:hover{
	    background-color:rgb(78, 79, 80);
	}
	.footer{
	    font-family: 'Noto Sans KR', sans-serif;
	    position: relative;
	    font-size: 14px;
	    top:80px;
	    color: rgb(168, 167, 168);
	    text-align: center;
	    word-break: keep-all;
	 }
</style>
</head>
<body>

    <div class="wrap">
    <div class="header"></div>
    <div class="title">
	<span class="t1">MINGO</span>  
	<span class="t2">로그인</span>
	<p class="t3">MINGO에 오신것을 진심을 환영합니다.</p>    
       
	<form class = "login" method="POST">
        <div class="main">
            <label class="email1">
                <span class="email2">
                    아이디&nbsp;
                </span>
                    <div class="emailaddress">
                <input required autocomplete="new-password" 
                placeholder="이메일을 입력해주세요." class="emailaddress">    
                
                </div>
            </label>
        </div>
        <br>
       
        <div class="main">
                <label class="pass1">
                    <span class="pass2">
                       비밀번호&nbsp;
                    </span>
                    <div class="first-pass">
                       <div class="input-pass">
                       <input type="password" minlength="10" maxlength="20" 
                       required placeholder="비밀번호를 입력해주세요 " class="input-pass">
                    </div>
                </div>
                </label>   
		</div>
		</form>
		<br>
		<br>
		
			<div class="button1-select">
	            <button type="button" class="loginbutton">로그인</button>
	            <button type="button" class="joinbutton">회원가입</button>
	        </div>
			<div class="footer">
		        <p>Copyright © CAFE MINGO All Rights Reserved.</p>
		    </div>
			</div>
		</div>
	
	
		
	
</body>
</html>