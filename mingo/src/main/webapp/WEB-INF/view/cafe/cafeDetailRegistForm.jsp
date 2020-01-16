<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form page for the detail information of cafe</title>

<script>
	$(function(){
		$('#addImage').click({
			$('.add-img-area').append("<input type='file' name='cafeImage_file'/><br>");    	 
		});
	});  
</script>

</head>
<body>
<h2>카페 정보 등록</h2>
<form action="cafeDetailRegist.do" method="post" enctype="multipart/form-data">
	<label for = "image">카페 아이디: </label>
	<input type="text" name="cafe_id" id="cafe_id"/><br>
	<label for = "image">카페 이미지 : </label>
	<div class="add-img-area">
		<input type = "file" name="cafeImage_file"/><br>
		<input type = "file" name="cafeImage_file"/><br>
		<input type = "file" name="cafeImage_file"/><br>	
	</div>
	<input type="submit" value="등록">
</form>
<button id="addImage">사진 추가</button>
   


</body>
</html>