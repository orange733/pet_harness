<%@ page import="java.sql.*"%>

<%
	Connection conn=null;

	String url = "jdbc:mysql://localhost:3306/chatdb";
	String user="root";
	String password ="root";

	Class.forName("com.mysql.cj.jdbc.Driver");
	conn=DriverManager.getConnection(url, user, password);
%>