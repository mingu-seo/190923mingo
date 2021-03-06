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
	
	<style>
		
		.profile_area{
			padding-top:30px;
			width:40%;
			height:300px;
			float: left;
			text-align:center;
			 
			
		}
		#profile_img{
			width:180px;
			height:180px;
			border-radius: 180px;
			margin-bottom:30px;
		}
		
		
		.info_area{
			width:60%;
			height:300px;	
			float: left;
		}
		.info_each{
			width:100%;
			height:30px;  
		}
		
		.info_each > div{
			float:left;
			font-size: 1.0em;
		}
		
		.info_title{
			width:30%;
			height:100%;
			text-align:right;
			padding-right:20px;
			border-right:1px solid #BDBDBD;
			font-weight: bold;
			color:#084B8A;
		}
		.info_content{
			width:70%;
			height:100%;
			padding-left:20px; 
			/* font-weight: bold; */			
			color:#151515;
			text-align: left;  
		}
		#addr{
			height:60px;
		}
		#withdraw_user{
			margin-top:40px;  
			width:100px;  
			height:40px;
			border:none;
			background-color: #0B3861;
			color:#FFFFFF;
		}
		#withdraw_user:hover{
			background-color: #A9D0F5;
			color:#000000;
			font-weight: bold;
		}
		
		}
		
		
	</style>
	
	<script>
		$(function(){
			console.log("작동1");
			
			//var dbPwd = ${userVO.password};
			$('#withdrawBtn').click(function(){
				var password1 = $('#pwd1').val();
				var password2 = $('#pwd2').val();
				console.log("비밀번호 변경 버튼 클릭");
				if (password1==password2){
					$.ajax({
						url:'myUserModifyPassword.do',
						type:'POST',
						dataType : "text",
						data:{ password : password1},
						success:function(data){
							alert('비밀번호가 변경됐습니다.');
							location.href="myMain.do";
							console.log("작동3");	
						},
						error : function(data) {
		        			console.log(data);
		        		}
					}); 
					
				} else {
					$('.message').text("비밀번호를 확인해주세요!");
				}
			});
		});
		 $(function() {
			    $("#pwd2").keyup(function(e){
			    	if(e.keyCode == 13)  $("#withdrawBtn").trigger("click");
			    });
		   	});	
		
		
	</script>
	
	
	
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
	                <c:if test="${userVO.profile_image == null }">
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
            <a href="myMain.do" class="list-group-item mt-2" style="border-top:none;">내 정보 관리</a>
            <a href="myUserModifyForm1.do" class="list-group-item" style="font-weight:bold;">비밀번호 변경</a>
            <a href="deleteUserForm.do" class="list-group-item">회원 탈퇴</a>
            
        </div>  
        
        <div class=" board-group shadow ml-4">
            <div class="pb-4 mb-1 board-name" style="border-bottom: 1px solid #6E6E6E;">
               	비밀번호 변경
            </div>  
            <div class="user_info_area">
            	<div>
		            <div class="form-group mt-4">
		                <label for="pwd1" style="width:25%;">새 비밀번호:</label>
		                <input type="password" class="form-control" id="pwd1" style="width:50%;">
		            </div>
		            <div class="form-group mb-3">
		                <label for="pwd2" style="width:25%;">비밀번호 확인:</label>
		                <input type="password" class="form-control" id="pwd2" style="width:50%;">
		                <div class="message text-danger"></div>
		            </div>
		            
		            <div>
		                <button type="button" id="withdrawBtn" class="btn btn-secondary" style="width:150px;">비밀번호 변경</button>
		            </div>
            	</div>
            </div>
			
        </div>
    </div>
    <%@ include file="/WEB-INF/view/include/footer.jsp"%>
</body>

</html>