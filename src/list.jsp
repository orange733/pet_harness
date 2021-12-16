<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/list.css?after">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/dog.svg">
    <title>목록</title>
</head>

<body>

    <div class="container">
        <header class="header">
            <a href="#none">
                <img src="">
            </a>
        </header>
        <section class="section">
            <form action="/login" method="POST" class="loginForm">
                <h2>목록</h2>
                <a href="${pageContext.request.contextPath}/pet/profile.jsp">                    
                <img src="${pageContext.request.contextPath}/resources/images/dog.svg">
                <br>
                <a href="dday.html">
                <img src="${pageContext.request.contextPath}/resources/images/달력.svg">
                <br>
                <a href="${pageContext.request.contextPath}/led.jsp">
                <img src="${pageContext.request.contextPath}/resources/images/led.svg">
                <br>
                <a href="${pageContext.request.contextPath}/location.jsp"> 
                <img src="${pageContext.request.contextPath}/resources/images/위치.svg">
                <br>
                <a href="${pageContext.request.contextPath}/chat.jsp"> 
                <img src="${pageContext.request.contextPath}/resources/images/메시지.svg">
</body>
</html>