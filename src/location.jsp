<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./location.css">
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<link rel="stylesheet" type="text/css" href="./style.css" />
<script src="./index.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script>
var repeat = function(){$.ajax({
    type : "GET",
    url : "./led_control.jsp?&control=3", 
    dataType : "text",
    error : function(){
      	alert('통신실패!!');
    },
    success : function(data){
    	$("#Parse_Area").html(data);
    	let location = data.trim().split(',');
    	const uluru = { lat: 0, lng: 0 }
    	uluru.lat = Number(location[0]);
    	uluru.lng = Number(location[1]);
    	initMap(uluru);
    }
});
}
$(document).ready(function(){
	$("#control_on").click(()=>{
		$.ajax({
	        type : "GET",
	        url : "./led_control.jsp?&control=3", 
	        dataType : "text",
	        error : function(){
	          	alert('통신실패!!');
	        },
	        success : function(data){
	        	$("#Parse_Area").html(data);
	        	let location = data.trim().split(',');
	        	const uluru = { lat: 0, lng: 0 }
	        	uluru.lat = Number(location[0]);
	        	uluru.lng = Number(location[1]);
	        	initMap(uluru);
	        	setInterval(repeat,10000);
	        }
		})
	});
});
</script>
<title>위치</title>
</head>
<body>
	<section class="section">
		<form class="loginForm">
			<h2>위치</h2>
			<div id="map"></div>
			<input type="button" id="control_on" value="위치 확인" class= "btn"/>
			<input type="button" id="control_off" value="산책시간 확인" class="btn" />
		</form>
	</section>
</body>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDo42glvWj8GPPNncAgLhOLuBd4RZK2II0&callback=initMap&libraries=&v=weekly"
	async></script>
</html>