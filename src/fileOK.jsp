<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<!DOCTYPE html>
<html>
<head>
<%
String ownerId = (String) session.getAttribute("sessionId");
%>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
function PsubmitFunction(){
	var message=$('#message').val();
	var nickname="<%=ownerId%>pwner";
	$.ajax({
		type:"POST",
		url:"./chatSubmitServlet",
		data:{
			nickname:encodeURIComponent(nickname),
			message:encodeURIComponent(message)
		},
		success:function(result){
			if(result==1){
				//alert('전송에 성공했습니다.');
			}else{
				alert('데이터베이스 오류가 발생했습니다.');
			}
			
		}
	});
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>
<% 
	String filename="";
	int sizeLimit=15*1024*1024;
	
	String realPath=request.getServletContext().getRealPath("upload");
	File dir=new File(realPath);
	if(!dir.exists()) dir.mkdirs();
	
	MultipartRequest multipartRequest=null;
	multipartRequest=new MultipartRequest(request,realPath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());
	filename=multipartRequest.getFilesystemName("photo");
	
 %>
 <script>
 	parent.ifun("성공");
 </script>

 폼에서 전송된 원래 파일명 :
 <%=multipartRequest.getOriginalFileName("photo") %><br />
 파일명:<%=filename%><br />
 업로드한 파일의 경로:
 ${pageContext.request.contextPath}/upload/<%=filename%><br />
 물리적인 저장경로 :<%=realPath %><br />

<input type=text value=<%=filename %> name="message" id="message">
<input style="WIDTH:10%;Height:100%; float:center" type="submit" value="사진전송" onclick="PsubmitFunction()">
 <img src="${pageContext.request.contextPath}/upload/<%=filename%>" />
 <script type="text/javascript">
		$(document).ready(function(){
			PsubmitFunction();
		});
</script>

</body>
</html>