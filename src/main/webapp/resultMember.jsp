<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
</head>
<body>
	<div align="center">
		<%
			String msg = request.getParameter("msg");

			if (msg != null) {
				if (msg.equals("0"))
					out.println("");
				else if (msg.equals("1"))
					out.println(" <script> alert('회원가입을 축하드립니다.'); location.href='loginMember.jsp';</script>");
				else if (msg.equals("2")) {
					String loginId = (String) session.getAttribute("sessionId");
					out.println(" <script> alert('" + loginId + "님 환영합니다'); location.href='list.jsp';</script>");
					out.println(loginId);
				}
			}
		%>
	</div>
</body>
</html>