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
</head>

<body>
    <!-- 내비게이션 include -->
		<%@ include file="/WEB-INF/view/include/navigation.jsp"%>
		
    <div class="container-fluid mypage-header">
        <div class="mypage-header-wrapper">
            <div class="mypage-name">
                    <div class="mypage-img">
                        <img class="rounded-circle" src="./img/profile.png">
                    </div>
                    <div class="mypage-userid">밍고</div>
            </div>
            
        </div>
    </div>
    <div class="container-fluid nav-wrapper">
    <ul class="nav nav-pills mypage-nav" style="width:1140px;">
        <li class="nav-item">
          <a class="nav-link active" href="#">계정</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">활동내역</a>
        </li>
        
        
    </ul>
</div>
    <div class="board-wrapper2">
        <div class="list-group list-group-flush board-side shadow">
            <div class="board-side-name">
                <i class="fa fa-gear ml-2 " style="font-size:2em;">&nbsp;&nbsp;계정</i>
            </div>
            <a href="#" class="list-group-item mt-2" style="border-top:none;">비밀번호 변경</a>
            <a href="#" class="list-group-item">회원 정보</a>
            <a href="#" class="list-group-item">회원 탈퇴</a>

        </div>
        
        <div class=" board-group shadow ml-4">
            <div class="pb-4 mb-4 board-name" style="border-bottom: 2px solid black;">
               회원 탈퇴
               
            </div>
            <div class="form-group">
                <label for="pwd">비밀번호:</label>
                <input type="password" class="form-control" id="pwd" style="width:50%;">
            </div>
            
            <div>
                <button type="button" class="btn btn-secondary" style="width:50%;">회원탈퇴</button>
            </div>
        </div>
    </div>

    	<!-- 푸터 include -->
		<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>