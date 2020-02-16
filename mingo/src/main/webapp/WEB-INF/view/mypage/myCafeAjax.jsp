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
		.collect_cafe_each{
			width:100%;
			height:200px;
			box-sizing: border-box;
			border:1px solid #D8D8D8;
			padding:10px;  
		}
		.collect_cafe_logo{
			width:25%;
			height:100%;
			  
			float:left;
		}
		.collect_cafe_logo img{
			height:100%;
		}
		
		
		.collect_cafe_info{
			float:left;
			height:100%;  
			width:75%;
			box-sizing: border-box;
			padding-left:20px;   
			
		}
		
		.collect_cafe_info_header{
			line-height:60px;
			height:30%;  
			width:95%;   
			border-bottom:1px solid #D8D8D8;  
		}
		
		.collect_cafe_info_header div{
			float:left;
			height:100%;
		}
		.collect_cafe_title{
			font-size: 1.8em;
			font-weight: bold;
			color:#2E2E2E;
		}
		.collect_cafe_star img{
			width:40px;
		}
		.collect_cafe_avgRate{
			font-size: 1.5em;
			font-weight: bold;
			color:#2E2E2E;
		
		}
		.collect_cafe_info_header{
			padding-bottom:10px; 
			height:60px;   
		}
		.collect_cafe_info_content{
			height:70%;
			padding-top:20px;
		}
		
		.collect_cafe_address {
			font-size:1.2em;   
			height:20%;
			margin-bottom:10px;  
			
		}
		.collect_cafe_eachRate{
			height:80%;
			
		}
		.each_rate{
			width:170px;
			height:35px;
			padding:5px;
			float:left;
			
		}
		.each_rate div{  
			line-height: 25px;   	
			float:left;
		}
		
		
		.collect_graphic{
			position:relative;
			width:110px;  
			height:25px;
			line-height: 25px;          	
		}
		.collect_graphic div{
		}
		
		.bar_total{
			position:absolute;
			transform: translateY(-50%);
			top:50%;
			width:100px;
			height:10px;
			background-color: #D8D8D8;
			border-radius: 7px;
			margin:auto;
		}
		.bar_rate{
			width:70%;  
			height:10px;
			background-color: #FFBF00;
			border-radius: 7px;
		}
		
		.collect_img img{
			position:relative;
			bottom:2px; 
			right:2px;
			width:15px;
			z-index: 10;
		}
		.rate{
			font-size: 0.8em;
			font-weight: bold;
		}
		
		.review_navi_nums{
			width:100%;
			height:100px;
			padding-top:40px;
		}
		  
		.review_navi_nums > div{
			line-height:60px;
			height:60px;
			width:100%;
			
			/* margin:0 auto;
			padding:0 auto; */  
			/* line-height: 200px; */
			text-align:center;  
		}      
		
		.review_navi_nums a{
			margin:0 20px;
		
		}
	
	</style>
	
	<script>
		$(document).ready(function(){
			
		
			
			
		});
	
	
	
	</script>
	
	
	
</head>

<body>
    
            
            <div class="collect_cafes">
            	<div class="collect_cafe_each" OnClick="location.href='detailView.do?cafe_id=${cafe.cafe_id}&user_id=${userVO.user_id}'">
            		<div class="collect_cafe_logo">  
            			<img src="./img/brandLogo/${cafe.logo }" style="border:1px solid #E6E6E6;border-radius: 100%;">
            		</div>
            		<div class="collect_cafe_info">
            			<div class="collect_cafe_info_header">
            				<div class="collect_cafe_title">${cafe.name }&nbsp${cafe.branch }&nbsp</div>
            				<div class="collect_cafe_star">
            					<img src="img/star_colored.png">
            				</div>
            				<div class="collect_cafe_avgRate">${cafe.rate_avg }</div>
            			</div>
            			<div class="collect_cafe_info_content">
            				<div class="collect_cafe_address">${cafe.cafe_address }</div>
            				<div class="collect_cafe_eachRate">
            					<div class="each_rate" id="collect_menu">
            						<div class="collect_img">
            							<img src="img/price.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate" style="width:${cafeRate.price_avg*20 }px;"></div>
            								<div class="bean_img">
            									<img src="">  
            								</div>
            							</div>
            						</div>
            						<div class="rate">${cafeRate.price_avg }</div>
            					</div>
            					<div class="each_rate" id="collect_price">
            						<div class="collect_img">
            							<img src="img/taste.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate" style="width:${cafeRate.taste_avg*20 }px;"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">${cafeRate.taste_avg }</div>
            					</div>
            					<div class="each_rate" id="collect_wifiplug">
            						<div class="collect_img">
            							<img src="img/mood.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate" style="width:${cafeRate.mood_avg*20 }px;"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">${cafeRate.mood_avg }</div>
            					</div>
            					<div class="each_rate" id="collect_service">
            						<div class="collect_img">
            							<img src="img/service.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate" style="width:${cafeRate.service_avg*20 }px;"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">${cafeRate.service_avg }</div>
            					</div>
            					<div class="each_rate" id="collect_facility">
            						<div class="collect_img">
            							<img src="img/wifi.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate" style="width:${cafeRate.wifi_avg*20 }px;"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">${cafeRate.wifi_avg }</div>
            					</div>
            					<div class="each_rate" id="collect_product">
            						<div class="collect_img">
            							<img src="img/clean.png">
            						</div>
            						<div class="collect_graphic">
            							<div class="bar_total">
            								<div class="bar_rate" style="width:${cafeRate.clean_avg*20 }px;"></div>
            								<div class="bean_img">
            									<img src="">
            								</div>
            							</div>
            						</div>
            						<div class="rate">${cafeRate.clean_avg }</div>
            					</div>
            				</div>
            			</div>
            		</div>
            	</div>
            </div>            
       
</body>

</html>