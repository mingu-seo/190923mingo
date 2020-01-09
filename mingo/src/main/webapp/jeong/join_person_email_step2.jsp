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

.content{
    width: 600px;
    height: 500px;
    background-color: rgb(255, 255, 255);
    margin: 40px auto 40px ;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(236, 236, 236);
    border-image: initial;
    padding: 40px;
}
.main{
    margin: 40px;
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
.email-btn-check{
    position: relative;
    top:-50px;
    left: 400px;
    font-size: 16px;
    padding: 0;
    width: 137px;
    min-width: 137px;
    height: 52px;
    line-height: 50px;
    border-radius: 0;
    background-color: #ffffff;
    color: #212121;
    border: solid 1px #dfdfdf;
    -webkit-transition: background-color 0.3s;
    transition: background-color 0.3s;

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
.nickname1 > .nickname2{
   position: relative;
    float: left;
    font-size: 14px;
    font-weight: bold;

}
.nickname-input{
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
.nick-btn-check{
    position: relative;
    top:-50px;
    left: 400px;
    font-size: 16px;
    padding: 0;
    width: 137px;
    min-width: 137px;
    height: 52px;
    line-height: 50px;
    border-radius: 0;
    background-color: #ffffff;
    color: #212121;
    border: solid 1px #dfdfdf;
    -webkit-transition: background-color 0.3s;
    transition: background-color 0.3s;

}
.choice{
    right:170px;
    width: 137px;
    min-width: 137px;
    position: relative;
    display: inline-block;
    padding-right: 45px;
    font-size: 16px;
    height: 52px;
    line-height: 52px;
    text-align: left;
    white-space: nowrap;
    text-overflow: ellipsis;
    vertical-align: top;
    border-bottom: 1px solid rgb(223, 223, 223);
    overflow: hidden;
    outline:none;
}
.select-box1{
    color: #212121;
}


.box-radio-input input[type="radio"]{
    display:none;
}

.box-radio-input input[type="radio"] + span{
    position: relative;
   
   
   left: 225px;
   top:-47px;
    z-index: 8; 
    display:inline-block;
    background:none;
    border:1px solid #dfdfdf;    
    padding:8px 13px 8px 13px;
    text-align:center;
    height:32px;
    line-height:36px;
    font-weight:500;
    cursor:pointer;
}

.box-radio-input input[type="radio"]:checked + span{
    border:1px solid #23a3a7;
    background:#23a3a7;
    color:#fff;
}
 
.successbutton{
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
.returnbutton{
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
.successbutton:hover{
    background-color:rgb(1, 70, 150);
}
.returnbutton:hover{
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
<body>
    <div class="wrap">
        <div class="header"></div>
        <div class="title">
        <span class="t1">회원가입</span>    
        <span class="t2">본인인증</span>
        <p class="t3">MINGO 에서 활동하실 아이디와 비밀번호, 닉네임 등의 기본정보를 생성합니다.</p>    
       
    
    <form class="content">
        <div class="main">
            <label class="email1">
                <span class="email2">
                    아이디(이메일 주소)&nbsp;
                </span>
                    <div class="emailaddress">
                <input required autocomplete="new-password" placeholder="아이디로 사용될 이메일 주소를 입력하세요." class="emailaddress">    
                <button class="email-btn-check" type="button" style="margin-left: 16px;">중복확인</button>
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
            <label class="nickname1">
                <span class="nickname2">
                    닉네임&nbsp;
                </span>
                <div class="nickname3">
                    <div class="nickname-input">
                        <input required placeholder="사용하실 닉네임을 입력해주세요(2~10자,변경불가)" class="nickname-input">
                        <button class="nick-btn-check" type="button" style="margin-left: 16px;">중복확인</button>
                    </div>
                </div>
            </label>
        </div>
        <div class="main">
            <div class="select-box1">
                <div class="choice">
                    출생년도 선택
                </div>
            </div>
            <div class="btn-select">
                <div class="btn-select1">
                    <label class="box-radio-input"><input type="radio" name="cp_item" value="옵션1"><span>남자</span></label>
                    <label class="box-radio-input"><input type="radio" name="cp_item" value="옵션2"><span>여자</span></label>
                </div>
            </div>
        </div>
    </form>
        <div class="button1-select">
            <button type="button" class="returnbutton">이전단계</button>
            <button type="button" class="successbutton">가입완료</button>
        </div>
    <div class="footer">
        <p>Copyright © CAFE MINGO All Rights Reserved.</p>
    </div>
    </div>
    </body>
</html>