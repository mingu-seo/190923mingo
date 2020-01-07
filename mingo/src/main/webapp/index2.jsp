<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>HTML5 Basic</title>
        <meta name="viewport" content="user-scalable=no, initial-scale=1">
        <script src="http://code.jquery.com/jquery-3.4.1.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="css/swiper.css"/>
        <link rel="stylesheet" href="css/reset.css"/>
        <script src="js/swiper.min.js"></script>
        <style>
            @import url('https://fonts.googleapis.com/css?family=Barlow+Semi+Condensed|Calistoga&display=swap');
            
            *{
                margin: 0;
                padding: 0;
                font-family: 'Calistoga', cursive;
                font-family: 'Barlow Semi Condensed', sans-serif;
            }
            
            a{
            	text-decoration: none;
            }
            
            .divPop{
            	position:absolute;
            	z-index:9999999;
            }
            
            .close{
            	text-align:right;
            	background-color: black;
            	color:white;
            	font-size: 1.5em;
            }
            
            .wrap{
                width: 1200px;
                margin: 0 auto;
            }
            div.header{
                height: 100px;
                width: 100%;
                
                margin: 0 auto;
                
            }
            .header{
                line-height: 100px;
                text-align: center;
                margin: auto;
                
                font-size: 2.0em;
                font-family: 'Calistoga', cursive;
                font-family: 'Barlow Semi Condensed', sans-serif;
                color: #3a4047;
                padding: 10px 0;
            }
            .header > .size{
            	
            }
            
            .size > .Logo{
            	position:relative;
            	float:left;
            	width:699px;
            	height: 100px;  
            	padding:auto 0;  
            		   
            }
            .size > .Logo > img{
            	float:right;
            	line-height: 100px; 
            	
            }
            
            .size > .login{
            	position:relative;
            	float:right;
            	z-index: 200;  	   
            }
            
            
            .login > a{
            	font-size: 18px;
            	font-weight: bold;
            
            }
            
            
            div.menu{
            	width: 100%;
                height: 40px;
                margin: 0 auto;
                z-index: 9998;
            }
            div.menu_button{   
                width: 25%;
                height: 100%;
                float: left;  
                background: #585858;
                text-align: center;
                /*box-sizing: border-box;*/
                margin: auto;
                color:#FFFFFF;
                font-family: 'Calistoga', cursive;
                font-family: 'Barlow Semi Condensed', sans-serif;
                line-height:40px;   
                z-index: 9998;                         
            }
            
            .menu_button:hover{
                background: indianred;  
                color: white;
                z-index: 9998;
            }
            
            .menu_inner_button > li:hover{
            	background: indianred;
            }
            
            
			.menu_inner_button > li{
				height:40px;   
				display:block;
				z-index: 9998;
            	/*display:block;*/

            }
            .menu_inner_button{
            	position: relative; 
            	/* height:120px; */
            	display: none;
            	z-index: 9998;
				background: #585858;
            	text-align: center;
            	width: 100%;
            }
            
            ul, li {
            	list-style:none;
            	z-index: 9998;
            }
            .menu_button > a{
            	z-index: 9998;
            	/* display:block; */
            }
			
			
			
            div.contents{
            	width: 100%;
            	padding: 30px 0;
                overflow: hidden;
                height: auto;
                
            }
            .contents > .size{
            	text-align : center;
            }
            .contents > .size > .section{
            	float:left;
            	width: 380px;
            	height:440px;
            }
            
            .section:nth-last-child(2), .section:nth-last-child(5){
            	margin:0 30px;
            }
            .section:nth-last-child(4), .section:nth-last-child(5), .section:nth-last-child(5){
            	margin-bottom:30px;  
            }
            
            
            
            .section > img{
            	
            	width: 380px;
            	height:440px;  
            }
            .section > img:hover{
            	border:10px solid #000;
            	width: 360px;
            	height:420px;  
            }
            
            .footer{
                
                height: 120px;
                background:#585858;
                float: left;
                font-size: 1.0em;
                font-weight:bold;
                color:#FFFFFF;
                padding:10px;
            }
            
            .footer > .size{
            	width:1180px;  
            	margin: 0 auto;	
            }
            
            .info{
            	width:70%;
            	float:left;
            }
            .info > p{
            	font-size: 1.5em;
            	margin: 10px;
            }
            
            
            .sns_area{
            	margin:10px;
            	width:13%;
            	float: right; 
            }
            
            
            
            /* .footer > .size > .sns_area{
            	float:right;  
            	
            } */
            
            .footer > .size > .info > p{
            	line-height: 22px;
            
            }  
            .sns_area > a{
            	margin: 10px;  
            }

            .visual{
            	
            }
            /* .visual > img{
            	display:block;
            } */
            .visual{
            	height:500px;
            	width:100%;
            	background-color: #c4c4c4;
            	clear:none;
            	/* position:relative; */
            	text-align: center; 
            	
            	/* visibility:hidden; */           	 
            }
             .visual .swiper{
            	height:500px
            	z-index: 10;
            }   
            
            .visual .swiper-slide{
            	height:500px;
            	background-position:center center;
            	background-repeat:no-repeat;
            	background-size:cover;
            	text-align: center; 
            	float:left;
            }
            
            .banner{
            	float: left;
            	width:1200px;
            	margin: 0 auto;
            	margin: 10px 0;
           
            }
            .banner .img{ 
            	height : 80px;
            	line-height : 80px;
            	text-align : center;
            	
            }
            .quick_menu{
            	position:absolute;
            	top:120px;
            	z-index: 9998;  
            }
            
            
            .notice{
            	float:left;
            	width:590PX;
            	height:500px;
            	border:1px solid #D8D8D8;
            }
            
         
            
            .notice_inner_box{
            	margin:10px;
            	width:100%;
            	height:100%;
            }
            
            .notice_header{ 
            	height:50px; 
            	width:570px;
            	position:relative;
            	border-bottom: 1px solid #D8D8D8;
            }
            .notice_content_button{
            	width:20%; 
            	height:49px;
            	border-bottom: ;
            	background-color: ;
            	margin-right: 10px;
            	float:left;
            }
            #notification{
            	background-color: #D8D8D8;
            	border-bottom: 1px solid #D8D8D8;
            }
            .notice_content_button > h2{
            	font-size:2.0em;
            	color:#2E2E2E;
            	line-height:49px;
            	text-align: center;
            }
            .notice_content{
            	height:79%;
            	width:570px;
            }
            
            .notice_content_each{
            	line-height:50px; 
            	height:50px;        
            	width:100%;
            	float:left;
            	border-bottom: 1px solid #D8D8D8;   
            }
            .notice_content_text{
            	color:#2E2E2E;
            	font-weight:bold;
            	font-size:1.5em;
            	height:100%;
            	float:left;
            	width:74%;
            	
            }
            .notice_content_date{
            	color:#2E2E2E;
            	font-weight:bold;
            	font-size:1.5em;
            	height:100%;
            	width:24%;
            	float:right;
            	text-align:right;
            	
            }
            #document_content{
            	display:none;
            }
            
            
            .youtube{
            	float:right;
            	width:590PX;
            	height:500px;
            	border:1px solid #D8D8D8;
            }
            
            .youtube > iframe{
            	height:100%;
            	width:100%;
            }
            
            
           
        </style>
        <script>
        	$(function(){     
        		$('.menu_button').on('mouseenter', function(){
        			$(this).find('.menu_inner_button').stop().slideDown(100);
        			$('menu_inner_button').css({
        				'z-index' : '9999'
        			});
        		}).on('mouseleave', function(){
        			$(this).find('.menu_inner_button').stop().slideUp(100);
        		});
        		
        		var swiper = new Swiper('.visual .swiper-container', {
                    cssMode: true,
                    loop : true,
                    navigation: {
                    nextEl: '.visual .swiper-button-next',
                    prevEl: '.visual .swiper-button-prev',
                    },
                    pagination: {
                    el: '.visual .swiper-pagination'
                    },
                    mousewheel: true,
                    keyboard: true,
                });   
        		var swiper = new Swiper('.banner .swiper-container', {
                    slidesPerView : 5,
                    loop : true,
                    autoplay : {
                    	delay : 2000,
                    	disableOnInteraction : false
                    	
                    }
                });   
        		
        		//팝업 화면 가운데 위치시키기
				var popTop = ($(window).height()-$('.divPop').outerHeight())/2 + $(window).scrollTop();
				var popLeft = ($(window).width()-$('.divPop').outerWidth())/2 + $(window).scrollLeft();
				console.log(popTop);
				console.log(popLeft);
				
        		$('.divPop').css({
        			'top' : popTop+'px',
        			'left' : popLeft+'px'
        		});
        		
        		$('.divPop > .close').click(function(){
        			$('.divPop').hide();
        		});
        		
        		$(function(){
        		    $('.divPop').draggable();
        		});  
        		
        		var quick_x = $('.menu_button:nth-child(1)').position().left + 1210;
        		
        		console.log(quick_x);  
        		$('.quick_menu').css({
        			'position' : 'absolute',
        			'left' : quick_x
        		});  
        		
        		$(window).scroll(function(){
        			var top_scroll = $(window).scrollTop()+120;
        			console.log(top_scroll);
        			$('.quick_menu').stop().animate({
        				top : top_scroll
        			}, 500);
        		});
        		
        		$(window).resize(function(){
        			console.log('hello');    
        			var quick_x = $('.menu_button:nth-child(1)').position().left + 1210;        			if(quick_x >= 1210){
        				$('.quick_menu').css({
                			'left' : quick_x
        				});
        			}  
        		});
        		
        		
        		$('goTop').click(function(){
        			$('html').animate({scrollTop:0}, 300);
        		});
        		
        		$('.notice_content_button').click(function(){
        			$(this).css({'background-color': 'transparent'});
        		});
        		
        		$('#document').click(function(){
        			$('.notice_content_button').css({
        				'border-bottom': 'none',
        				'background-color': 'transparent'
        			});
            		
        			$(this).css({
        				'border-bottom': '1px solid #D8D8D8',
                		'background-color': '1px solid #D8D8D8',
                		'color': '#2E2E2E'
        			});
        			$('#notification_content').css({
        				'display' : 'none'
        			});
        			$('#document_content').css({
        				'display' : 'inline',
        				'width' : '570px'
        			});
        			$('.notice_content_each').css({
        				'width' : '570px'
        			});
        		});
        		$('#notification').click(function(){
        			$('.notice_content_button').css({
        				'border-bottom': 'none',
        				'background-color': 'transparent'
        			});
        			$(this).css({
        				'border-bottom': '1px solid #D8D8D8',
                		'background-color': '1px solid #D8D8D8',
                		'color': '#2E2E2E'
        			});
        			$('#document_content').css({
        				'display' : 'none'
        			});
        			$('#notification_content').css({
        				'display' : 'inline',
        				'width' : '570px'
        			});
        			$('.notice_content_each').css({
        				'width' : '570px'
        			});
        		});
        		  
        		
        	}); 
        
        </script>
        
    </head>
    <body>
    	<div class="divPop">
    		<img src="img/event_popup.png">
    		<div class="close"><label>[닫기]&nbsp; </label></div>
    	</div>
        <div class="wrap">  
            <div class="header">
                <div class="size">
                	<div class="Logo"><img src="img/logo.png"></div>
                	<div class="login">
                		<a href="">로그인</a> |
                		<a href="">회원가입</a>
                	</div>
                </div>
            </div>
            <div class="menu">
                <div class="menu_button">
                	<div>
	                	<a href=""><h2>Models</h2></a>
	                	<ul class="menu_inner_button">
	                		<li><a href="">All models</a></li>
	                		
	                	</ul>
                	</div>
                </div>
                <div class="menu_button">
                	<div>
	                	<a href=""><h2>Company</h2></a>
	                	<ul class="menu_inner_button">
	                		<li><a href="">아우디코리아 소개</a></li>
	                		<li><a href="">아우디코리아 소식</a></li>
	                		<li><a href="">고객안내</a></li>
	                		<li><a href="">아우디 고객 인증 중고차</a></li>
	                		<li><a href="">전시장 찾기</a></li>
	                	</ul>
                	</div>
                </div>
                <div class="menu_button">
                	<div>
	                	<a href=""><h2>Audi Service</h2></a>
	                	<ul class="menu_inner_button">
	                		<li><a href="">아우디 서비스</a></li>
	                		<li><a href="">아우디 프로그램</a></li>
	                		<li><a href="">서비스센터</a></li>
	                		<li><a href="">고객지원센터</a></li>
	                		<li><a href="">아우디 순정부품</a></li>
	                		<li><a href="">서비스센터</a></li>
	                		<li><a href="">아우디 순정 엑세서리</a></li>
	                		<li><a href="">부품가격정보</a></li>
	                		<li><a href="">사설수리업체를 위한 권고사항</a></li>
	                	</ul>
                	</div>
                </div>
                <div class="menu_button">
                	<div>
	                	<a href=""><h2>Audi Experience</h2></a>
	                	<ul class="menu_inner_button">
	                		<li><a href="">아우디 브랜드 히스토리</a></li>
	                		<li><a href="">quattro 시스템</a></li>
	                		<li><a href="">Audi Connect</a></li>
	                		<li><a href="">Progress never stops</a></li>
	                		<li><a href="">More possibilities</a></li>
	                		<li><a href="">아우디 매거진</a></li>
	                	</ul>
                	</div>
                </div>
            </div>
            <div class="visual">
            	<div class="swiper swiper-container">
            		<div class="swiper-wrapper">
            			<div class="swiper-slide" style="background-image:url('img/visual1.png')"></div>
            			<div class="swiper-slide" style="background-image:url('img/visual2.png')"></div>
            			<div class="swiper-slide" style="background-image:url('img/visual3.png')"></div>
            			<div class="swiper-slide" style="background-image:url('img/visual4.png')"></div>
            		</div>
            		<div class="swiper-pagination"></div>
            		<div class="swiper-button-prev"></div>
            		<div class="swiper-button-next"></div>
            	</div>
            </div>
            <div class="contents">
                    <div class="size">
                    	<div class="section">
                    		<img src="img/section1_1.png">
                    	</div>
                    	<div class="section">
                    		<img src="img/section1_2.png">
                    	</div>
                    	<div class="section">
                    		<img src="img/section1_3.png">
                    	</div>
                    	<div class="section">
                    		<img src="img/section1_1.png">
                    	</div>
                    	<div class="section">
                    		<img src="img/section1_2.png">
                    	</div>
                    	<div class="section">
                    		<img src="img/section1_3.png">
                    	</div>
                    </div>
            </div>
            
            <div class="notice">
            	<div class="notice_inner_box">
	            	<div class="notice_header">
						<span class="notice_content_button" id="notification">
							<h2>공지사항</h2>
						</span>
						<span class="notice_content_button" id="document">
							<h2>자료실</h2>
						</span>            	
	            	</div>
					<div class="notice_content" id="notification_content">
						<div class="notice_content_each">
							<div class="notice_content_text">공지사항입니다.</div>
							<div class="notice_content_date">2019-01-01</div>
						</div>
						<div class="notice_content_each">
							<div class="notice_content_text">공지사항입니다.</div>
							<div class="notice_content_date">2019-01-01</div>
						</div>
						<div class="notice_content_each">
							<div class="notice_content_text">공지사항입니다.</div>
							<div class="notice_content_date">2019-01-01</div>
						</div>
						<div class="notice_content_each">
							<div class="notice_content_text">공지사항입니다.</div>
							<div class="notice_content_date">2019-01-01</div>
						</div>
						<div class="notice_content_each">
							<div class="notice_content_text">공지사항입니다.</div>
							<div class="notice_content_date">2019-01-01</div>
						</div>
						<div class="notice_content_each">
							<div class="notice_content_text">공지사항입니다.</div>
							<div class="notice_content_date">2019-01-01</div>
						</div>
						<div class="notice_content_each">
							<div class="notice_content_text">공지사항입니다.</div>
							<div class="notice_content_date">2019-01-01</div>
						</div>
						<div class="notice_content_each">
							<div class="notice_content_text">공지사항입니다.</div>
							<div class="notice_content_date">2019-01-01</div>
						</div>
					</div>
					<div class="notice_content" id="document_content">
						<div class="notice_content_each">
							<div class="notice_content_text">자료실입니다.</div>
							<div class="notice_content_date">2019-01-02</div>
						</div>
						<div class="notice_content_each">
							<div class="notice_content_text">자료실입니다.</div>
							<div class="notice_content_date">2019-01-02</div>
						</div>
						<div class="notice_content_each">
							<div class="notice_content_text">자료실입니다.</div>
							<div class="notice_content_date">2019-01-02</div>
						</div>
						<div class="notice_content_each">
							<div class="notice_content_text">자료실입니다.</div>
							<div class="notice_content_date">2019-01-02</div>
						</div>
						<div class="notice_content_each">
							<div class="notice_content_text">자료실입니다.</div>
							<div class="notice_content_date">2019-01-02</div>
						</div>
						<div class="notice_content_each">
							<div class="notice_content_text">자료실입니다.</div>
							<div class="notice_content_date">2019-01-02</div>
						</div>
						<div class="notice_content_each">
							<div class="notice_content_text">자료실입니다.</div>
							<div class="notice_content_date">2019-01-02</div>
						</div>
						<div class="notice_content_each">
							<div class="notice_content_text">자료실입니다.</div>
							<div class="notice_content_date">2019-01-02</div>
						</div>
					</div>
            	</div>
			</div>
            
            <div class="youtube">
            	<iframe src="https://www.youtube.com/embed/FNMOf8tlOVM"></iframe>
            </div>
            
            <div class="banner">
            	<div class="swiper-container">
            		<div class="swiper-wrapper">
            			<div class="swiper-slide">
            				<div class="img">
	            				<img src="img/partner_1.png">
            				</div>
            			</div>
            			<div class="swiper-slide">
            				<div class="img">
	            				<img src="img/partner_2.png">
            				</div>
            			</div>
            			<div class="swiper-slide">
            				<div class="img">
	            				<img src="img/partner_3.png">
            				</div>
            			</div>
            			<div class="swiper-slide">
            				<div class="img">
	            				<img src="img/partner_4.png">
            				</div>
            			</div>
            			<div class="swiper-slide">
            				<div class="img">
	            				<img src="img/partner_5.png">
            				</div>
            			</div>  
            		</div>
            	</div>
            </div>
            
            
            <div class="footer">
                <div class="size">
                	<div class="info">
                		<p>Goodee Academy</p>
                		<p>jsj@goodee.co.kr</p>  
                		<p>tel) 02-1234-5679  |  fax) 02-1234-5679</p>
                	</div>
                	<div class="sns_area">  
                		<a href=""><img src="img/facebook_ico.png"></a>
                		<a href=""><img src="img/insta_ico.png"></a>
                		<a href=""><img src="img/blog_ico.png"></a>
                	</div>
                </div>
            </div>
            <div class="quick_menu">  
            	<div> 
            		<img src="img/quick_01.jpg"><br>
            		<img src="img/quick_02.jpg"><br>
            		<img src="img/quick_03.jpg"><br>
            		<img src="img/quick_04.jpg"><br>
            		<a href="javascript:;" class="goTop"><img src="img/quick_05.jpg"></a>
            	</div>
            
            </div>
            
        </div>
    </body>
</html>