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
            .graph_stack{
                width:400px;
                height:50px;
                background-color: #D8D8D8;
                box-sizing: border-box;
                border-radius: 40px;
                line-height: 50px;
                position: relative;
                left:65px;
            }

            .graph_rate{
                text-align: right;
                height:100%;
                background-color: #4B610B;
                box-sizing: border-box;
                border-radius: 40px;
                line-height: 50px;
                width:320px;
            }

            .graph_text{
                float: right;
                position: relative;
                z-index: 110;
            }
            .graph_logo{
                height: 100px;
                float: left;
                position: relative;
                z-index: 100;
                bottom: 30px;
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
                color: #FFFFFF;
            }


        </style>
    	<script type="text/javascript">
    	  
    	
    	
	    	$(function(){
			    $('.bean_img').draggable();
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
                <div class="graph_rate">
                    <img src="img/bean.PNG" class="bean_img">
                    <div class="graph_text">10점</div>
                </div>
            </div>
        </div>
        
        
        
        
        <!-- <form action="registReview.do" method="post">
        	<div>
				<label for = "cafe_id">카페 아이디: </label>
				<input type="text" name="cafe_id" id="cafe_id"/>	
			</div>
        	<div>
				<label for = "cafe_id">카페 아이디: </label>
				<input type="text" name="cafe_id" id="cafe_id"/>	
			</div>
        	<div>
				<label for = "cafe_id">카페 아이디: </label>
				<input type="text" name="cafe_id" id="cafe_id"/>	
			</div>
        	<div>
				<label for = "cafe_id">카페 아이디: </label>
				<input type="text" name="cafe_id" id="cafe_id"/>	
			</div>
        	<div>
				<label for = "cafe_id">카페 아이디: </label>
				<input type="text" name="cafe_id" id="cafe_id"/>	
			</div>
        	<div>
				<label for = "cafe_id">카페 아이디: </label>
				<input type="text" name="cafe_id" id="cafe_id"/>	
			</div>
        	<div>
				<label for = "cafe_id">카페 아이디: </label>
				<input type="text" name="cafe_id" id="cafe_id"/>	
			</div>
        	<div>
				<label for = "cafe_id">카페 아이디: </label>
				<input type="text" name="cafe_id" id="cafe_id"/>	
			</div>
        	<div>
				<label for = "cafe_id">카페 아이디: </label>
				<input type="text" name="cafe_id" id="cafe_id"/>	
			</div>
        
        </form><br><br><br><br><br> -->
        
        
        
        
        


    </body>
</html>