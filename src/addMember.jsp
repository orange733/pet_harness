<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/add.css?after">
    <link rel="shortcut icon" href="images/dog.svg">
    <title>회원가입</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>

    <div class="container">
        <header class="header">
            <a href="#none">
                <img src="">
            </a>
        </header>
        <section class="section">
            <form action="processAddMember.jsp" method="POST" class="loginForm" onsubmit="return checkForm()">
                <h2>Login</h2>
                <div class="idForm">
                    <input type="text" placeholder="아이디" name="id" class="id"/>
                </div>
                <div class="passForm">
                    <input type="password" placeholder="비밀번호" name="password" class="pw"/>
                </div>
                <div class="passForm">
                    <input type="password" placeholder="비밀번호확인" name="password_confirm" class="pw"/>
                </div>
                <div class="idForm">
                    <input type="text" placeholder="성명" name="name" class="id"/>
                </div>
                <div class="idForm">
                    <input type="text" placeholder="전화번호" name="phone" class="id"/>
                </div>
                <div class="login">
                    <div class="login-main">
	                    <button type="submit" class="butn">회원가입</button>
	                </div>
	            </div>
	        </form>
        </section>
    </div>

</body>

</html>