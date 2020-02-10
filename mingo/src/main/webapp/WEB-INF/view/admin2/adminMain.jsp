<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

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
            background: rgba(11, 83, 238, 0.952);
            animation: 0.4s clockwise infinite;
        }
        /*
        .box:hover{
            
            box-shadow: 0 5px 20px 0px rgb(238, 11, 11);
        } */

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
</head>

<body>
     <!-- 내비게이션 include -->
		<%@ include file="/WEB-INF/view/include/navigation.jsp"%>
		
    <div class="" style="width:1140px;margin:200px auto 200px;overflow:hidden;">
    	<div class="box">회원 관리</div>
    	<div class="box">카페 관리</div>
    	<div class="box">게시판 관리</div>
    </div>
    
    

    <!-- 푸터 include -->
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>