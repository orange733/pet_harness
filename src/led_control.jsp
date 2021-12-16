<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="socket" class="socket.LED_Socket" scope="request"/>
<%
	int control = Integer.valueOf(request.getParameter("control"));
	String status="";
	String test="";
	
	if(control ==1){
		status="on";
		socket.led_on();
		out.println(status);
	}
	else if(control==0){
		status="off";
		socket.led_off();
		out.println(status);
	}
	else if(control==3){
		//status="41.40338,2.17403";
	// test의 형식은 status 처럼 들어가야함
		
		test = socket.gps();
		
		out.print(test);
	}
%>