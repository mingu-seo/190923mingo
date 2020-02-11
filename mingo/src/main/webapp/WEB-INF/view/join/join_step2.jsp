<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.security.SecureRandom"  %>
<%@ page import="java.math.BigInteger"  %>
<%@ page import="java.net.URLEncoder"  %>
<%
String client_id = "QI9nhKdLYdgGZ21jz2ay";
String redirectURI = URLEncoder.encode("http://localhost:8080/naverJoinCallback.jsp");
SecureRandom random = new SecureRandom();
String state = new BigInteger(130, random).toString(32);
session.setAttribute("state", state);

String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id="+client_id+"&redirect_uri="+redirectURI+"&state="+state;
%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/join/join_step2.css">
    <script>
     function joinWithNaver(){
    	window.open('<%=apiURL%>', '_blank' , 'width=300', 'height=300','scrollbar=no','status=no');
	}
    </script>
    <title>Document</title>
</head>

<body>
    <div class="wrap">
        <div class="header"></div>
        <div class="title">
        <span class="t1"><a href="goMain.do">MINGO</a></span>    
        <span class="t2">회원가입</span>
        <p class="t3">가입 방법을 선택해주세요.</p>    
       
    <ul class="join">
        <li class="person">
            <a class="click" href="/joinForm.do" >
            <div class="join-person">
                <img src="<%=request.getContextPath() %>/img/joinImg/email.png" width="90px" height="90px" style="border-radius:45px;">
                <div class="join-person-persontitle">
                    <h3 class="join-person-persontitle1">이메일로 회원가입</h3>
                </div>
                <p class="persontitle-content">사용하는 이메일로 가입하기</p>
            </div>
            
        </a>
        </li>
        <li class="person1">
            <a class="click" href="javascript:joinWithNaver()">
                <div class="join-person">
                    <img src="<%=request.getContextPath() %>/img/joinImg/naver.png" width="90px" height="90px">
                    <div class="join-person-persontitle">
                        <h3 class="join-person-persontitle1">네이버 간편회원가입</h3>
                    </div>
                    <p class="persontitle-content">사용하는 네이버 계정으로 가입하기</p>
                </div>
                
            </a>
            </li>
            <li class="person2">
                <a class="click" href="/kakaoJoinForm.do">
                    <div class="join-person">
                        <img src="<%=request.getContextPath() %>/img/joinImg/kakao.png" width="90px" height="90px">
                        <div class="join-person-persontitle">
                            <h3 class="join-person-persontitle2">카카오톡 회원가입</h3>
                        </div>
                        <p class="persontitle-content1">사용하는 카카오 계정으로 가입하기</p>
                    </div>
                    
                </a>
                </li>
    </ul>
    <div class="reload">
        <p>이미 계정이 있으신가요?  <a href="/loginForm.do">로그인</a></p>
    </div>
    <div class="footer">
        <p>Copyright © CAFE MINGO All Rights Reserved.</p>
    </div>
    </div>
    </body>
</html>