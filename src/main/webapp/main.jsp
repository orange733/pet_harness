<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="socket" class="socket.LED_Socket" scope="request"/>
<%
	socket.connect();
%>
