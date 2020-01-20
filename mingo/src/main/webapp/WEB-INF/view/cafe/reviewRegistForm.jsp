<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<form action="reviewRegist.do" method="post" enctype="multipart/form-data">
	<label for = "user_id">이용자 아이디: </label>
	<input type="text" name="user_id" id="user_id"/><br><br>
	<label for = "cafe_id">카페 아이디: </label>
	<input type="text" name="cafe_id" id="cafe_id"/><br><br>
	
	
	<h2>점수를 입력해주세요</h2>
	<label for = "taste_score">맛 : </label>
	<input type="text" name="taste_score" id="taste_score"/><br>
	<label for = "price_score">가격 : </label>
	<input type="text" name="price_score" id="price_score"/><br>
	<label for = "facility_score">시설 : </label>
	<input type="text" name="facility_score" id="facility_score"/><br>
	<label for = "wifi_score">와이파이 및 플러그 : </label>
	<input type="text" name="wifi_score" id="wifi_score"/><br>
	<label for = "mood_score">분위기 : </label>
	<input type="text" name="mood_score" id="mood_score"/><br>
	<label for = "clean_score">청결도 : </label>
	<input type="text" name="clean_score" id="clean_score"/><br><br>
	
	<label for = "contents">리뷰 내용 : </label>
	<textarea rows="10" cols="10" name="contents" id="contents"></textarea><br>
	<label for = "image">사진: </label>
	<input type="file" name="image" id="image"/><br><br>
	
	<input type="submit" value="등록">
</form>



</body>
</html>