<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
    <meta>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profile.css?after">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/dog.svg">
    <title>프로필</title>
</head>

<body>
	<%@ include file="dbconn.jsp" %>
    <div class="container">
        <header class="header">
            <a href="#none">
                <img src="">
            </a>
        </header>
    
        <%
        
            String ownerId = (String) session.getAttribute("sessionId");
			String name = "";
			String sex = "";
			int age = 0;
			int weight =0;
			
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			
			try{
				String sql="select * from pet where owner_id='"+ownerId+"'";
				pstmt=conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if (!rs.next()){
					
				} else{
					name = rs.getString("name");
					sex = rs.getString("sex");
					age = rs.getInt("age");
					weight = rs.getInt("weight");
				}
				
				request.setAttribute("name", name);
				request.setAttribute("sex", sex);
				request.setAttribute("age", age);
				request.setAttribute("weight", weight);
				
			}catch (SQLException ex){
				
			}finally{
				if (pstmt!=null)
					pstmt.close();
				if (conn!=null)
					conn.close();
			}
			
        %>
        <section class="section">
	        <form action="/login" method="POST" class="loginForm">
	            <h2>프로필</h2>
	            <button class="image">
	                <br>
	                <img src="${pageContext.request.contextPath}/resources/images/dog.svg">
	                <br>
	                프로필 사진
	                <br>
	                <br>
	                <br>
	                <br>
	            </button>
	            <br>
	            <b>이름 : </b><input type="text" name="이름" value=${name }>
	            <br>
	            <b> 성별 : </b><input type="text" name="성별" value=${sex }>
	            <br>
	            <b> 나이 : </b><input type="text" name="성별" value=${age }>
	            <br>
	            <b> 체중 : </b><input type="text" name="성별" value=${weight }>
	            <br>
	            <br>
	            <br>
	            <br>
	            <a href="profile copy.html" class="btn">수정</a>
    	</section>
	</div>          
</body>