<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
    <head>
        <title>HTML5 Basic</title>
        <meta name="viewport" content="user-scalable=no, initial-scale=1">
        
        
        <script src="js/swiper.min.js"></script>
        <script src="http://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <style>
            .graph_area{
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
            }
	    		


        </style>
    	<script type="text/javascript">
    	  	
    		$(function(){
    			$('.graph_rate').click(function(){
    				var location = $(this).children('label').attr('value')*80;
    				console.log(location);
    				$('.graph_logo').css({
    					'left':location
    				});
    				
    			});
    			
    			
    			
    			
    			/* $('.graph_stack').hover(function(){
		    		$('.graph_rate').mouseover(function(){
		    			$(this).prevAll().css({
			                'background-color': '#FACC2E'
		    			});
		    			$(this).find(':nth-child(1)').css({
		    				'border-radius': '50px 0 0 50px'
		    			});  
		    			$(this).css({
		    				'border-top-right-radius': '50px',  
		    				'border-bottom-right-radius': '50px',  
			                'background-color': '#FACC2E'
		    			});
		    		}).mouseleave(function(){
		    			$('.graph_rate').css({
		    				'border-top-right-radius': '0',  
		    				'border-bottom-right-radius': '0', 
		    				'background-color': 'transparent'	
		    			});	
		    		}).click(function(){
		    			$('.graph_rate').off(); 
		    		});  
    			}, function(){
    				$('.graph_rate').off();
    			}); */
    			    
    			
    		});  
    		
	    	
    	
    	
    	
    	</script>
    </head>
    <body>  
        <h1>리뷰 등록 폼</h1><br>
        <div class="graph_area">
            <div>
                <img src="img/wifi.png" class="graph_logo">
            </div>
            <div class="graph_stack">
                <div class="graph_rate"><label value="1"></label></div>   
                <div class="graph_rate"><label value="2"></label></div>   
                <div class="graph_rate"><label value="3"></label></div>   
                <div class="graph_rate"><label value="4"></label></div>   
                <div class="graph_rate"><label value="5"></label></div>   
         
            </div>
            <div class="graph_text">10점</div>
        </div>
        
        
        
        
        <form action="registReview.do" method="post" enctype="multipart/form-data">
        	<div>
				<label for = "contents">내용: </label>   
				<input type="text" name="contents" />	
			</div>
        	<div>
				<label for = "taste_score">맛: </label>
				<input type="text" name="taste_score" />	
			</div>  
        	<div>
				<label for = "price_score">가격: </label>
				<input type="text" name="price_score" />	
			</div>
        	<div>
				<label for = "service_score">서비스: </label>
				<input type="text" name="service_score"/>	
			</div>
        	<div>
				<label for = "wifi_score">와이파이 및 플러그: </label>
				<input type="text" name="wifi_score" />	
			</div>
        	<div>
				<label for = "mood_score">시설 및 분위기: </label>
				<input type="text" name="mood_score"/>	
			</div>
        	<div>
				<label for = "clean_score">청결도: </label>
				<input type="text" name="clean_score" />	
			</div>
        	<div>
				<label for = "image_file">카페 아이디: </label>
				<input type="file" name="image_file" />	
			</div>
        	<div>
				<input type="submit" value="제출"/>	
			</div>
        	<div>
				<input type="text" name="user_id" value="${userVO.user_id }"/>	
				<input type="text" name="cafe_id" value="${cafe_id}"/>	
			</div>  
        	
        </form><br><br><br><br><br>
        
        
        
        
        


    </body>
</html>