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
			$("#drag-taste").draggable({containment: "#containment-wrapper", scroll: false});
			
		
		
			$('#drag-taste').on('drag', function(){
				var taste_width = $('#drag-taste').position().left+25;
				$('#stack-taste').css({
					'width':taste_width,
					'background-color':'#6d512f'
				});
				
			});
			
			$('#drag-taste').bind("dragstop", function(event, ui){
				var taste_width = $('#drag-taste').position().left+25;
				var taste_final = 0;
				if (taste_width<=75){
					taste_final = 0;
				} else if (taste_width>65 && taste_width<=135){
					taste_final = 70;
				} else if (taste_width>135 && taste_width<=205){
					taste_final = 140;
				} else if (taste_width>205 && taste_width<=275){
					taste_final = 210;
				} else if (taste_width>275 && taste_width<=345){
					taste_final = 280;
				} else{
					taste_final = 350;
				}				
				$(this).css({
					'left':taste_final
				})
				var taste_width = $('#drag-taste').position().left+40;
				$('#stack-taste').css({
					'width':taste_width,
					'background-color':'#6d512f'  
				});  
		    });
			
			$('#containment-wrapper').click(function(e){
				var mouse_x = e.pageX;
				var stack_x = $(this).offset().left;
				var taste_x = mouse_x-stack_x;
				var taste_final = 0;
				if (taste_x<=75){
					taste_final = 0;
				} else if (taste_x>65 && taste_x<=135){
					taste_final = 70;
				} else if (taste_x>135 && taste_x<=205){
					taste_final = 140;
				} else if (taste_x>205 && taste_x<=275){
					taste_final = 210;
				} else if (taste_x>275 && taste_x<=345){
					taste_final = 280;
				} else{
					taste_final = 350;
				}
				$('#drag-taste').css({
					'left':taste_final
				})
				$('#stack-taste').css({
					'width':taste_final+50,
					'background-color':'#6d512f'  
				}); 
				
				
			});
			
		
		});
		
	</script>
	<style>
		/* .graph_area{
            height:150px;
            width:600px;
        }
        .graph_area > div{
            float:left;
        }
        
        .graph_stack{
            width:400px;
            height:50px;
            background-color: #D8D8D8;
            box-sizing: border-box;
            border-radius: 40px;
            line-height: 50px;
            
        }

        .graph_rate{
            text-align: right;
            height:100%;
            box-sizing: border-box;
            
            line-height: 50px;
            width:20%;
            float: left;
        }

        .graph_text{
            
        }
        .graph_logo{
            height: 40px;
            float: left;
            position: relative;
            z-index: 100;
            left:40px;
            top:5px;   

        }
        .bean_img{
            height:70px;
            float: right;
            padding-left: 0px;
            position: relative;
            left:30px;
            bottom:10px;
            z-index: 90;
        }
        .graph_text{
            float: right;
            font-size: 1.5em;
            font-weight: bold;
            color: #2E2E2E;
        }
        .graph_rate:nth-child(1){
			border-radius: 50px 0 0 50px;
        } */
            
    	/* draggable 스타일 */
        
        .graph_area{width:400px; height:50px; border-radius:50px; background-color:#E6E6E6; }
        .drag-button{width:50px; height:50px; border-radius:50px;}
        .ui-widget-content{width:100%; height:100%; border-radius:50px;position:relative; }
        #stack-taste{height:50px; border-radius:50px;}
	</style>  
	
</head>
<body>
<h1>리뷰 등록 폼</h1><br>
    <div class="graph_area" id="containment-wrapper">
        <div class="graph_stack" id="stack-taste">
	        <div class="drag-button">
	            <img src="img/taste.png" class="draggable ui-widget-content" id="drag-taste" >
	        </div>     
        </div>
        <div class="graph_text">10점</div>
    </div>



<!-- <div id="containment-wrapper">
	<div id="draggable3" class="draggable ui-widget-content">
		<p>I'm contained within the box</p>
	</div>
</div> -->
 
 
</body>
</html>