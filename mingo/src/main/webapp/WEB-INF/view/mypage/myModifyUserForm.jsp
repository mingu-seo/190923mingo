<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <!--부트 스트랩 관련 파일-->
		<%@ include file="/WEB-INF/view/include/headHTML.jsp"%>

    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- 내가 만든 파일-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
</head>
<body>
    <%@ include file="/WEB-INF/view/include/navigation.jsp"%>
    <div class="container-fluid mypage-header">
        <div class="mypage-header-wrapper">
            <div class="mypage-name">
	            <div class="mypage-img">
	            		<c:if test="${userVO.profile_image != null }">
	                	<img class="rounded-circle" src="<%=request.getContextPath() %>/upload/user/${userVO.profile_image }">
	                </c:if>
	                <c:if test="${userVO.profile_image == null}">
	                	<img class="rounded-circle" src="<%=request.getContextPath() %>/img/default/profile.png">
	                </c:if>
	            </div>
	            <div class="mypage-userid">${userVO.nickname }<span style="font-size:0.8em;">님</span></div>
            </div>
        </div>
    </div>
    <div class="container-fluid nav-wrapper">
	    <ul class="nav nav-pills mypage-nav" style="width:1140px;">
	        <li class="nav-item">
	          <a class="nav-link active my-link" data-toggle="pill" href="javascript:void(0);" onclick="location.href='myMain.do?user_id=${userVO.user_id }'">회원정보</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link my-link" data-toggle="pill" href="javascript:void(0);" onclick="location.href='myCafe.do?user_id=${userVO.user_id }'">내 카페</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link my-link" data-toggle="pill" href="javascript:void(0);" onclick="location.href='myReview.do?user_id=${userVO.user_id }'">활동내역</a>
	        </li>
	    </ul>
		</div>
    
    <div class="board-wrapper2">
        <div class="list-group list-group-flush board-side shadow">
            <div class="board-side-name">
                <i class="fa fa-gear ml-2 " style="font-size:2em;">&nbsp;회원정보</i>
            </div>
            <a href="myMain.do" class="list-group-item mt-2" style="border-top:none;font-weight:bold;">내 정보 관리</a>
            <a href="myUserModifyForm1.do" class="list-group-item">비밀번호 변경</a>
            <a href="deleteUserForm.do" class="list-group-item">회원 탈퇴</a>
            
        </div>  
        
        <div class="board-group shadow ml-4">
            <div class="pb-4 mb-1 board-name" style="border-bottom: 1px solid #6E6E6E;">
               	내 정보 관리
            </div>  
            <div class="user_info_area">
            	<form class="needs-validation" novalidate>
            	<!-- email,nickname,name,birthday, gender, phone_num, profile_image,address -->
            	<div class="form-group mt-2">
						    <label for="email">이메일 주소:</label>
						    <input type="email" class="form-control" placeholder="이메일을 입력해 주세요." id="email" name="email" value="${userVO.email }" required>
    						<div class="valid-feedback">valid</div>
    						<div class="invalid-feedback">내용을 입력해주세요!</div>
						  </div>
						  <div class="form-group">
						    <label for="nickname">닉네임:</label>
						    <input type="text" class="form-control" placeholder="닉네임을 입력해 주세요." id="nickname" name="nickname" required>
						  	<div class="valid-feedback">valid</div>
    						<div class="invalid-feedback">내용을 입력해주세요!</div>
						  </div>
						  <div class="form-group">
						    <label for="name">이름:</label>
						    <input type="text" class="form-control" placeholder="이름을 입력해 주세요." id="name" name="name">
						  </div>
						  <div class="form-group">
						    <label for="birthday">생일:</label>
						    <input type="text" class="form-control" placeholder="생일을 입력해 주세요." id="birthday" name="birthday">
						  </div>
						  <div class="form-group clearfix">
						  	<div class="mb-2">성별:</div>
						  	<div class="custom-control custom-radio float-left">
									<input type="radio" class="custom-control-input" id="gender1"
										name="gender" value="1"> <label
										class="custom-control-label" for="gender1">여자</label>
								</div>
						    <div class="custom-control custom-radio float-left ml-2" >
									<input type="radio" class="custom-control-input" id="gender2"
										name="gender" value="2"> <label
										class="custom-control-label" for="gender2">남자</label>
								</div>
								
						  </div>
						  
            	<button type="submit" class="btn btn-secondary" style="width:150px;">수정완료</button>
            	</form>	
            </div>
        </div>
    </div>
    <script>
    (function() {
    	  'use strict';
    	  window.addEventListener('load', function() {
    	    // Get the forms we want to add validation styles to
    	    var forms = document.getElementsByClassName('needs-validation');
    	    // Loop over them and prevent submission
    	    var validation = Array.prototype.filter.call(forms, function(form) {
    	      form.addEventListener('submit', function(event) {
    	        if (form.checkValidity() === false) {
    	          event.preventDefault();
    	          event.stopPropagation();
    	        }
    	        form.classList.add('was-validated');
    	      }, false);
    	    });
    	  }, false);
    })();
    
    
    
    
    </script>
    <%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>