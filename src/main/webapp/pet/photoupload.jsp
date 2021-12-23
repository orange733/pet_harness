<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	String ownerId = (String) session.getAttribute("sessionId");
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	String filename="";
	int sizeLimit=15*1024*1024;
	
	String realPath=request.getServletContext().getRealPath("upload");
	File dir=new File(realPath);
	if(!dir.exists()) dir.mkdirs();
	
	MultipartRequest multipartRequest=null;
	multipartRequest=new MultipartRequest(request,realPath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
	filename=multipartRequest.getFilesystemName("photo");
	
 %>

 <sql:setDataSource var="dataSource"
		url="jdbc:mysql://localhost:3306/chatdb"
		driver="com.mysql.cj.jdbc.Driver" user="root" password="root" />

	<sql:update dataSource="${dataSource}" var="resultSet">
	insert into pet (photo,owner_id) values (?, ?);
		<sql:param value="<%=id%>" />
		<sql:param value="<%=filename %>" />
	</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="profile.jsp?msg=1" />
</c:if>
