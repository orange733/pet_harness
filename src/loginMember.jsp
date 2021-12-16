<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css?after">
    <link rel="shortcut icon" href="images/dog.svg">
    <title>로그인</title>
</head>

<body>
    <div class="container">
        <header class="header">
            <a href="#none">
                <img src="">
            </a>
        </header>
        <section class="section">
        	<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<script> alert('아이디와 비밀번호를 확인해 주세요'); </script>");
				}
				
			%>
            <form action="processLoginMember.jsp" method="POST" class="loginForm">
                <h2>Login</h2>
                <div class="idForm">
                    <input type="text" placeholder="아이디" class="id" name="id" required autofocus/>
                </div>
                <div class="passForm">
                    <input type="password" placeholder="비밀번호" class="pw" name="password" required/>
                </div>
                <div class="login">
                    <div class="login-main">
	                    <button type="submit" class="butn">로그인</button>
	      		
	                    <span class="or-text">또는</span>
	                    <a href="#none" class="btn">구글로 로그인</a>
	                    <a href="#none" class="btn">네이버로 로그인</a>
	                </div>
	            
	                <div class="login-footer">
	                    <input type="checkbox" id="chk"> 
	                    <label for="chk">로그인 상태 유지</label>
	                    <p>
	                        iot harness가 처음이신가요? <a href="addMember.jsp">회원가입</a>
	                    </p>
	                    
	                    
	                </div>
	            </div>
	        </form>
        </section>
    </div>

</body>

</html>