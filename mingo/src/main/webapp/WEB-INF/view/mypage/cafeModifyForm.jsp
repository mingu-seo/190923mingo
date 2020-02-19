
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 



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
		
		#cafe-delete-btn{width:auto;float:right;}
		#cafe-delete-btn:hover{color:#F5A9BC;}
		  
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
		var product_num = ${fn:length(productList)};
		
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
		var menu_num = ${fn:length(menuList)};
		
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
		var cafeImage_num = ${fn:length(imgList)};
		
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
		
		
		// 셀렉트 태그 내 초기값 설정
		// 시설 셀렉티드		
		var faci_name_list = ['wifi', 'tables', 'interior', 'music', 'plug', 'restroom', 'studyroom', 'terrace', 'smoking', 'parking'];
		var faci_val_list = [${facilities.wifi}, ${facilities.tables}, ${facilities.interior}, ${facilities.music}, ${facilities.plug}, ${facilities.restroom}, ${facilities.studyroom}, ${facilities.terrace}, ${facilities.smoking}, ${facilities.parking}];
		for (var i=0; i<faci_name_list.length; i++){
			$('.'+faci_name_list[i]+'[value="'+ faci_val_list[i] +'"]').attr('selected', 'selected');
		}  
		
		//운영시간 셀렉티드
		var time_name_list = ['time_day', 'time_start', 'time_end'];  
		var time_val_list = [${cafe.time_day}, ${cafe.time_start}, ${cafe.time_end}];
		for (var i=0; i<time_name_list.length; i++){
			$('.'+time_name_list[i]+'[value="'+ time_val_list[i] +'"]').attr('selected', 'selected');
		}  
		
		// 서비스 셀렉티드
		var serv_name_list = ['event', 'coupon', 'mileage', 'blanket', 'drinkrefill'];
		var serv_val_list = [${service.event}, ${service.coupon}, ${service.mileage}, ${service.blanket}, ${service.drinkrefill}];
		for (var i=0; i<serv_name_list.length; i++){
			$('.'+serv_name_list[i]+'[value="'+ serv_val_list[i] +'"]').attr('selected', 'selected');
		}
		
		
		
		
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
				<form action="modifyCafe.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="cafe_id" value="${cafe_id}">
					<!-- <div class="key-info">
						<div class="topic">사업자 번호</div>
						<div class="topic-contents">
							<input type="password" name="manager_id" id="manager_id"/>	
							<div class="logo-button" onclick="onclick=document.all.file.click()">카페로고</div>
						 
						</div>
					</div> -->
					<%-- <div class="logo-info">
						<div class="topic">로고</div>
						<div class="topic-contents">
							<div class="my-image">  
								 <img id="image_section" src="img/starbucks.png" alt="카페 로고 사진을 등록해주세요"/>
							</div>
							<input type="file" name="logo_file" id="logo_file" value="${cafe.logo}"/>
							<input type="hidden" name="logo" id="logo" value="${cafe.logo}"/>
								
							<!-- <div class="logo-button" onclick="onclick=document.all.file.click()">카페로고</div> -->
						
						</div>
					</div> --%>
					<div class="time-info">
						<div class="topic">소개</div>
						<div class="topic-contents">
							<div class="each">
								<label for = "infro" class="title" id="intro-title">소개글 </label>
								<textarea rows="3" cols="3" id="cafe-intro" name="cafe_intro" > ${cafe.cafe_intro}</textarea>
							</div>
							<div class="each">
								<label for = "time" class="title">운영시간 </label>
								<select name="time_day" id="time_day">
									<option  class="time_day" >운영 요일</option>
									<option  class="time_day" value="1">매일</option>
									<option  class="time_day" value="2">월~금</option>
									<option  class="time_day" value="3">월~토</option>
									<option  class="time_day" value="4">주말</option>
								</select>
								<select name="time_start"  id="time_start">
									<option  class="time_start" >오픈 시간</option>
									<option  class="time_start" value="1">0시</option>
									<option  class="time_start" value="2">1시</option>
									<option  class="time_start" value="3">2시</option>
									<option  class="time_start" value="4">3시</option>
									<option  class="time_start" value="5">4시</option>
									<option  class="time_start" value="6">5시</option>
									<option  class="time_start" value="7">6시</option>
									<option  class="time_start" value="8">7시</option>
									<option  class="time_start" value="9">8시</option>
									<option  class="time_start" value="10">9시</option>
									<option  class="time_start" value="11">10시</option>
									<option  class="time_start" value="12">11시</option>
									<option  class="time_start" value="13">12시</option>
									<option  class="time_start" value="14">13시</option>
									<option  class="time_start" value="15">14시</option>
									<option  class="time_start" value="16">15시</option>
									<option  class="time_start" value="17">16시</option>
									<option  class="time_start" value="18">17시</option>
									<option  class="time_start" value="19">18시</option>
									<option  class="time_start" value="20">19시</option>
									<option  class="time_start" value="21">20시</option>
									<option  class="time_start" value="22">21시</option>
									<option  class="time_start" value="23">22시</option>
									<option  class="time_start" value="24">23시</option>
								</select>
								~
								<select name="time_end"  id="time_end">
									<option  class="time_start" >마감 시간</option>
									<option  class="time_end" value="1">1시</option>
									<option  class="time_end" value="2">2시</option>
									<option  class="time_end" value="3">3시</option>
									<option  class="time_end" value="4">4시</option>
									<option  class="time_end" value="5">5시</option>
									<option  class="time_end" value="6">6시</option>
									<option  class="time_end" value="7">7시</option>
									<option  class="time_end" value="8">8시</option>
									<option  class="time_end" value="9">9시</option>
									<option  class="time_end" value="10">10시</option>
									<option  class="time_end" value="11">11시</option>
									<option  class="time_end" value="12">12시</option>
									<option  class="time_end" value="13">13시</option>
									<option  class="time_end" value="14">14시</option>
									<option  class="time_end" value="15">15시</option>
									<option  class="time_end" value="16">16시</option>
									<option  class="time_end" value="17">17시</option>
									<option  class="time_end" value="18">18시</option>
									<option  class="time_end" value="19">19시</option>
									<option  class="time_end" value="20">20시</option>
									<option  class="time_end" value="21">21시</option>
									<option  class="time_end" value="22">22시</option>
									<option  class="time_end" value="23">23시</option>
									<option  class="time_end" value="24">24시</option>
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
									<select name="wifi" id="wifi">
										<option  class="wifi" >선택해주세요</option>
										<option  class="wifi" value="1">쾌적</option>
										<option  class="wifi" value="2">양호</option>
										<option  class="wifi" value="3">나쁨</option>
										<option  class="wifi" value="4">없음</option>
									</select>
									<input class= "add-info" type="text" name="wifi_text" id="wifi_text" value="${facilities.wifi_text}"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "tables" class="title">테이블 수 </label>
								<div class="each-area">
									<select name="tables"  id="tables">
										<option  class="tables" >선택해주세요</option>
										<option  class="tables" value="1">1~10인 석</option>
										<option  class="tables" value="2">11~30인 석</option>
										<option  class="tables" value="3">31~50인 석</option>
										<option  class="tables" value="4">50이상인 석</option>
									</select>
									<input class= "add-info" type="text" name="tables_text" id="tables_text"  value="${facilities.tables_text}"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "interior" class="title">분위기 </label>
								<div class="each-area">
									<select name="interior"  id="interior">
										<option  class="interior">선택해주세요</option>
										<option  class="interior" value="1">모던</option>
										<option class="interior" value="2">빈티지</option>
										<option class="interior"  value="3">네추럴</option>
										<option  class="interior" value="4">북유럽</option>
										<option  class="interior" value="5">기타</option>
									</select>
									<input class= "add-info" type="text" name="interior_text" id="interior_text"  value="${facilities.interior_text}"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "music" class="title">음악 </label>
								<div class="each-area">
									<select name="music"  id="music">
										<option  class="music">선택해주세요</option>
										<option  class="music" value="1">클래식</option>
										<option  class="music" value="2">재즈</option>
										<option  class="music" value="3">영화ost</option>
										<option  class="music" value="4">대중가요</option>
										<option  class="music" value="5">팝</option>
										<option  class="music" value="6">기타</option>
									</select>
									<input class= "add-info" type="text" name="music_text" id="music_text"  value="${facilities.music_text}"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "plug" class="title">콘센트 수</label>
								<div class="each-area">
									<select name="plug"  id="plug">
										<option  class="plug">선택해주세요</option>
										<option  class="plug" value="1">자리마다</option>
										<option  class="plug" value="2">띄엄띄엄</option>
										<option  class="plug" value="3">거의 없음</option>
										<option  class="plug" value="4">없음</option>
									</select>
									<input class= "add-info" type="text" name="plug_text" id="plug_text"  value="${facilities.plug_text}"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "restroom" class="title">화장실 </label>
								<div class="each-area">
									<select name="restroom"  id="restroom">
										<option  class="restroom" >선택해주세요</option>
										<option  class="restroom" value="1">유</option>
										<option  class="restroom" value="2">무</option>
									</select>
									<input class= "add-info" type="text" name="restroom_text" id="restroom_text"  value="${facilities.restroom_text}"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "studyroom" class="title">스터디룸</label>
								<div class="each-area">
									<select name="studyroom"  id="studyroom">
										<option  class="studyroom" >선택해주세요</option>
										<option  class="studyroom" value="1">유</option>
										<option  class="studyroom" value="2">무</option>
									</select>
									<input class= "add-info" type="text" name="studyroom_text" id="studyroom_text" value="${facilities.studyroom_text}"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "parking" class="title">주차공간 </label>
								<div class="each-area">
									<select name="parking"  id="parking">
										<option  class="parking">선택해주세요</option>
										<option  class="parking" value="1">유</option>
										<option  class="parking" value="2">무</option>
									</select>
									<input class= "add-info" type="text" name="parking_text" id="parking_text"  value="${facilities.parking_text}"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "smoking" class="title">흡연석</label>
								<div class="each-area">
									<select name="smoking"  id="smoking">
										<option  class="smoking" >선택해주세요</option>
										<option  class="smoking" value="1">유</option>
										<option  class="smoking" value="2">무</option>
									</select>
									<input class= "add-info" type="text" name="smoking_text" id="smoking_text"  value="${facilities.smoking_text}"/>		
								</div>		
							</div>
							<div class="each">
								<label for = "terrace" class="title" >테라스</label>
								<div class="each-area">
									<select name="terrace"  id="terrace">
										<option  class="terrace">선택해주세요</option>
										<option  class="terrace" value="1">유</option>
										<option  class="terrace" value="2">무</option>
									</select>
									<input class= "add-info" type="text" name="terrace_text" id="terrace_text"  value="${facilities.terrace_text}"/>		
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
									<select name="event" id="event">
										<option  class="event">선택해주세요</option>
										<option  class="event" value="1">유</option>
										<option  class="event" value="2">무</option>
									</select>
									<input class= "add-info" type="text" name="event_text" id="event_text"  value="${service.event_text}"/>	
								</div>		
							</div>
							<div class="each">
								<label for = "coupon" class="title">쿠폰</label>
								<div class="each-area">
									<select name="coupon"  id="coupon">
										<option  class="coupon">선택해주세요</option>
										<option  class="coupon" value="1">유</option>
										<option  class="coupon" value="2">무</option>
									</select>
									<input class= "add-info" type="text" name="coupon_text" id="coupon_text" value="${service.coupon_text}"/>	
								</div>		
							</div>
							<div class="each">
								<label for = "mileage" class="title">마일리지</label>
								<div class="each-area">
									<select name="mileage"  id="mileage">
										<option  class="mileage">선택해주세요</option>
										<option  class="mileage" value="1">유</option>
										<option  class="mileage" value="2">무</option>
									</select>	
									<input class= "add-info" type="text" name="mileage_text" id="mileage_text"  value="${service.mileage_text}"/>
								</div>		
							</div>
							<div class="each">
								<label for = "blanket" class="title" >담요</label>
								<div class="each-area">
									<select name="blanket"  id="blanket">
										<option  class="blanket">선택해주세요</option>
										<option  class="blanket" value="1">유</option>
										<option  class="blanket" value="2">무</option>
									</select>	
									<input class= "add-info" type="text" name="blanket_text" id="blanket_text"  value="${service.blanket_text}"/>
								</div>		
							</div>
							<div class="each">
								<label for = "drinkrefill" class="title">리필</label>
								<div class="each-area">
									<select name="drinkrefill"  id="drinkrefill">
										<option  class="drinkrefill">선택해주세요</option>
										<option  class="drinkrefill" value="1">유</option>
										<option  class="drinkrefill" value="2">무</option>
									</select>	
									<input class= "add-info" type="text" name="drinkrefill_text" id="drinkrefill_text" value="${service.drinkrefill_text}"/>
								</div>		
							</div>
						</div>
						
					</div>
					<div class="menu-info">
						<div class="topic">메뉴</div>
						<div class="topic-contents">
							<div class="each" >   
								<div class="add-menu">+</div>
								
								<c:forEach var="menuVO" items="${menuList}" varStatus="status">
									<div class="menu-each-section">
										<div class="my-image">  
											 <img id="menu_image_section${status.count }" class="menu_image_section" src="img/starbucks.png" alt="메뉴 사진을 등록해주세요"/>
										</div>
										<input type="hidden" name="cafe_menu_id" value="${menuVO.cafe_menu_id }">
										<c:if test="${menuVO.type == 1}">
											<select name="menu_type" class="menu-select">
												<option class = "menu" >선택해주세요</option>
												<option class = "menu" value="1" selected="selected">음료</option>
												<option class = "menu" value="2">디저트</option>
											</select>  
										
										</c:if>
										<c:if test="${menuVO.type == 2}">
											<select name="menu_type" class="menu-select">
												<option class = "menu" >선택해주세요</option>
												<option class = "menu" value="1">음료</option>
												<option class = "menu" value="2" selected="selected">디저트</option>
											</select>  
										</c:if>
										<input type="text" name="menu_name" class="menu_name" value="${menuVO.name }"/>	
										<input type="text" name="menu_price" class="menu_price" value="${menuVO.price }"/>	
										<input type="file" name="menu_image_file" class="menu_image_file" id="menu_image_file${status.count }" value="${menuVO.image }"/>
										<img class="deleteImage" src="img/x_btn.png">			
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="product-info">
						<div class="topic">상품</div>
						<div class="topic-contents">
							<div class="each" >   
								<div class="add-product">+</div>
								<c:forEach var="productVO" items="${productList}" varStatus="status">
									<div class="product-each-section">
										<div class="my-image">  
											 <img id="product_image_section${status.count }" class="product_image_section" src="img/starbucks.png" alt="메뉴 사진을 등록해주세요"/>
										</div>
										<input type="hidden" name="cafe_product_id" value="${productVO.cafe_product_id }">
										<c:if test="${productVO.type == 1}">
											<select name="product_type" class="product-select">
												<option class = "product" >선택해주세요</option>
												<option class = "product" value="1" selected="selected">다이어리</option>
												<option class = "product" value="2">캐릭터상품</option>
												<option class = "product" value="3">텀블러</option>
											</select>
										</c:if>
										<c:if test="${productVO.type == 2}">
											<select name="product_type" class="product-select">
												<option class = "product" >선택해주세요</option>
												<option class = "product" value="1">다이어리</option>
												<option class = "product" value="2" selected="selected">캐릭터상품</option>
												<option class = "product" value="3">텀블러</option>
											</select>
										</c:if>
										<c:if test="${productVO.type == 3}">
											<select name="product_type" class="product-select">
												<option class = "product" >선택해주세요</option>
												<option class = "product" value="1">다이어리</option>
												<option class = "product" value="2">캐릭터상품</option>
												<option class = "product" value="3" selected="selected">텀블러</option>
											</select>
										</c:if>
										<input type="text" name="product_name" class="product_name" value="${productVO.name }"/>	
										<input type="text" name="product_price" class="product_price" value="${productVO.price }"/>	
										<input type="file" name="product_image_file" class="product_image_file" id="menu_image_file${status.count }" value="${productVO.image }"/>
										<img class="deleteImage" src="img/x_btn.png">			
									</div>
								</c:forEach>
								
							</div>
						</div>
					</div>
					
					<div class="image-info">
						<div class="topic">카페사진</div>
						<div class="topic-contents">
							<div class="each" >   
								<div class="add-cafeImage">+</div>
								<c:forEach var="imageVO" items="${imgList}" varStatus="status">
									<div class="cafeImage-each-section">
										<div class="my-image">  
											 <img id="cafeImage_image_section${status.count }" class="cafeImage_image_section" src="img/starbucks.png" alt="메뉴 사진을 등록해주세요"/>
										</div>
										<input type="hidden" name="cafe_image_id" value="${imageVO.cafe_image_id }">
										<input type="file" name="cafeImage_file" class="cafeImage_image_file" id="cafeImage_image_file${status.count }" value="${imageVO.url}"/>
										<img class="deleteCafeImage" src="img/x_btn.png" style="line-height:163px;">			
									</div>
								</c:forEach>
							</div>  
						</div>
					</div>
					
					
					<input type="submit" value="수정" id="submit">
	            	<div id="cafe-delete-btn" OnClick="location.href ='deleteCafeInfo.do'">카페 정보를 모두 삭제하려면 여기를 눌러주세요.</div>  
				</form>
            </div>          
        </div>
    </div>
	<%@ include file="/WEB-INF/view/include/footer.jsp"%>	
</body>

</html>