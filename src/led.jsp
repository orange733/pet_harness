<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="led.css">
    <link rel="shortcut icon" href="images/dog.svg">
    <title>LED</title>
</head>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#control_on").click(()=>{
			$.ajax({
		        type : "GET",
		        url : "./led_control.jsp?&control=1", 
		        dataType : "text",
		        error : function(){
		          	alert('통신실패!!');
		        },
		        success : function(data){
		        	$("#Parse_Area").html(data);
		            alert(data);
		        }
			})
		});
	});
	$(document).ready(function(){
		$("#control_off").click(()=>{
			$.ajax({
		        type : "GET",
		        url : "./led_control.jsp?&control=0", 
		        dataType : "text",
		        error : function(){
		            alert('통신실패!!');
		        },
		        success : function(data){
		        	$("#Parse_Area").html(data);
		            alert(data) ;
		        }
			})
		});
	});
</script>

<body>
    <div class="container">
        <header class="header">
            <a href="#none">
                <img src="">
            </a>
        </header>
     </div>
        <section class="section">
            <form action="/login" method="POST" class="loginForm">
                <br>
                <br>
                <br>
                <img src="images/led.svg">
                <br>
                <br>
                <br>
                <br>
                <input type="button" id="control_on" value="LED ON" class= "btn"/>
				<input type="button" id="control_off" value="LED OFF" class="btn" />
           </form>
        </section>
</body>
</html>