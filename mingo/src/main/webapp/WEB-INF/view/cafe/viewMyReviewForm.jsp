<%@page import="util.Property"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail information page about each cafe</title>

<!--부트 스트랩 관련 파일-->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 	<link rel="stylesheet" href="/resources/demos/style.css">

<!-- 헤더파일들 include -->
<%@ include file="/WEB-INF/view/include/headHTML.jsp"%>

<!-- 폰트 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>

<!-- jquery ui -->

   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<style>
		/* 내 평가 보기 및 등록 */
		.my_review{display: none;}
		.graph_name2{width:100px;float:left;}
		.graph_area2{height:120px;width:450px;}
	    .graph_stack2{float:left;width:332px;height:40px;background-color: #D8D8D8;box-sizing: border-box;border-radius: 35px;line-height: 40px;/* position: relative;left:60px;   */}   
	    .graph_rate2{text-align: center;height:100%;background-color: #6d512f;box-sizing: border-box;border-radius: 35px;line-height: 40px;float: left;}
	    .graph_logo2{height: 80px;float: left;position: relative;z-index: 100;bottom: 25px;}
	    .bean_img2{height:30px;float: right;padding-left: 0px;position: relative;/* left:25px;bottom:10px; */ z-index: 200;line-height: 40px;margin:5px;}
	    .graph_text2{width:80px;text-align:center;font-size: 1.2em;font-weight: bold;color: #FFFFFF;float: right;}
	    .rate_visual_total2{height:auto;overflow:hidden;width:100%;}   
	    info22{height:100px;}   
		.rate_info22{height:120px;padding:30px 0px;}  
		.rate_each22{float: left;width: 470px;height:120px;}
		.cafe_rates22{height:500px;width:100%;}
		.rate_info22 .rate_num2{float:left;margin-right:20px;font-size: 1.5em;}
	</style>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=197a1366c7c3fbd3d1f4e49445d212b0"></script>
	
	
	<script>
		$(function(){
			
			// 종합평점 그래프 점수 동적화
			var wifi_width = (${reviewVO.wifi_score }/5)*300+32;
			$('#wifi-width2').css({
				'width':wifi_width
			}); 
			if (${reviewVO.wifi_score }<1.5){
				$('.graph_text').remove('#wifi-text2');  
				$('#wifi-width2').parent().append('<div class="graph_text" id="wifi-text2">${reviewVO.wifi_score }점</div>');
				$('#wifi-text2').css({
					'color':'#1C1C1C',
					'float':'left'
				});
			}
			var mood_width = (${reviewVO.mood_score }/5)*300+32;
			$('#mood-width2').css({
				'width':mood_width
			});
			if (${reviewVO.mood_score }<2){
				$('.graph_text').remove('#mood-text2');  
				$('#mood-width2').parent().append('<div class="graph_text" id="mood-text2">${reviewVO.mood_score }점</div>');
				$('#mood-text2').css({
					'color':'#1C1C1C',
					'float':'left'
				});
			}
			var service_width = (${reviewVO.service_score }/5)*300+32;
			$('#service-width2').css({
				'width':service_width
			});
			if (${reviewVO.service_score }<2){
				$('.graph_text').remove('#service-text2');  
				$('#service-width2').parent().append('<div class="graph_text" id="service-text2">${reviewVO.service_score }점</div>');
				$('#service-text2').css({
					'color':'#1C1C1C',
					'float':'left'
				});
			}
			var taste_width = (${reviewVO.taste_score }/5)*300+32;
			$('#taste-width2').css({
				'width':taste_width
			});
			if (${reviewVO.taste_score }<2){
				$('.graph_text').remove('#taste-text2');  
				$('#taste-width2').parent().append('<div class="graph_text" id="taste-text2">${reviewVO.taste_score }점</div>');
				$('#taste-text2').css({
					'color':'#1C1C1C',
					'float':'left'
				});
			}
			var price_width = (${reviewVO.price_score }/5)*300+32;
			$('#price-width2').css({
				'width':price_width
			});
			if (${reviewVO.price_score }<2){
				$('.graph_text').remove('#price-text2');  
				$('#price-width2').parent().append('<div class="graph_text" id="price-text2">${reviewVO.price_score }점</div>');
				$('#price-text2').css({
					'color':'#1C1C1C',
					'float':'left'
				});
			}
			var clean_width = (${reviewVO.clean_score }/5)*300+32;
			$('#clean-width2').css({
				'width':clean_width
			});
			if (${reviewVO.clean_score }<2){
				$('.graph_text').remove('#clean-text2');  
				$('#clean-width2').parent().append('<div class="graph_text" id="clean-text2">${reviewVO.clean_score }점</div>');
				$('#clean-text2').css({
					'color':'#1C1C1C',
					'float':'left'
				});
			}  
			
		});
	</script>

</head>
<body>		
	<div class="cafe_rates2">
		<div class="rate_info22">
			<div class="info22">
				<div class="rate_avg">
					<img src="img/star_colored.png" id="star_shape2">
					<div class="rate_num2">평균 ${reviewVO.score_avg }점</div>
					
				</div>
			</div>	
		</div>
		<div class="rate_visual_total2">
			<div class="rate_each22">
				<div class="rate_visual2" id="taste_visual_tatal2">
					<div class="graph_area2">
			            <div>
			                <img src="img/taste.png" class="graph_logo2">
			            </div>
			            <div class="graph_stack2">
			                <div class="graph_rate2" id="taste-width2">
			                    <img src="img/bean.PNG" class="bean_img2">
			                    <div class="graph_text" id="taste-text2">${reviewVO.taste_score }점</div>
			                </div>
			            </div>
			        </div>
				</div>
				<div class="rate_name2" id="taste_name_tatal2"></div>
			</div>
			<div class="rate_each22">
				<div class="rate_visual2" id="price_visual_tatal2">
					<div class="graph_area2">
			            <div>
			                <img src="img/mood.png" class="graph_logo2">
			            </div>
			            <div class="graph_stack2">
			                <div class="graph_rate2" id="mood-width2">
			                    <img src="img/bean.PNG" class="bean_img2">
			                    <div class="graph_text2" id="mood-text2">${reviewVO.mood_score }점</div>
			                </div>
			            </div>
			        </div>
				</div>
				<div class="rate_name2" id="price_name_tatal2"></div>
			</div>
			<div class="rate_each22">
				<div class="rate_visual2" id="service_visual_tatal2">
					<div class="graph_area2">
			            <div>
			                <img src="img/service.png" class="graph_logo2">
			            </div>
			            <div class="graph_stack2">
			                <div class="graph_rate2" id="service-width2">
			                    <img src="img/bean.PNG" class="bean_img2">
			                    <div class="graph_text2" id="service-text2">${reviewVO.service_score }점</div>
			                </div>
			            </div>
			        </div>
				</div>
				<div class="rate_name2" id="service_name_tatal2"></div>
			</div>
			<div class="rate_each22">
				<div class="rate_visual2" id="facimood_visual_tatal2">
					<div class="graph_area2">
			            <div>
			                <img src="img/wifi.png" class="graph_logo2">
			            </div>
			            <div class="graph_stack2">
			                <div class="graph_rate2" id="wifi-width2">
			                    <img src="img/bean.PNG" class="bean_img2">
			                    <div class="graph_text2" id="wifi-text2">${reviewVO.wifi_score }점</div>
			                </div>
			            </div>
			        </div>
				</div>
				<div class="rate_name2" id="facimood_name_tatal2"></div>
			</div>
			<div class="rate_each22">
				<div class="rate_visual2" id="wifiplug_visual_tatal2">
					<div class="graph_area2">
			            <div>
			                <img src="img/clean.png" class="graph_logo2">
			            </div>
			            <div class="graph_stack2">
			                <div class="graph_rate2" id="clean-width2">
			                    <img src="img/bean.PNG" class="bean_img2">
			                    <div class="graph_text2" id="clean-text2">${reviewVO.clean_score }점</div>
			                </div>
			            </div>
			        </div>
				</div>
				<div class="rate_name2" id="wifiplug_name_tatal2"></div>
			</div>
			<div class="rate_each22">
				<div class="rate_visual2" id="clean_visual_tatal2">
					<div class="graph_area2">
			            <div>
			                <img src="img/price.png" class="graph_logo2">
			            </div>
			            <div class="graph_stack2">
			                <div class="graph_rate2" id="price-width2">
			                    <img src="img/bean.PNG" class="bean_img2">
			                    <div class="graph_text2" id="price-text2">${reviewVO.price_score }점</div>
			                </div>
			            </div>
			        </div>  
				</div>  
				<div class="rate_name2" id="clean_name_tatal2"></div>
			</div>
		</div>
	</div>
				
			
</body>
</html>