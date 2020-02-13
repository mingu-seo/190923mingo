
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.CafeMenuVO"%>

<%@page import="vo.CafeMenuVO" %>
<%@page import="vo.CafeProductVO" %>


<%
List<CafeMenuVO> menuList = new ArrayList<CafeMenuVO>();
List<CafeProductVO> productList = new ArrayList<CafeProductVO>();





%>



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
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/choicss1.css">
	
	<style>
		/* 
		.regist-form{width:100%;}    
		.regist-form > form{width:100%;}
		.regist-form > form > div{width:100%;}
		.faci_each, service_each{width:100%;}
		.regist-form label{width:20%;}
		.add-img-each{border:1px solid #848484;}
		.title > *{float:left;}
		.logo-info{width:100%;} 
		*/
		form{width:100%;}  
		form > div{width:100%;}  
		#image_section{width:20%;border-radius:100%; margin-bottom:40px;}
		.key-info{width:100%;height:auto;overflow: hidden;margin-bottom:40px;border-bottom:1px solid #D8D8D8;padding-bottom:25px;}
		.logo-info{width:100%;height:auto;overflow: hidden;margin-bottom:40px;border-bottom:1px solid #D8D8D8;padding-bottom:25px;}
		.time-info{width:100%;height:auto;overflow: hidden;margin-bottom:40px;border-bottom:1px solid #D8D8D8;padding-bottom:25px;}
		.facilities-info{width:100%;height:auto;overflow: hidden;margin-bottom:40px;border-bottom:1px solid #D8D8D8;padding-bottom:25px;}
		.service-info{width:100%;height:auto;overflow: hidden;margin-bottom:40px;border-bottom:1px solid #D8D8D8;padding-bottom:25px;}
		.menu-info{width:100%;height:auto;overflow: hidden;margin-bottom:40px;border-bottom:1px solid #D8D8D8;padding-bottom:25px;}
		.product-info{width:100%;height:auto;overflow: hidden;margin-bottom:40px;border-bottom:1px solid #D8D8D8;padding-bottom:25px;}
		.image-info{width:100%;height:auto;overflow: hidden;margin-bottom:40px;border-bottom:1px solid #D8D8D8;padding-bottom:25px;}
		select{width:20%;}
		option{text-align:center;}
		.add-info{width:67%;}    
		.topic{width:20%;float:left;}
		.topic-contents{width:80%;float:left;}
		
		.title{width:20%;}
		.each{width:100%;height:auto;overflow:hidden; }
		#cafe-intro{width:70%;height:80px;float:left;} 
		#intro-title{height:80px;float:left;} 
		
		.deleteImage{width:20px;height:20px;border-radius:100%;position: relative;left:110px;bottom:255px;}  
		/* 메뉴 */
		.menu-each-section{width:124px;float:left;margin-right:10px;}
		.my-image{overflow:hidden;height:124px;width:100%;margin-bottom:10px; }
		.menu_image_section{width:100%;}
		.menu-select{width:100%;height:30px;}
		.menu_name{width:100%;height:30px;}     
		.menu_price{width:100%;height:30px;}
		.menu_image_file{width:100%;height:30px;}
		.add-menu{color:#A4A4A4; font-size:4.0em; border:1px dashed #D8D8D8; float:left;width:124px;height:253px;margin-right:10px;text-align:center;line-height:253px;}        
		
		/* 상품 */
		.product-each-section{width:124px;float:left;margin-right:10px;}
		.my-image{overflow:hidden;height:124px;width:100%;margin-bottom:10px; }
		.product_image_section{width:100%;}
		.product-select{width:100%;height:30px;}
		.product_name{width:100%;height:30px;}     
		.product_price{width:100%;height:30px;}
		.product_image_file{width:100%;height:30px;}
		.add-product{color:#A4A4A4; font-size:4.0em; border:1px dashed #D8D8D8; float:left;width:124px;height:253px;margin-right:10px;text-align:center;line-height:253px;}        
		
		/* 카페사진 */
		.cafeImage-each-section{width:124px;float:left;margin-right:10px;}
		.my-image{overflow:hidden;height:124px;width:100%;margin-bottom:10px; }
		.cafeImage_image_section{width:100%;}
		.cafeImage-select{width:100%;height:30px;}
		.cafeImage_name{width:100%;height:30px;}     
		.cafeImage_price{width:100%;height:30px;}
		.cafeImage_image_file{width:100%;height:30px;}
		.add-cafeImage{color:#A4A4A4; font-size:4.0em; border:1px dashed #D8D8D8; float:left;width:124px;height:163px;margin-right:10px;text-align:center;line-height:163px;}        
		.deleteCafeImage{width:20px;height:20px;border-radius:100%;position: relative;left:110px;bottom:165px;}  
		
		
	
		  
	</style>
	
	<script>
	$(function(){
		
		// 삭제 버튼
		$('.deleteImage').click(function(){
			$(this).parent().remove();
		});
		// 삭제 버튼
		$('.deleteCafeImage').click(function(){
			$(this).parent().remove();
		});
		
		
		
		//로고 사진 미리보기
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#menu_image_section').attr('src', e.target.result);  
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#logo_file").change(function(){
		   readURL(this);
		});
		
		//메뉴 사진 미리보기
		var product_num = 1;
		
		function product_readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#product_image_section'+product_num).attr('src', e.target.result);  
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#product_image_file"+product_num).change(function(){
			console.log("이미지 변경");
			product_readURL(this);
		});       
		$('.add-product').click(function(){
			product_num++;
			console.log("사진 번호 증가!!"+product_num);
			console.log("메뉴 추가");
			$.ajax({
				url:'cafeProductForm.do',
				dataType:'text',
				type:'POST',
				data: {'product_num':product_num},
				success:function(data){
					$('.add-product').parent().append(data);
					console.log("성공!!");
					
				}
			});
			
			    	 
		});
		//상품 사진 미리보기
		var menu_num = 1;
		
		function menu_readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#menu_image_section'+menu_num).attr('src', e.target.result);  
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#menu_image_file"+menu_num).change(function(){
			console.log("이미지 변경");
			menu_readURL(this);
		});       
		$('.add-menu').click(function(){
			menu_num++;
			console.log("사진 번호 증가!!"+menu_num);
			console.log("메뉴 추가");
			$.ajax({
				url:'cafeMenuForm.do',
				dataType:'text',
				type:'POST',
				data: {'menu_num':menu_num},
				success:function(data){
					$('.add-menu').parent().append(data);
					console.log("성공!!");
					
				}
			});
			
			    	 
		});
		//카페 사진 미리보기
		var cafeImage_num = 1;
		
		function cafeImage_readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#menu_image_section'+cafeImage_num).attr('src', e.target.result);  
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#cafeImage_image_file"+cafeImage_num).change(function(){
			console.log("이미지 변경");
			cafeImage_readURL(this);
		});       
		$('.add-cafeImage').click(function(){
			cafeImage_num++;
			console.log("사진 번호 증가!!"+cafeImage_num);
			console.log("메뉴 추가");
			$.ajax({
				url:'cafeCafeImageForm.do',
				dataType:'text',
				type:'POST',
				data: {'cafeImage_num':cafeImage_num},
				success:function(data){
					$('.add-cafeImage').parent().append(data);
					console.log("성공!!");
					
				}
			});
			
			
			
			    	 
		});
		
		/*  */
		
		
		
		/* //상품 사진 미리보기
		
		function product_readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#image_section').attr('src', e.target.result);  
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#logo_file").change(function(){
			product_readURL(this);
		});
		//카페 사진 미리보기
		function cafe_readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#image_section').attr('src', e.target.result);  
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#logo_file").change(function(){
			cafe_readURL(this);
		}); */
			
	});
	
	</script>
	
	
	
</head>

<body>
    <%@ include file="/WEB-INF/view/include/navigation.jsp" %>  
    <div class="container-fluid mypage-header">
        <div class="mypage-header-wrapper">
            <div class="mypage-name">
	            <div class="mypage-img">
	                <img class="rounded-circle" src="upload/user/${userVO.profile_image }">
	            </div>
	            <div class="mypage-userid">${userVO.nickname }</div>
            </div>
        </div>
    </div>
	<div class="container-fluid nav-wrapper">
	    <ul class="nav mypage-nav" style="width:1140px;">
	        <li class="nav-item">
	          <a class="nav-link active"  data-toggle="pill" href="myMain.do?user_id=${user_id }">회원정보</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" data-toggle="pill" href="myCafe.do?user_id=${user_id }">내 카페</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" data-toggle="pill" href="myReview.do?user_id=${user_id }">활동내역</a>
	        </li>
	    </ul>
	</div>
    <div class="board-wrapper2">
        <div class="list-group list-group-flush board-side shadow">
            <div class="board-side-name">
                <i class="fa fa-gear ml-2 " style="font-size:2em;">&nbsp;활동내역</i>
            </div>
            <a href="#" class="list-group-item">카페 정보</a>
        </div>
        
        <div class=" board-group shadow ml-4">
            <div class="pb-2 mb-4 board-name" style="border-bottom: 1px solid #6E6E6E;">
               	카페 정보 등록
            </div><br>
            <div class="regist-form">
				<form action="registCafe.do?cafe_id=<%=request.getParameter("cafe_id") %>" method="post" enctype="multipart/form-data">
					
					<div class="key-info">
						<div class="topic">사업자 번호</div>
						<div class="topic-contents">
							<input type="password" name="cafe_id" id="cafe_id"/>	
							<!-- <div class="logo-button" onclick="onclick=document.all.file.click()">카페로고</div> -->
						
						</div>
					</div>
					<div class="logo-info">
						<div class="topic">로고</div>
						<div class="topic-contents">
							<div class="my-image">  
								 <img id="image_section" src="img/starbucks.png" alt="카페 로고 사진을 등록해주세요"/>
							</div>
							<input type="file" name="logo_file" id="logo_file"/>	
							<!-- <div class="logo-button" onclick="onclick=document.all.file.click()">카페로고</div> -->
						
						</div>
					</div>
					<div class="time-info">
						<div class="topic">소개</div>
						<div class="topic-contents">
							<div class="each">
								<label for = "infro" class="title" id="intro-title">소개글 </label>
								<textarea rows="3" cols="3" id="cafe-intro" name="cafe_intro"></textarea>
							</div>
							<div class="each">
								<label for = "time" class="title">운영시간 </label>
								<select name="time_day">
									<option value="1">매일</option>
									<option value="2">월~금</option>
									<option value="3">월~토</option>
									<option value="4">주말</option>
									
								</select>
								<select name="time_start">
									<option value="0">0시</option>
									<option value="1">1시</option>
									<option value="2">2시</option>
									<option value="3">3시</option>
									<option value="4">4시</option>
									<option value="5">5시</option>
									<option value="6">6시</option>
									<option value="7">7시</option>
									<option value="8">8시</option>
									<option value="9">9시</option>
									<option value="10">10시</option>
									<option value="11">11시</option>
									<option value="12">12시</option>
									<option value="13">13시</option>
									<option value="14">14시</option>
									<option value="15">15시</option>
									<option value="16">16시</option>
									<option value="17">17시</option>
									<option value="18">18시</option>
									<option value="19">19시</option>
									<option value="20">20시</option>
									<option value="21">21시</option>
									<option value="22">22시</option>
									<option value="23">23시</option>
								</select>
								~
								<select name="time_end">
									<option value="1">1시</option>
									<option value="2">2시</option>
									<option value="3">3시</option>
									<option value="4">4시</option>
									<option value="5">5시</option>
									<option value="6">6시</option>
									<option value="7">7시</option>
									<option value="8">8시</option>
									<option value="9">9시</option>
									<option value="10">10시</option>
									<option value="11">11시</option>
									<option value="12">12시</option>
									<option value="13">13시</option>
									<option value="14">14시</option>
									<option value="15">15시</option>
									<option value="16">16시</option>
									<option value="17">17시</option>
									<option value="18">18시</option>
									<option value="19">19시</option>
									<option value="20">20시</option>
									<option value="21">21시</option>
									<option value="22">22시</option>
									<option value="23">23시</option>
									<option value="24">24시</option>
								</select>
							</div>
						</div>
					</div>
					
					
					<div class="facilities-info">
						<div class="topic">시설</div>
						<div class="topic-contents">
							<div class="each">
								
								<label for = "wifi" class="title">와이파이 </label>
								<div class="each-area">
									<select name="wifi">
										<option value="1">쾌적</option>
										<option value="2">양호</option>
										<option value="3">나쁨</option>
										<option value="4">없음</option>
									</select>
									<input class= "add-info" type="text" name="wifi_text" id="wifi_text"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "tables" class="title">테이블 수 </label>
								<div class="each-area">
									<select name="tables">
										<option value="1">1~10인 석</option>
										<option value="2">11~30인 석</option>
										<option value="3">31~50인 석</option>
										<option value="4">50이상인 석</option>
									</select>
									<input class= "add-info" type="text" name="table_text" id="table_text"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "interior" class="title">분위기 </label>
								<div class="each-area">
									<select name="interior">
										<option value="1">모던</option>
										<option value="2">빈티지</option>
										<option value="3">네추럴</option>
										<option value="4">북유럽</option>
										<option value="5">기타</option>
									</select>
									<input class= "add-info" type="text" name="interior_text" id="interior_text"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "music" class="title">음악 </label>
								<div class="each-area">
									<select name="music">
										<option value="1">클래식</option>
										<option value="2">재즈</option>
										<option value="3">영화ost</option>
										<option value="4">대중가요</option>
										<option value="5">팝</option>
										<option value="6">기타</option>
									</select>
									<input class= "add-info" type="text" name="music_text" id="music_text"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "plug" class="title">콘센트 수</label>
								<div class="each-area">
									<select name="plug">
										<option value="1">자리마다</option>
										<option value="2">띄엄띄엄</option>
										<option value="3">거의 없음</option>
										<option value="4">없음</option>
									</select>
									<input class= "add-info" type="text" name="plug_text" id="plug_text"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "restroom" class="title">화장실 </label>
								<div class="each-area">
									<select name="restroom">
										<option value="1">유</option>
										<option value="2">무</option>
									</select>
									<input class= "add-info" type="text" name="restroom_text" id="restroom_text"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "studyroom" class="title">스터디룸</label>
								<div class="each-area">
									<select name="studyroom">
										<option value="1">유</option>
										<option value="2">무</option>
									</select>
									<input class= "add-info" type="text" name="studyroom_text" id="studyroom_text"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "parking" class="title">주차공간 </label>
								<div class="each-area">
									<select name="parking">
										<option value="1">유</option>
										<option value="2">무</option>
									</select>
									<input class= "add-info" type="text" name="parking_text" id="parking_text"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "smoking" class="title">흡연석</label>
								<div class="each-area">
									<select name="smoking">
										<option value="1">유</option>
										<option value="2">무</option>
									</select>
									<input class= "add-info" type="text" name="smoking_text" id="smoking_text"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "terrace" class="title">테라스</label>
								<div class="each-area">
									<select name="terrace">
										<option value="1">유</option>
										<option value="2">무</option>
									</select>
									<input class= "add-info" type="text" name="terrace_text" id="terrace_text"/>		
								</div>		
							</div>
						
						</div>
					</div>
					<div class="service-info">
						<div class="topic">서비스</div>
						<div class="topic-contents">
							<div class="each">
								<label for = "event" class="title">이벤트</label>
								<div class="each-area">
									<select name="event">
										<option value="1">유</option>
										<option value="2">무</option>
									</select>
									<input class= "add-info" type="text" name="event_text" id="event_text"/>	
								</div>		
							</div>
							<div class="each">
								<label for = "coupon" class="title">쿠폰</label>
								<div class="each-area">
									<select name="coupon">
										<option value="1">유</option>
										<option value="2">무</option>
									</select>
									<input class= "add-info" type="text" name="coupon_text" id="coupon_text"/>	
								</div>		
							</div>
							<div class="each">
								<label for = "mileage" class="title">마일리지</label>
								<div class="each-area">
									<select name="mileage">
										<option value="1">유</option>
										<option value="2">무</option>
									</select>	
									<input class= "add-info" type="text" name="mileage_text" id="mileage_text"/>
								</div>		
							</div>
							<div class="each">
								<label for = "blanket" class="title">담요</label>
								<div class="each-area">
									<select name="blanket">
										<option value="1">유</option>
										<option value="2">무</option>
									</select>	
									<input class= "add-info" type="text" name="blanket_text" id="blanket_text"/>
								</div>		
							</div>
							<div class="each">
								<label for = "drinkrefill" class="title">리필</label>
								<div class="each-area">
									<select name="drinkrefill">
										<option value="1">유</option>
										<option value="2">무</option>
									</select>	
									<input class= "add-info" type="text" name="drinkrefill_text" id="drinkrefill_text"/>
								</div>		
							</div>
						</div>
						
					</div>
					<div class="menu-info">
						<div class="topic">메뉴</div>
						<div class="topic-contents">
							<div class="each" >   
								<div class="add-menu">+</div>
								<div class="menu-each-section">
									<div class="my-image">  
										 <img id="menu_image_section1" class="menu_image_section" src="img/starbucks.png" alt="메뉴 사진을 등록해주세요"/>
									</div>
									<select name="menu_type" class="menu-select">
										<option value="1">음료</option>
										<option value="2">디저트</option>
									</select>  
									<input type="text" name="menu_name" class="menu_name"/>	
									<input type="text" name="menu_price" class="menu_price"/>	
									<input type="file" name="menu_image_file" class="menu_image_file" id="menu_image_file1"/>
									<img class="deleteImage" src="img/x_btn.png">			
								</div>
							</div>
						</div>
					</div>
					<div class="product-info">
						<div class="topic">상품</div>
						<div class="topic-contents">
							<div class="each" >   
								<div class="add-product">+</div>
								<div class="product-each-section">
									<div class="my-image">  
										 <img id="product_image_section1" class="product_image_section" src="img/starbucks.png" alt="메뉴 사진을 등록해주세요"/>
									</div>
									<select name="product_type" class="product-select">
										<option value="1">이벤트</option>
										<option value="2">담요</option>
										<option value="3">쿠폰</option>
										<option value="4">마일리지</option>
										<option value="5">리필</option>
									</select>  
									<input type="text" name="product_name" class="product_name"/>	
									<input type="text" name="product_price" class="product_price"/>	
									<input type="file" name="product_image_file" class="product_image_file" id="menu_image_file1"/>
									<img class="deleteImage" src="img/x_btn.png">			
								</div>
							</div>
						</div>
					</div>
					
					<div class="image-info">
						<div class="topic">카페사진</div>
						<div class="topic-contents">
							<div class="each" >   
								<div class="add-cafeImage">+</div>
								<div class="cafeImage-each-section">
									<div class="my-image">  
										 <img id="cafeImage_image_section1" class="cafeImage_image_section" src="img/starbucks.png" alt="메뉴 사진을 등록해주세요"/>
									</div>
									<input type="file" name="cafeImage_file" class="cafeImage_image_file" id="cafeImage_image_file1"/>
									<img class="deleteCafeImage" src="img/x_btn.png" style="line-height:163px;">			
								</div>
							</div>  
						</div>
						
					</div>
					
					
					<input type="submit" value="등록" id="submit">
				</form>
            
            </div>          
        </div>
    </div>
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>	
</body>

</html>