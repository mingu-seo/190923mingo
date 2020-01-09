<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
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

.person{
    position:absolute; 
    right: 600px;
    display: flex;
    flex-direction: column;
    box-align: center;
    align-items: center;
    width: 282px;
    height: 350px;
    background-color: rgb(255, 255, 255);
    text-align: center;
    margin-right: 24px;
    transition: box-shadow 0.5s ease 0s;

}

.person:hover{
    box-shadow: 0 1px 10px rgba(0,0,0,0.5);
}
.cafeperson{
    position:absolute;
    right: 250px;
    display: flex;
    flex-direction: column;
    box-align: center;
    align-items: center;
    width: 282px;
    height: 350px;
    background-color: rgb(255, 255, 255);
    text-align: center;
    margin-right: 24px;
    transition: box-shadow 0.5s ease 0s;

}
.cafeperson:hover{
    box-shadow: 0 1px 10px rgba(0,0,0,0.5);
}
.join-person{
    width: 282px;
    height: 200px;
    flex: 1 1 auto;
    position: relative;
    top:3px;
    
}
.click{
    display: flex;
    box-align: center;
    align-items: center;
    flex-direction: column;
    height: 300px;
    width: 282px;
    padding: 24px;
    text-decoration: none;
}

.buttonchoose{
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
.buttonchoose:hover{
    background-color:rgb(1, 70, 150);
}


.join-person-persontitle{
    font-family: 'Noto Sans KR', sans-serif;
    text-decoration: none;
    margin-bottom: 8px;
    box-pack: center;
    justify-content: center;

}
.join-person-persontitle1{
      font-family: 'Noto Sans KR', sans-serif;
color: black;
font-size:20px;
}
.persontitle-content{
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 14px;
    color: rgb(102, 102, 102);
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
        <p class="t3">본인이 해당하시는 가입 유형을 아래에서 선택해 주세요.</p>    
       
    <ul class="join">
        <li class="person">
            <a class="click" href="#" >
            <div class="join-person">
                <img src="mingo/img/joinImg/person.png" width="80px" height="80px">
                <div class="join-person-persontitle">
                    <h3 class="join-person-persontitle1">개인 회원가입</h3>
                </div>
                <p class="persontitle-content">카페 리뷰작성과 모든 카페 리뷰들을 확인하실 수 있습니다.</p>
            </div>
            <div class="button1-select">
                <button type="button" class="buttonchoose">선택하기</button>
            </div>
        </a>
        </li>
        <li class="cafeperson">
            <a class="click" href="#">
                <div class="join-person">
                    <img src="mingo/img/joinImg/person.png" width="80px" height="80px">
                    <div class="join-person-persontitle">
                        <h3 class="join-person-persontitle1">사장님 회원가입</h3>
                    </div>
                    <p class="persontitle-content">사장님의 카페 등록 및 관리가 가능합니다.</p>
                </div>
                <div class="button1-select">
                    <button type="button" class="buttonchoose">선택하기</button>
                </div>
            </a>
            </li>
    </ul>
    <div class="reload">
        <p>이미 계정이 있으신가요?  <a href="#">로그인</a></p>
    </div>
    <div class="footer">
        <p>Copyright © CAFE MINGO All Rights Reserved.</p>
    </div>
    </div>
    </body>
</html>