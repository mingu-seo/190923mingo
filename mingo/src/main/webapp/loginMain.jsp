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



    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <style>
    #wrap{
    padding: 200px;
    }
	#loginFormArea{
		margin :auto;
		width : 500px;
		height :400px;
		text-align : center;
	
	}
	fieldset{
		text-align : center;
		border : none;
		width: 500px;

	}
	#selectButton{
		margin-top : 10px;
	}
	table{
		width : 380px;
		margin : auto;
	}
	.td_left{
		width : 180px;
	}
	.td_right{
		width : 200px;
	}
	.font_big{font-size: 1em;}
	.font_bold{font-weight: bold;}
	.font_center{text-align: center;}
	

		

	}
	.buttonarea{
		width:200px;
		height: 200px;
		margin: auto;
	
	}
	.button{
		border-buttom:1px solid #BDBDBD;
		float:left;
	    font-size: 16px;
	    width: 140px; 
	    line-height: 50px;
	    background-color: rgb(63, 96, 204);
	    color: #ffffff; 
	    padding: 0px;
	    border-radius: 26px;
	    border-width: initial;
	    border-style: none;
	    border-color: initial;
	    border-image: initial;
	    transition: background-color 0.3s ease 0s;
	    z-index: 1;
	    
	}
	.button:hover{
    	background-color:rgb(1, 70, 150);
	}
	.button > a {
		color:#ffffff;
	}

</style>
</head>
<body>
<!-- header -->
<div class="container-fluid fixed-top bg-dark" style="opacity: 0.9;">
        <div class="container">
            <nav class="navbar navbar-expand-sm navbar-dark">
                <a class="navbar-brand" href="#"><i class="fa fa-coffee"
                        style="font-size:1.5em;font-weight:bold;">&nbsp;Mingo</i></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">카페</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">게시판</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">랭킹/통계</a>
                        </li>


                    </ul>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">회원가입</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">로그인</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <div id = "wrap">
    <section id = "loginFormArea">
	<h1>Mingo 에 오신것을 <br>
		진심으로 환영합니다.</h1>
	<form action = "login" method="POST">
		<fieldset>
		<br>
		<br>
		
			<table>
				<tr>
					<td class = "td_left">
						<label for ="id">아이디 </label>
					</td>
					<td class = "td_right">
						<input type ="text" name = "id" id ="id" value= "이메일을 입력해주세요."/>
					</td>
				</tr>
				<tr>
					<td class = "td_left">
						<label for ="passwd">비밀번호 </label>
					</td>
					<td class = "td_right">
						<input type ="password" name = "passwd" id ="passwd" />
					</td>
				</tr>
			</table>
			<div class="buttonarea"> 
			 
				<div class="button">
					<a href="#" class="login_button" >로그인 </a>
				</div>
				
			</div>
		</fieldset>
	</form>
	</section>
	</div>
		<!-- footer -->
	 <div class="jumbotron jumbotron-fluid">
        <div class="container">
            <div class="footer clearfix mb-2">
                <a href="#" class="fa fa-coffee" style="font-size:3em;float:left;font-weight: bold;">&nbsp;Mingo</a>
                <a href="#" class="fa fa-twitter" style="font-size:3em;float:right"></a>
                <a href="#" class="fa fa-facebook" style="font-size:3em;float:right;margin-right:20px;"></a>
                <a href="#" class="fa fa-youtube" style="font-size:3em;float:right;margin-right:20px;"></a>
            </div>
            <p style="font-size:1.1em">
                서울특별시 금천구 대륭테크노타운 3차 8F | 대표이사:홍길동 | 사업자등록번호:123-45-12345<br>
                통신판매업신고번호: 2019-서울금천-12345 | 대표메일: honggildong@naver.com<br>
                Copyright. All Rights Reserved.
            </p>
        </div>
	
</body>
</html>