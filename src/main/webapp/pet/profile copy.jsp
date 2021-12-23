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
<script>
    function formSubmit()
    {
    document.getElementById("frm1").submit();
    }
</script>
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
		String photo="dog2.PNG";
		String age = "";
		String weight ="";
		String message="";
		
		
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
				age = rs.getString("age");
				weight = rs.getString("weight");
				message = rs.getString("message");
			}
			
			request.setAttribute("name", name);
			request.setAttribute("sex", sex);
			request.setAttribute("age", age);
			request.setAttribute("weight", weight);
			request.setAttribute("message", message);
			
		}catch (SQLException ex){
			
		}finally{
			if (pstmt!=null)
				pstmt.close();
			
		}
		
		ResultSet rt = null;
		PreparedStatement pstms = null;
		try{
			String sql="select * from photo where owner_id='"+ownerId+"'";
			pstms=conn.prepareStatement(sql);
			rt = pstms.executeQuery();
			
			if (!rt.next()){
				
			} else{
				if(rt.getString("photo")!=null){
					photo = rt.getString("photo");
				}
				
			}
			request.setAttribute("photo", photo);
		}catch (SQLException ex){
			
		}finally{
			if (pstms!=null)
				pstms.close();
			if (conn!=null)
				conn.close();
		}
			
			
        %>
        <section class="section">
	        <form action="processAddProfile.jsp" id="frm1" method="POST" class="loginForm" onsubmit="return checkForm()" enctype="multipart/form-data">
	            <h2>프로필</h2>
	            
	                <div id=photoplace>
	           <img src="${pageContext.request.contextPath}/upload/${photo}" style="width:400px; height:200px;">
	            </div>
	            
	            <br>
        		<input type="file" id="filebutton" name="photo" id="photo">
	            <br>
	            <b>이름 : </b><input type="text" name="name" class="name" value="<%=name %>" >
	            <br>
	            <b> 성별 : </b><input type="text" name="sex" class="sex" value="<%=sex %>">
	            <br>
	            <b> 나이 : </b><input type="text" name="age" class="age" value="<%=age %>">
	            <br>
	            <b> 체중 : </b><input type="text" name="weight" class="weight" value="<%=weight %>">
	            <br>
	            <br>특이사항 : <textarea class="message" name="message" cols=27 rows=3>${message }</textarea>
	            <br>
	            <br>
	            <a href="#" class="btn" onclick="formSubmit();return false;">수정
	            </a>
	            <br>
	            </form>
    	</section>
	</div>          
</body>