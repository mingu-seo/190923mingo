<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>jQuery UI Draggable - Constrain movement</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<style>
	/* .draggable { width: 90px; height: 90px; padding: 0.5em; float: left; margin: 0 10px 10px 0; }
	#draggable, #draggable2 { margin-bottom:20px; }
	#draggable { cursor: n-resize; }
	#draggable2 { cursor: e-resize; }
	#containment-wrapper { width: 95%; height:150px; border:2px solid #ccc; padding: 10px; }
	h3 { clear: left; } */
	</style>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script>
		$(function(){
			//var score_name = ['taste' , 'wifi', 'service', 'price', 'clean', 'mood'];
			<% String[] score_name = {"taste" , "wifi", "service", "price", "clean", "mood"}; %>
			<% for (int i=0; i<score_name.length; i++) {%>
			//for (var i=0; i<score_name.length; i++){
				//var name = score_name[i];
				var name = '<%=score_name[i]%>';
				console.log(name);
				$('#drag-<%=score_name[i]%>').draggable({containment: "#containment-wrapper-<%=score_name[i]%>", scroll: false});
				  
				$('#drag-<%=score_name[i]%>').on("drag", function(){
					var s_width = $(this).offset().left-$('#stack-<%=score_name[i]%>').offset().left+25;
					$('#stack-<%=score_name[i]%>').css({
						'width':s_width,
						'background-color':'#6d512f'
					});
					
				});
				
				$('#drag-<%=score_name[i]%>').bind("dragstop", function(event, ui){
					
					var s_width = $(this).offset().left-$('#stack-<%=score_name[i]%>').offset().left+25;
					var s_final = 0;
					var s_score = 0;
					if (s_width<=75){
						s_final = 0;
						s_score = 0;
					} else if (s_width>65 && s_width<=135){
						s_final = 70;
						s_score = 1;
					} else if (s_width>135 && s_width<=205){
						s_final = 140;
						s_score = 2;
					} else if (s_width>205 && s_width<=275){
						s_final = 210;
						s_score = 3;
					} else if (s_width>275 && s_width<=345){
						s_final = 280;
						s_score = 4;
					} else{
						s_final = 350;
						s_score = 5;
					}				
					$(this).css({
						'left':s_final
					})  
					var s_width = $(this).offset().left-$('#stack-<%=score_name[i]%>').offset().left+40;
					$('#stack-<%=score_name[i]%>').css({
						'width':s_width,
						'background-color':'#6d512f'  
					});  
					$('#<%=score_name[i]%>_score').val(s_score);
					
					
			    });
				
				$('#containment-wrapper-<%=score_name[i]%>').click(function(e){
					
					var mouse_x = e.pageX;
					var stack_x = $(this).offset().left;
					var s_x = mouse_x-stack_x;
					var s_final = 0;
					var s_score = 0;
					if (s_x<=75){
						s_final = 0;
						s_score = 0;
					} else if (s_x>65 && s_x<=135){
						s_final = 70;
						s_score = 1;
					} else if (s_x>135 && s_x<=205){
						s_final = 140;
						s_score = 2;
					} else if (s_x>205 && s_x<=275){
						s_final = 210;
						s_score = 3;
					} else if (s_x>275 && s_x<=345){
						s_final = 280;
						s_score = 4;
					} else{
						s_final = 350;
						s_score = 5;
					}
					$('#drag-<%=score_name[i]%>').css({
						'left':s_final
					})
					$('#stack-<%=score_name[i]%>').css({
						'width':s_final+50,
						'background-color':'#6d512f'  
					}); 
					$('#<%=score_name[i]%>_score').val(s_score);
					
				});
				
			//}
			<% } %>
			
			//리뷰 이미지 미리보기
			
			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function (e) {
						$('#image_section').attr('src', e.target.result);  
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
			$("#my-review-image").change(function(){
			   readURL(this);
			});
		
		});
		
	</script>
	<style>
            
    	/* draggable 스타일 */
    	form{width:80%;}
    	.review-graph-area{margin-top:50px; width:900px; overflow: hidden;}
        .my-graph{width:450px; height:150px;float:left;}
        .my-graph_area{width:400px; height:50px; border-radius:50px; background-color:#E6E6E6; }
        .ui-widget-content{width:50px; height:50px; border-radius:50px;position:relative; }
        .my-graph_text{width:100%;}
        .my-graph-num{width:70px; height:30px;float:left;line-height:30px;}
        .my-graph-num:nth-child(1){margin-left:25px;}
		.graph-name{font-size:1.5em;width:70px; height:50px;margin-left: 18px;}
        .my-graph_stack{height:50px; border-radius:50px;}
        .my-image{width:700px; text-align: center;}
        #image_section{width:100%;margin-left:80px;}
		#review-contents{width:700px;height:150px;margin-left:80px;}
		#my-review-image{margin-left:80px;}
		#review-btn{width:100px;height:50px;background-color:#F3E2A9;border-style:none;font-weight:bold;background-position:center center;background-repeat:no-repeat;background-size:cover;text-align:center; }
		
	
	</style>  
	
</head>
<body>

	<div class="review-graph-area">
		<c:set var = "name_arr" value='<%= new String[]{"taste", "wifi", "service", "price", "clean", "mood"} %>' />
		<c:forEach var = "score_name" items="${name_arr }">
			<div class="my-graph">
			    <div class="my-graph_area" id="containment-wrapper-${score_name }">
			        <div class="my-graph_stack" id="stack-${score_name }">
			            <img src="img/${score_name }.png" class="draggable ui-widget-content" id="drag-${score_name }" >
				        <!-- <div class="drag-button">
				        </div>  -->    
			        </div>
			    </div>  
			    <div class="my-graph_text">
			    	<div class="my-graph-num">0</div>
			    	<div class="my-graph-num">1</div>
			    	<div class="my-graph-num">2</div>
			    	<div class="my-graph-num">3</div>
			    	<div class="my-graph-num">4</div>
			    	<div class="my-graph-num">5</div>
			    </div>
				<div class="graph-name">${score_name }</div>
			</div>
		
		</c:forEach>
	</div>
    
	<br>
	<form action="registReview.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="wifi_score" id="wifi_score" value="0">
		<input type="hidden" name="taste_score" id="taste_score" value="0">
		<input type="hidden" name="service_score" id="service_score" value="0">
		<input type="hidden" name="price_score" id="price_score" value="0">
		<input type="hidden" name="clean_score" id="clean_score" value="0">
		<input type="hidden" name="mood_score" id="mood_score" value="0">
		<input type="hidden" name="user_id" value="${userVO.user_id }"/>	
		<input type="hidden" name="cafe_id" value="${cafe_id}"/>	
		
		<div class="my-image">
			 <img id="image_section" src="img/review_default.png" alt="리뷰 사진을 등록해주세요"/>
		</div>
		<div>
			
			<textarea rows="3" cols="30" name="contents" id="review-contents"></textarea>   
		</div>
		<div>
			<input type="file" name="image_file" id="my-review-image"/>	
		</div>
		<input type="submit" id="review-btn" value="평가 등록">
		
		
	</form>

<!-- <div id="containment-wrapper">
	<div id="draggable3" class="draggable ui-widget-content">
		<p>I'm contained within the box</p>
	</div>
</div> -->
 
 
</body>
</html>