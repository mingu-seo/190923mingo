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
		
		
		<div>
			<label for = "cafe_id">카페 아이디: </label>
			<input type="text" name="cafe_id" id="cafe_id"/>	
		</div>
		
		
		
		<div class="logo-info">
			<label for = "logo">로고사진 등록: </label>
			<input type="file" name="logo" id="logo"/>	
		</div>
		<div class="time-info">
			<label for = "time">운영시간: </label>
			<input type="text" name="time" id="time"/>
		</div>
		
		
		<div class="facilities-info">
			<div class="faci_each">
				<label for = "wifi">와이파이 </label>
				<div class="each-area">
					<select name="wifi">
						<option value="1">쾌적</option>
						<option value="2">양호</option>
						<option value="3">나쁨</option>
						<option value="4">없음</option>
					</select>
					<input type="text" name="wifi_text" id="wifi_text"/>		
				</div>		
			</div>
			<div class="faci_each">
				<label for = "table">테이블 수 </label>
				<div class="each-area">
					<select name="table">
						<option value="1">1~10인 석</option>
						<option value="2">11~30인 석</option>
						<option value="3">31~50인 석</option>
						<option value="4">50이상인 석</option>
					</select>
					<input type="text" name="table_text" id="table_text"/>		
				</div>		
			</div>
			<div class="faci_each">
				<label for = "interior">인테리어 분위기 </label>
				<div class="each-area">
					<select name="interior">
						<option value="1">모던</option>
						<option value="2">빈티지</option>
						<option value="3">네추럴</option>
						<option value="4">북유럽</option>
						<option value="5">기타</option>
					</select>
					<input type="text" name="interior_text" id="interior_text"/>		
				</div>		
			</div>
			<div class="faci_each">
				<label for = "music">음악 </label>
				<div class="each-area">
					<select name="music">
						<option value="1">클래식</option>
						<option value="2">재즈</option>
						<option value="3">영화ost</option>
						<option value="4">대중가요</option>
						<option value="5">팝</option>
						<option value="6">기타</option>
					</select>
					<input type="text" name="wifi_text" id="wifi_text"/>		
				</div>		
			</div>
			<div class="faci_each">
				<label for = "plug">콘센트 개수</label>
				<div class="each-area">
					<select name="plug">
						<option value="1">자리마다</option>
						<option value="2">띄엄띄엄</option>
						<option value="3">거의 없음</option>
						<option value="4">없음</option>
					</select>
					<input type="text" name="plug_text" id="plug_text"/>		
				</div>		
			</div>
			<div class="faci_each">
				<label for = "restroom">화장실 </label>
				<div class="each-area">
					<select name="restroom">
						<option value="1">유</option>
						<option value="2">무</option>
					</select>
					<input type="text" name="restroom_text" id="restroom_text"/>		
				</div>		
			</div>
			<div class="faci_each">
				<label for = "studyroom">스터디룸</label>
				<div class="each-area">
					<select name="studyroom">
						<option value="1">유</option>
						<option value="2">무</option>
					</select>
					<input type="text" name="studyroom_text" id="studyroom_text"/>		
				</div>		
			</div>
			<div class="faci_each">
				<label for = "parking">주차공간 </label>
				<div class="each-area">
					<select name="parking">
						<option value="1">유</option>
						<option value="2">무</option>
					</select>
					<input type="text" name="parking_text" id="parking_text"/>		
				</div>		
			</div>
			<div class="faci_each">
				<label for = "smoking">흡연석</label>
				<div class="each-area">
					<select name="smoking">
						<option value="1">유</option>
						<option value="2">무</option>
					</select>
					<input type="text" name="smoking_text" id="smoking_text"/>		
				</div>		
			</div>
			<div class="faci_each">
				<label for = "terrace">테라스</label>
				<div class="each-area">
					<select name="terrace">
						<option value="1">유</option>
						<option value="2">무</option>
					</select>
					<input type="text" name="terrace_text" id="terrace_text"/>		
				</div>		
			</div>
		</div>
		<div class="service-info">
			<div class="faci_each">
				<label for = "event">이벤트 진행</label>
				<div class="each-area">
					<select name="event">
						<option value="1">유</option>
						<option value="2">무</option>
					</select>	
				</div>		
			</div>
			<div class="faci_each">
				<label for = "coupon">쿠폰 서비스</label>
				<div class="each-area">
					<select name="coupon">
						<option value="1">유</option>
						<option value="2">무</option>
					</select>	
				</div>		
			</div>
			<div class="faci_each">
				<label for = "mileage">마일리지 서비스</label>
				<div class="each-area">
					<select name="mileage">
						<option value="1">유</option>
						<option value="2">무</option>
					</select>	
				</div>		
			</div>
			<div class="faci_each">
				<label for = "blanket">담요 제공</label>
				<div class="each-area">
					<select name="blanket">
						<option value="1">유</option>
						<option value="2">무</option>
					</select>	
				</div>		
			</div>
			<div class="faci_each">
				<label for = "drinkrefill">음료 리필</label>
				<div class="each-area">
					<select name="drinkrefill">
						<option value="1">유</option>
						<option value="2">무</option>
					</select>	
				</div>		
			</div>
			
		</div>
		<div class="menu-info">
			<label for = "menu">메뉴 정보 등록: </label>
			<div class="each-area">	
				<select name="menu_type">
					<option value="1">음료</option>
					<option value="2">디저트</option>
				</select>
				<input type="text" name="menu_name" class="menu_name"/>	
				<input type="text" name="menu_price" class="menu_price"/>	
				<input type="text" name="menu_image" class="menu_image"/>
				<button class='deleteImage'>삭제</button>			
			</div>
			<div class="add-menu">메뉴 추가</div>
		</div>
		<div class="product-info">
			<label for = "menu">상품 정보 등록: </label>
			<div class="each-area">	
				<select name="product_type">
					<option value="1">텀블러</option>
					<option value="2">다이어리</option>
					<option value="3">머그컵</option>
				</select>
				<input type="text" name="product_name" class="product_name"/>	
				<input type="text" name="product_price" class="product_price"/>	
				<input type="text" name="product_image" class="product_image"/>			
				<button class='deleteImage'>삭제</button>
			</div>
			<div class="add-product">상품 추가</div>
		</div>
		
		<div class="image-info">
			<label for = "image">카페 이미지 : </label>
			<div class="add-img-area">
				<div class='add-img-each'>
					<input type = 'file' name='cafeImage_file'/><br>
					<button class='deleteImage'>삭제</button>		
				</div>
			</div>	
			<button id="addImage">사진 추가</button>
		</div>
		
		
		<input type="submit" value="등록" id="submit">
	</form>
   


</body>
</html>