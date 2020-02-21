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
		.deleteCafeImage{width:20px;height:20px;border-radius:100%;position: relative;left:110px;bottom:165px;}  
		 
		.add-menu{float:left;width:124px;height:253px;margin-right:10px;background-color:transparent;}        
		
	
		
		  
	</style>
	
	<script>
	$(function(){
		
		// 삭제 버튼
		$('.deleteImage').click(function(){
			$(this).parent().remove();
		});
		$('.deleteCafeImage').click(function(){
			$(this).parent().remove();
		});
		
		<% int cafeImage_num = Integer.parseInt(request.getParameter("cafeImage_num"));%>
		
		//메뉴 사진 미리보기
		function cafeImage_readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#cafeImage_image_section<%=cafeImage_num%>').attr('src', e.target.result);  
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#cafeImage_image_file<%=cafeImage_num%>").change(function(){
			cafeImage_readURL(this);
		});
			
	});
	
	</script>
	
	
	
</head>

<body>
    
	<!-- default 양식 -->
	<div class="cafeImage-each-section">	  
		<div class="my-image">  
			
			<img id="cafeImage_image_section<%=cafeImage_num%>" class="cafeImage_image_section" src="img/starbucks.png" alt="메뉴 사진을 등록해주세요"/>
		</div>
		<input type="hidden" name="cafe_image_id" value="0">
		<input type="file" name="cafeImage_file" class="cafeImage_image_file" id="cafeImage_image_file<%=cafeImage_num%>"/>
		<img class="deleteCafeImage" src="img/x_btn.png">			
	</div>
	<!--  -->
								
</body>

</html>