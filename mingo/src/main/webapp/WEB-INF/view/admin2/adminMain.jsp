<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>관리자 메인 페이지</title>

    <!-- 헤더파일들 include -->
		<%@ include file="/WEB-INF/view/include/headHTML.jsp"%>
		
    <!-- 내가 만든 파일-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
    
    <style>
    	.box{
            
            margin:10px 10px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width:300px;
            height:300px;
            background-color: white;
            border-radius: 50px;
            transition: 0.4s box-shadow;
            position:relative;
            cursor: pointer;
           
            

        }
        .box:hover:after {
            display: block;
            content: '';
            position: absolute;
            width: 300px;
            height: 300px;
            
            border-radius: 50px;
            z-index: -1;
            background-color: #999999;
            animation: 0.4s clockwise infinite;
        }
        .box > .main-t{
        	 	font-size:40px;
            font-weight:bold;
            
        }
        .box > .main-i{
        	font-size:4em;
        	
        }
        
        .box:hover{
            
            box-shadow: 0 5px 20px 0px #999999;
        }

        @keyframes clockwise {
            0% {
                width: 300px;
                height: 300px;
            }

            12% {
                width: 303px;
                height: 303px;
            }

            25% {
                width: 306px;
                height: 306px;
            }

            37% {
                width: 309px;
                height: 309px;
            }

            50% {
                width: 312px;
                height: 312px;
            }

            62% {
                width: 309px;
                height: 309px;
            }

            75% {
                width: 306px;
                height: 306px;
            }

            87% {
                width: 303px;
                height: 303px;
            }

            100% {
                width: 300px;
                height: 300px;
            }
        }
    </style>
    <script>
    	$(document).ready(function(){
    		$('#mngUser').click(function(){
    			location.href="mngUserMain.do?page=1";
    		});
    		$('#mngCafe').click(function(){
    			//location.href="mngCafeMain.do?";
    		});
    		$('#mngBoard').click(function(){
    			location.href="mngBoardMain.do?";
    		});
    	});
    </script>
</head>

<body class="bg-light">
     <!-- 내비게이션 include -->
		<%@ include file="/WEB-INF/view/include/navigation.jsp"%>
		
    <div class="" style="width:1140px;margin:200px auto 200px;overflow:hidden;">
    	<div class="box" id="mngUser" style="margin-left:80px;">
    		<div class="fa fa-users main-i" ></div>
    		<div class="main-t">회원 관리</div>
    		
    	</div>
    	<div class="box" id="mngCafe">
    		<div class="fa fa-coffee main-i" ></div>
    		<div class="main-t">카페 관리</div>
    	</div>
    	<div class="box" id="mngBoard">
    		<div class="fa fa-file-text-o main-i" ></div>
    		<div class="main-t">게시판 관리</div>
    	</div>
    </div>
    
    

    <!-- 푸터 include -->
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>