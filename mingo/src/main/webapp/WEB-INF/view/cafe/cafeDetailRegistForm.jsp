<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form page for the detail information of cafe</title>
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$(function(){
		$('#addImage').click(function(){
			$('.add-img-area').append("<div class='add-img-each'><input type = 'file' name='cafeImage_file'/><br><button class='deleteImage'>삭제</button></div>");    	 
		});
		$(document).on("click",".deleteImage",function(){
			$(this).parent().remove();
		});

			
	});
</script>
<style>
	.add-img-each{
		border:1px solid #848484;
	}
	
	
</style>
</head>
<body>
<h2>카페 정보 등록</h2>
<form action="cafeDetailRegist.do" method="post" enctype="multipart/form-data">
	<label for = "image">카페 아이디: </label>
	<input type="text" name="cafe_id" id="cafe_id"/><br>
	<label for = "image">카페 이미지 : </label>
	<div class="add-img-area">
		<div class='add-img-each'>
			<input type = 'file' name='cafeImage_file'/><br>
			<button class='deleteImage'>삭제</button>		
		</div>
	</div>
	<input type="submit" value="등록">
</form>
<button id="addImage">사진 추가</button>
   


</body>
</html>