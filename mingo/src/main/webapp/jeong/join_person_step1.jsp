<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
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
.join{
    position: relative;
    width:1200px;
    height: 400px;
    margin:30px 0px 0px;
    display: block;
}


.click{
    position: relative;
    top:10px;
    display: flex;
    box-align: center;
    align-items: center;
    flex-direction: column;
    height: 300px;
    width: 282px;
    padding: 24px;
    text-decoration: none;
}
.person:hover{
    box-shadow: 0 1px 10px rgba(0,0,0,0.5);
}
.person{
    position:absolute; 
    right: 800px;
    display: flex;
    flex-direction: column;
    box-align: center;
    align-items: center;
    width: 300px;
    height: 300px;
    background-color: #3f60cc;
    text-align: center;
    margin-right: 24px;
    transition: box-shadow 0.5s ease 0s;

}
.person1{
    position:absolute; 
    right:450px;
    display: flex;
    flex-direction: column;
    box-align: center;
    align-items: center;
    width: 300px;
    height: 300px;
    background-color:#3ec728;
    text-align: center;
    margin-right: 24px;
    transition: box-shadow 0.5s ease 0s;

}
.person2{
    position:absolute; 
    right: 100px;
    display: flex;
    flex-direction: column;
    box-align: center;
    align-items: center;
    width: 300px;
    height: 300px;
    background-color: rgb(102, 104, 107);
    text-align: center;
    margin-right: 24px;
    transition: box-shadow 0.5s ease 0s;

}
.cafeperson:hover{
    box-shadow: 0 1px 10px rgba(0,0,0,0.5);
}
.join-person{
    position: relative;
    top:5px;
    width: 282px;
    height: 200px;
    flex: 1 1 auto;
    position: relative;
    top:3px;
    
}
.join-person-persontitle{
    font-family: 'Noto Sans KR', sans-serif;
    text-decoration: none;
    margin-bottom: 8px;
    box-pack: center;
    justify-content: center;

}
.join-person-persontitle1{  
    position: relative;
    top:50px;
    font-family: 'Noto Sans KR', sans-serif;
    color: white;
    font-size:20px;
}
.persontitle-content{
    position: relative;
    top:50px;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 14px;
    color: rgb(255, 255, 255);
    text-align: center;
    word-break: keep-all;
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
<body>
    <div class="wrap">
        <div class="header"></div>
        <div class="title">
        <span class="t1">MINGO</span>    
        <span class="t2">회원가입</span>
        <p class="t3">가입 방법을 선택해주세요.</p>    
       
    <ul class="join">
        <li class="person">
            <a class="click" href="/d:/java/html/mingo/join_person_email_step2.html" >
            <div class="join-person">
                <img src="email.png" width="90px" height="90px">
                <div class="join-person-persontitle">
                    <h3 class="join-person-persontitle1">이메일로 회원가입</h3>
                </div>
                <p class="persontitle-content">사용하는 이메일로 가입하기</p>
            </div>
            
        </a>
        </li>
        <li class="person1">
            <a class="click" href="/d:/java/html/mingo/join_cafe_step1.html">
                <div class="join-person">
                    <img src="naver.png" width="90px" height="90px">
                    <div class="join-person-persontitle">
                        <h3 class="join-person-persontitle1">네이버 간편회원가입</h3>
                    </div>
                    <p class="persontitle-content">사용하는 네이버 계정으로 가입하기</p>
                </div>
                
            </a>
            </li>
            <li class="person2">
                <a class="click" href="/d:/java/html/mingo/join_cafe_step1.html">
                    <div class="join-person">
                        <img src="person.png" width="90px" height="90px">
                        <div class="join-person-persontitle">
                            <h3 class="join-person-persontitle1">구글 회원가입</h3>
                        </div>
                        <p class="persontitle-content">사용하는 구글 계정으로 가입하기</p>
                    </div>
                    
                </a>
                </li>
    </ul>
    <div class="reload">
        <p>이미 계정이 있으신가요?  <a href="/signup">로그인</a></p>
    </div>
    <div class="footer">
        <p>Copyright © CAFE MINGO All Rights Reserved.</p>
    </div>
    </div>
    </body>
</html>