<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css?after" />
<title>회원 정보</title>
</head>
<body>
	<div align="center">
		<%
			String msg = request.getParameter("msg");

			if (msg != null) {
				if (msg.equals("0"))
					out.println("");
				else if (msg.equals("1"))
					out.println(" <script> alert('펫 수정이 완료 되었습니다.'); location.href='profile.jsp';</script>");
				}
			
		%>
	</div>	
</body>
</html>