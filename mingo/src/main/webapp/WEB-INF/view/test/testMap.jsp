<%@page import="java.text.SimpleDateFormat"%>
<%@page import="test.TestVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<html>
<head>  
	<meta charset="utf-8"/>
	<title>Kakao 지도 시작하기</title>
</head>
<body>
	<div>
		<div>
			<div id="map" style="width:500px;height:400px;"></div>
		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=197a1366c7c3fbd3d1f4e49445d212b0"></script>
	<script>  
	
		
		/* var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(34.40418471388889, 129.66037169722222),
			
			level: 3
		}; */
	
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>     

















