<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.security.SecureRandom"  %>
<%@ page import="java.math.BigInteger"  %>
<%@ page import="java.net.URLEncoder"  %>
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
    
    <link rel="stylesheet" type="text/css" href="css/login/loginForm.css">

    <script>

	$(document).ready(function() {
      $('.loginbutton').click(function() {
    	  if ($("#email").val().trim() == "") {
    		  alert("아이디를 입력해 주세요");
    		  $("#email").focus();
    		  return false;
    	  }
    	  
    	  if ($("#password").val().trim() == "") {
    		  alert("비밀번호를 입력해 주세요");
    		  $("#password").focus();
    		  return false;
    	  }
    	  $("#login").submit();

      });

    });
	 $(function() {
		    $("#password").keyup(function(e){
		    	if(e.keyCode == 13)  $(".loginbutton").trigger("click");
		    });
	   	});
    </script>
</head>
<body>

    <div class="wrap">
    <div class="header"></div>
    <div class="title">
	<span class="t1">
	<a href="#" class="join-title">관리자</a>
	</span>  
	<span class="t2">로그인</span>
	<p class="t3">관리자 로그인 페이지입니다.</p>    
  
	<form id="login" action = "/adminLoginProcess.do" method="post">
        <div class="main">
            <label class="email1">
                <span class="email2">
                    아이디&nbsp;
                </span>
                    <div class="emailaddress">
                <input name="email" id="email" required autocomplete="new-password" class="emailaddress">    
                
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
                       <input name="password" id="password" type="password" minlength="10" maxlength="20" required  class="password">
                    </div>
                </div>
                </label>   
		</div>
		</form>
		<br>
		<br>
		
			<div class="button1-select">
	            <button type="button" class="loginbutton" onclick = "javascript:loginForm();">로그인</button>
	        </div>
	        <br>
	     
	     
			<div class="footer">
		        <p>Copyright © CAFE MINGO All Rights Reserved.</p>
		    </div>
			</div>
		</div>
	
	
		
	
</body>
</html>