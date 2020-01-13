<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form page for the detail information of cafe</title>
</head>
<body>
<h2>카페 정보 등록</h2>
<form action="cafeDetailRegist.mg" method="post" enctype="multipart/form-data">
	<label for = "image">카페 아이디: </label>
	<input type="text" name="cafe_id" id="cafe_id"/><br>

	<label for = "image">카페 이미지 : </label>
	<input type = "file" name="cafe_img_url" id="cafe_img_url"/>
</form>
   


</body>
</html>