<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("UTF-8");

	String Id = (String) session.getAttribute("sessionId");

	

	Date currentDatetime = new Date(System.currentTimeMillis());
	
	java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
	java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
	String filename="";
	int sizeLimit=15*1024*1024;
	
	String realPath=request.getServletContext().getRealPath("upload");
	File dir=new File(realPath);
	if(!dir.exists()) dir.mkdirs();
	
	MultipartRequest multipartRequest=null;
	multipartRequest=new MultipartRequest(request,realPath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
	filename=multipartRequest.getFilesystemName("photo");
	String name = multipartRequest.getParameter("name");
	String sex = multipartRequest.getParameter("sex");
	String age = multipartRequest.getParameter("age");
	String weight = multipartRequest.getParameter("weight");
	String message = multipartRequest.getParameter("message");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/chatdb"
	driver="com.mysql.cj.jdbc.Driver" user="root" password="root" />

<sql:update dataSource="${dataSource}" var="1">
	delete from photo where owner_id=? 
	<sql:param value="<%=Id%>" />
</sql:update>

<sql:update dataSource="${dataSource}" var="2">
	insert into photo (photo,owner_id) values (?, ?)
		<sql:param value="<%=filename %>" />
		<sql:param value="<%=Id%>" />
	</sql:update>

<sql:update dataSource="${dataSource}" var="3">
	delete from pet where owner_id=? 
	<sql:param value="<%=Id%>" />
</sql:update>
<sql:update dataSource="${dataSource}" var="resultSet">
	insert into pet(name, sex, age, weight, message, owner_id) values (?, ?, ?, ?, ?, ?)
	<sql:param value="<%=name%>" />
	<sql:param value="<%=sex%>" />
	<sql:param value="<%=age%>" />
	<sql:param value="<%=weight%>" />
	<sql:param value="<%=message%>" />
	<sql:param value="<%=Id%>" />
</sql:update>



<c:if test="${resultSet>=1}">
	<c:redirect url="profile.jsp" />
</c:if>
