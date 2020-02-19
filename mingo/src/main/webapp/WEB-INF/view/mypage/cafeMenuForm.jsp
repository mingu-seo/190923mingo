<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
		
		.menu-each-section{width:124px;float:left;margin-right:10px;}
		.my-image{overflow:hidden;height:124px;width:100%;margin-bottom:10px; }
		.menu_image_section{width:100%;}
		.menu-select{width:100%;height:30px;}
		.menu_name{width:100%;height:30px;}     
		.menu_price{width:100%;height:30px;}
		.menu_image_file{width:100%;height:30px;}
		.deleteImage{width:20px;height:20px;border-radius:100%;position: relative;left:110px;bottom:255px;}  
		  
		.add-menu{float:left;width:124px;height:253px;margin-right:10px;background-color:transparent;}        
		
	
		
		  
	</style>
	
	<script>
	$(function(){
		
		// 삭제 버튼
		$('.deleteImage').click(function(){
			$(this).parent().remove();
		});
		
		<% int menu_num = Integer.parseInt(request.getParameter("menu_num"));%>
		
		//메뉴 사진 미리보기
		function menu_readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#menu_image_section<%=menu_num%>').attr('src', e.target.result);  
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#menu_image_file<%=menu_num%>").change(function(){
			menu_readURL(this);
		});
		
			
	});
	
	</script>
	
	
	
</head>

<body>
    
	<!-- default 양식 -->
	<div class="menu-each-section">	  
		<div class="my-image">  
			
			<img id="menu_image_section<%=menu_num%>" class="menu_image_section" src="img/starbucks.png" alt="메뉴 사진을 등록해주세요"/>
		</div>
		<input type="hidden" name="cafe_menu_id" value="0">
		<select name="menu_type" class="menu-select">
			<option class = "menu" >선택해주세요</option>
			<option class = "menu" value="1">음료</option>
			<option class = "menu" value="2">디저트</option>
		</select>
		<input type="text" name="menu_name" class="menu_name"/>	
		<input type="text" name="menu_price" class="menu_price"/>	
		<input type="file" name="menu_image_file" class="menu_image_file" id="menu_image_file<%=menu_num%>"/>
		<img class="deleteImage" src="img/x_btn.png">			
	</div>
	<!--  -->
								
</body>

</html>