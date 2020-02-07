<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>jQuery UI Draggable - Constrain movement</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<style>
	.draggable { width: 90px; height: 90px; padding: 0.5em; float: left; margin: 0 10px 10px 0; }
	#draggable, #draggable2 { margin-bottom:20px; }
	#draggable { cursor: n-resize; }
	#draggable2 { cursor: e-resize; }
	#containment-wrapper { width: 95%; height:150px; border:2px solid #ccc; padding: 10px; }
	h3 { clear: left; }
	</style>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script>
		$(function(){
		 
		  $("#draggable3").draggable({ containment: "#containment-wrapper", scroll: false });
		  
		});
	</script>
</head>
<body>



<div id="containment-wrapper">
	<div id="draggable3" class="draggable ui-widget-content">
		<p>I'm contained within the box</p>
	</div>
 
</div>
 
 
</body>
</html>