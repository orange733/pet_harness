<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	request.setCharacterEncoding("UTF-8");

	String Id = (String) session.getAttribute("sessionId");

	String date1 = request.getParameter("date1");
	String date2 = request.getParameter("date2");
	String date3 = request.getParameter("date3");
	String date4 = request.getParameter("date4");

	Date currentDatetime = new Date(System.currentTimeMillis());
	java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
	java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/chatdb"
	driver="com.mysql.cj.jdbc.Driver" user="root" password="root" />

<sql:update dataSource="${dataSource}" var="1">
	delete from date where owner_id=? 
	<sql:param value="<%=Id%>" />
</sql:update>
<sql:update dataSource="${dataSource}" var="resultSet">
	insert into date(date1, date2, date3, date4, owner_id) values (?, ?, ?, ?, ?)
	<sql:param value="<%=date1%>" />
	<sql:param value="<%=date2%>" />
	<sql:param value="<%=date3%>" />
	<sql:param value="<%=date4%>" />
	<sql:param value="<%=Id%>" />
</sql:update>



<c:if test="${resultSet>=1}">
	<c:redirect url="dday.jsp" />
</c:if>
