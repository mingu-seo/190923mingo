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
	<style>
		* {
	    box-sizing: border-box;
	    outline: none;
	    font-family: 'Noto Sans KR', sans-serif;
	    text-rendering: optimizeSpeed;
	    -webkit-font-smoothing: antialiased;
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
	
	#joinForm{
	    width: 600px;
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
	.insert_email{
		position: relative;
	    float: left;
	    font-size: 14px;
	    font-weight: bold;
	   
	}
	.email1 > .email2{
	   font-size: 14px;
	    width: 300px;
	    height: 52px;
	    color: rgb(33, 33, 33);
	    background-color: transparent;
	    border-top:0 solid black;
	    border-left:0 solid black;
	    border-right:0 solid black;
	    text-align: left;
	    outline:none;
	
	}
	#email{
	    font-size: 14px;
	    width: 300px;
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
	    left: 320px;
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
	    cursor: pointer;
	}
	.email-btn-check:hover{
	   box-shadow: 0 1px 10px rgba(0,0,0,0.5);
	}
	
	/* 鍮꾨�踰덊샇 */
	.insert_password{
		position: relative;
	    float: left;
	    font-size: 14px;
	    font-weight: bold;
	   
	}
	.pass1 > .pass2{
	   font-size: 14px;
	    width: 300px;
	    height: 52px;
	    color: rgb(33, 33, 33);
	    background-color: transparent;
	    border-top:0 solid black;
	    border-left:0 solid black;
	    border-right:0 solid black;
	    text-align: left;
	    outline:none;
		
	}
	#password{
	    font-size: 14px;
	    width: 300px;
	    height: 52px;
	    color: rgb(33, 33, 33);
	    background-color: transparent;
	    border-top:0 solid black;
	    border-left:0 solid black;
	    border-right:0 solid black;
	    text-align: left;
	    outline:none;
	    padding: 1px0px;
	}
	#password_confirm{
	    font-size: 14px;
	    width: 300px;
	    height: 52px;
	    color: rgb(33, 33, 33);
	    background-color: transparent;
	    border-top:0 solid black;
	    border-left:0 solid black;
	    border-right:0 solid black;
	    text-align: left;
	    outline:none;
	    padding: 1px 0px;
	}
	/* �씠由� */
	.insert_name{
		position: relative;
	    float: left;
	    font-size: 14px;
	    font-weight: bold;
	   
	}
	.name1 > .name2{
	   font-size: 14px;
	    width: 300px;
	    height: 52px;
	    color: rgb(33, 33, 33);
	    background-color: transparent;
	    border-top:0 solid black;
	    border-left:0 solid black;
	    border-right:0 solid black;
	    text-align: left;
	    outline:none;
	
	}
	#name{
	    font-size: 14px;
	    width: 300px;
	    height: 52px;
	    color: rgb(33, 33, 33);
	    background-color: transparent;
	    border-top:0 solid black;
	    border-left:0 solid black;
	    border-right:0 solid black;
	    text-align: left;
	    outline:none;
	}
	
	/* �땳�꽕�엫 */
	.insert_nickname{
		position: relative;
	    float: left;
	    font-size: 14px;
	    font-weight: bold;
	   
	}
	.nickname1 > .nickname2{
	   font-size: 14px;
	    width: 300px;
	    height: 52px;
	    color: rgb(33, 33, 33);
	    background-color: transparent;
	    border-top:0 solid black;
	    border-left:0 solid black;
	    border-right:0 solid black;
	    text-align: left;
	    outline:none;
	
	}
	#nickname{
	    font-size: 14px;
	    width: 300px;
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
	    left: 320px;
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
		cursor: pointer;
	}
	.nick-btn-check:hover{
	   box-shadow: 0 1px 10px rgba(0,0,0,0.5);
	}
	
	/* �깮�뀈�썡�씪 */
	.insert_bday{
		position: relative;
	    float: left;
	    font-size: 14px;
	    font-weight: bold;
	   
	}
	.bday1 > .bday2{
	   font-size: 14px;
	    width: 300px;
	    height: 52px;
	    color: rgb(33, 33, 33);
	    background-color: transparent;
	    border-top:0 solid black;
	    border-left:0 solid black;
	    border-right:0 solid black;
	    text-align: left;
	    outline:none;
	
	}
	#birthday{
	    font-size: 14px;
	    width: 300px;
	    height: 52px;
	    color: rgb(33, 33, 33);
	    background-color: transparent;
	    border-top:0 solid black;
	    border-left:0 solid black;
	    border-right:0 solid black;
	    text-align: left;
	    outline:none;
	}
	
	
	
	.gender_select > ul {
	    padding: 0px;
	}
	ul.gender_button {
	    display: flex;
	    flex-wrap: wrap;
	    
	}
	ol, ul {
	    list-style: none;
	}
	.gender_select > ul li:first-child {
	    margin-right: -1px;
	}
	
	.gender_select > ul li {
	    margin: 0;
	    border-radius: 0;
	    z-index: 8;
	    width: 80px;
	    height: 52px;
	    line-height: 50px;
	    text-align: center;
	    font-size: 16px;
	}

	li.gender_button {
		border:1px solid #dfdfdf;
		padding: 0 24px;
	    cursor: pointer;
	}
	li {
   	 	display: list-item;
	}
	.gender_select > ul li {
	    z-index: 8;
	    margin: 0px;
	    border-radius: 0px;
	}
	.gender_select>ul li[aria-checked='true'] {
	    background-color: #ffffff;
	    border-color: #3f60cc;
	    color: #3f60cc;
	    font-weight: 700;
	    z-index: 9;
	}
	li.on.gender_button{
		border:1px solid #5d7ee9;
	}

	.successbutton{
	    font-size: 16px;
	    width: 140px;
	    min-width: 140px;
	    height: 52px;
	    line-height: 50px;
	    background-color: rgba(0, 0, 0, 0);
    	color: rgb(33, 33, 33);
	    padding: 0px;
	    border-radius: 26px;
	    border-width: 1px;
	    border-style: solid;
	    border-color: rgb(223, 223, 223);
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
	.buttonarea {
		text-align:center;
	}
	.successbutton:hover{
	   box-shadow: 0 1px 10px rgba(0,0,0,0.5);
	}
	.returnbutton:hover{
	    box-shadow: 0 1px 10px rgba(0,0,0,0.5);
	}
	.footer{
	    font-size: 14px;
	    text-align: center;
	    color: #c1c1c1;
	    font-style: normal;
	    padding: 56px 0
	}
	
	
	</style>
	
	<script>


	
	</script>

</head>

<body>
    <div class="wrap">
        <div class="header"></div>
        <div class="title">
	        <span class="t1">MINGO</span>    
	        <span class="t2">회원가입</span>
	        <p class="t3">MINGO 에서 활동하실 아이디와 비밀번호, 닉네임 등의 기본정보를 생성합니다.</p>    
      	</div>
	    <form id="joinForm" action="joinProcess.do" method="post">
	    <div class="main">
	        <label for="email">
	            <span class="insert_email">이메일&nbsp;</span>
	            <div class="email1">
	               <div class="email2">
						<input  id="email" name ="email" value="${userVO.email }" placeholder="아이디로 사용될 이메일 주소를 입력하세요."> 
	        			<button class="email-btn-check" type="button"  style="margin-left: 16px;">중복확인</button>
	        		</div>
	        	</div>
	        </label>
	    </div>
	        <div class="main">
                <label class="password">
                    <span class="insert_password"> 비밀번호&nbsp;</span>
                    <div class="pass1">
                       <div class="pass2">
	                       <input type="password" name ="password" value="${userVO.password }" id="password" minlength="10" maxlength="20" required placeholder="비밀번호를 입력해주세요 (10~20자리)" >
	                    </div>
                	</div>
                </label>
                <br>
		        <div class="pass1">
	                <div class="pass2">
		                <input type="password" name="password_confirm" value="${userVO.password }" id="password_confirm" minlength="10" maxlength="20" required placeholder="비밀번호를 다시 한번 입력해주세요." >
		            </div>
		        </div>
	        </div>
	        <div class="main">
		        <label for="name">
		            <span class="insert_name">이름&nbsp;</span>
		            <div class="name1">
		               <div class="name2">
							<input id="name" name="name"  value="${userVO.name }" required placeholder="이름을 입력해주세요."> 
		        		</div>
		        	</div>
		        </label>
	        </div>
	        <div class="main">
		        <label for="nickname">
		            <span class="insert_nickname">닉네임&nbsp;</span>
		            <div class="nickname1">
		               <div class="nickname2">
							<input id="nickname" name="nickname"  value="${userVO.nickname }" minlength="2" maxlength="10" required placeholder="사용하실 닉네임을 입력해주세요(2~10자,변경불가)" > 
		        			<button class="nick-btn-check" type="button" style="margin-left: 16px;">중복확인</button>
		        		</div>
		        	</div>
		        </label>
	        </div>
	        <div class="main">
		        <label for="birtday">
		            <span class="insert_bday">생년월일&nbsp;</span>
		            <div class="bday1">
		               <div class="bday2">
							<input id="birthday" name ="birthday"  value="${userVO.birthday }" required placeholder="생년월일('-'없이 8자리로 입력해주세요)" minlength="8" maxlength="8"> 
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
       		<input type="hidden" id="type_general"  name ="type" value="1"/>
	    </form>
    </div>
    <div class="buttonarea">
        <button type="button" id="returnbutton"class="returnbutton" >다시작성</button>
        <button type="button" class="successbutton" onclick = "javascript:joinForm();">가입완료</button>
    </div>
</body>
</html>