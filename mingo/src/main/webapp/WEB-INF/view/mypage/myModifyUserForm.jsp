<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	<!-- 다음 주소 -->
	

    <!-- 내가 만든 파일-->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/boardStyle.css">
    <script type="text/javascript" src="js/join/modifyFormScript.js"></script>
   	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
    <!-- mypage 내비게이션 -->
    <%@ include file="/WEB-INF/view/mypage/myNav.jsp"%>
    
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
            	<form action="modifyUser.do" method="post" enctype="multipart/form-data" class="needs-validation" id="modifyForm" novalidate>
            	<!-- email,nickname,name,birthday, gender, phone_num, profile_image,address -->
            		<div class="form-group mt-2">
					    <label for="profile_image">사진:</label>
					    <c:if test="${userVO.profile_image !=null && userVO.profile_image !='' }">
					    	<img src="<%=request.getContextPath() %>/upload/user/${userVO.profile_image}">
					    </c:if>
					    <c:if test="${!(userVO.profile_image !=null && userVO.profile_image !='') }">
					    	<img class="rounded-circle" src="<%=request.getContextPath() %>/upload/user/profile.png" style="width:90px;height:90px;">
					    </c:if>
						<input type="file" class="form-control" id="profile_img" name="profile_img" value="${userVO.email }">
	  					<div class="valid-feedback">valid</div>
	  					<div class="invalid-feedback">invalid</div>
					 </div>
            		
            		<div class="form-group mt-2">
					    <label for="email">이메일 주소:</label>
						 <input type="email" readonly="readonly" class="form-control" placeholder="이메일을 입력해 주세요." id="email" name="email" value="${userVO.email }" required>
	  					<div class="valid-feedback">valid</div>
	  					<div class="invalid-feedback">invalid</div>
					  </div>
					  
					  <div class="form-group">
					  	
					    <label for="nickname">닉네임:</label>
					    <div class="input-group">
						    
					    	<input type="text"  class="form-control" pattern="[가-힣a-zA-Z0-9]{2,10}" placeholder="한글,영어,숫자만 2~10자 이내" id="nickname" name="nickname" value="${userVO.nickname }" required>
					  		<div class="input-group-append">
						      <button class="btn btn-secondary nick-btn-check rounded-right"  type="button" >중복확인</button>
						    </div>
						    <div class="valid-feedback">valid</div>
	  						<div class="invalid-feedback">invalid</div>
						    
					  	</div>
					  	
					  </div>
					  
					  <div class="form-group">
					    <label for="name">이름:</label>
					    <input type="text" class="form-control" pattern="[가-힣]{2,6}" placeholder="한글로 2~6자이내" id="name" name="name" value="${userVO.name }" required>
					  	<div class="valid-feedback">valid</div>
	  					<div class="invalid-feedback">invalid</div>
					  </div>
					  
					  <div class="form-group">
					  	<fmt:parseDate value="${userVO.birthday }" pattern="yyyy-MM-dd" var="parsedBirth"></fmt:parseDate>
						<fmt:formatDate value="${parsedBirth}" pattern="yyyyMMdd" var="birth"/>
					    <label for="birthday">생일:</label>
					    <input type="text" class="form-control" pattern="(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])" placeholder="'-'없이 8자리 숫자로 입력하세요." id="birthday" name="birthday" value="${birth }" required />
					    <div class="valid-feedback">valid</div>
	  					<div class="invalid-feedback">invalid</div>
					  </div>
					  
					  <div class="form-group clearfix">
					  	<div class="mb-2">성별:</div>
					  	<c:if test="${userVO.gender == 1}">
					  		<div class="custom-control custom-radio float-left">
								<input type="radio" class="custom-control-input" id="gender1"
									name="gender" value="1" checked> <label
									class="custom-control-label" for="gender1">여자</label>
							</div>
						    <div class="custom-control custom-radio float-left ml-2" >
									<input type="radio" class="custom-control-input" id="gender2"
										name="gender" value="2"> <label
										class="custom-control-label" for="gender2">남자</label>
							</div>
					  	</c:if>
					  	<c:if test="${userVO.gender == 2}">
					  		<div class="custom-control custom-radio float-left">
								<input type="radio" class="custom-control-input" id="gender1"
									name="gender" value="1"> <label
									class="custom-control-label" for="gender1">여자</label>
							</div>
						    <div class="custom-control custom-radio float-left ml-2" >
									<input type="radio" class="custom-control-input" id="gender2"
										name="gender" value="2" checked> <label
										class="custom-control-label" for="gender2">남자</label>
							</div>
					  	</c:if>
							
					  </div>
					  
					  <div class="form-group clearfix">
					  	  <label for="sample4_postcode">주소:</label><br>
						  <input type="text" class="form-control mb-1" name="post_code"id="sample4_postcode" value="${userVO.post_code }" onclick="sample4_execDaumPostcode()" placeholder="우편번호" style="float:left;clear:both;width:120px;" >
						  <button type="button" class="btn btn-secondary ml-2"  onclick="sample4_execDaumPostcode()" style="float:left;width:130px;" >우편번호 찾기</button><br>
						  <input type="text" class="form-control mb-1" name="jibun_address" id="sample4_jibunAddress" value="${userVO.jibun_address }" onclick="sample4_execDaumPostcode()" placeholder="지번주소" >
						  <input type="text" class="form-control" name="detail_address" id="sample4_detailAddress"  value="${userVO.detail_address }" placeholder="상세주소" >
						  <div class="valid-feedback">valid</div>
	  					  <div class="invalid-feedback">invalid</div>
					  </div>
					  <div class="form-group">
					    <label for="phone_num">폰번호:</label>
					    <input type="text" pattern="(^01.{1})([0-9]{4})([0-9]{4})"class="form-control" placeholder="'-'없이 11자리 숫자로 입력하세요." value="${userVO.phone_num }"id="phone_num" name="phone_num" >
					    <div class="valid-feedback">valid</div>
	  					<div class="invalid-feedback">invalid</div>
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
    	    	
    	        if (form.checkValidity() === false || modifyFormFn() === false) {
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