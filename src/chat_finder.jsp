<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@ page import="java.util.*" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="chat.css">
    <link rel="shortcut icon" href="images/dog.svg">
    <title>chat</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript">
		
		var lastID=0;
		function submitFunction(){
			var message=$('#message').val();
			var nickname="gyufinder";
			
			if (message=="")
				{
				alert('내용을 입력하세요.');
				return;
				}
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
			$('#message').val('');
		}
		function PsubmitFunction(){
			var message=photos;
			var nickname="gyupwner";
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
			$('#message').val('');
		}
		function chatListFunction(type){
			$.ajax({
				type:"POST",
				url:"./chatListServlet",
				data:{
					listType:type,
				},
				success:function(data){
					if(data=="")return;
					var parsed=JSON.parse(data);
					var result=parsed.result;
					for(var i=0; i<result.length;i++){
						addChat(result[i][0].value,result[i][1].value,result[i][2].value,result[i][3].value);
					}
					lastID=Number(parsed.last);
				}
				});
		}
		function addChat(chatname,userchat,chattime,chatID){
			if(chatname=="gyuowner"){
				$('#chatList').append('<p><ul><li class="lefts" id="'+
						chatID+
						'"><span style="font-size:50px">'+
					userchat+
					'</span>'+
					'<font size=1><br>'+
					chattime+
					'</font><br></li></ul></p>'
					);
			}else if(chatname=="gyufinder")
				{
				$('#chatList').append('<p><ul><li class="rights" id="'+
						chatID+
						'"><span style="font-size:50px">'+
					userchat+
					'</span><font size=1><br>'+
					chattime+
					'</font><br></li></ul></p>'
					);
				
				}
			else if(chatname=="gyupwner"){
				$('#chatList').append('<ul><li class="left" id="'+
						chatID+
						'"><img src="${pageContext.request.contextPath}/upload/'+
						userchat+
						'" style="max-width: 100%; height: auto;">'+
						'</span><font size=1><br>'+
						chattime+
						'</font><br></li></ul>'
						);
			}
			else if(chatname=="gyupfinder"){
				$('#chatList').append('<ul><li class="right" id="'+
						chatID+
						'"><img src="${pageContext.request.contextPath}/upload/'+
						userchat+
						'" style="max-width: 100%; height: auto;">'+
						'</span><font size=1><br>'+
						chattime+
						'</font><br></li></ul>'
						);
			}
			window.scrollTo(0,document.body.scrollHeight);
		}
		function deletechat(chatID,userchat){
			$.ajax({
				type:"POST",
				url:"./chatDeleteServlet",
				data:{
					chatID:encodeURIComponent(chatID),
				},
				success:function(result){
					if(result==1){
						//alert('삭제에 성공했습니다.');
					}else{
						alert('데이터베이스 오류가 발생했습니다.');
					}
					
				}
			});
			document.getElementById(chatID).style.display="none";
			//location.reload();
		}
		function getInfiniteChat(){
			setInterval(function(){
				chatListFunction(lastID);
			},1000);
		}
	</script>
</head>
<body>
	<div class="fixedbutton" style="position:fixed; top:0;">
	<a href="${pageContext.request.contextPath}/pet/profile2.jsp">
	<button>프로필 보기
	</button>
	</a>
	</div>
    <div class="chat_wrap">
        <div class="header">
        </div>
        <div class="chat" id=chatList>
            
        </div>
        <div class="input-div">
			<textarea cols="23" wrap="hard" placeholder="메시지를 입력하세요." name="message" id="message"></textarea>
			<input style="WIDTH:10%;Height:100%; float:center" type="submit" value="전송" onclick="submitFunction()">
			<button type="button" id="subbutton" onclick="$('#filebutton').trigger('click');">사진정송</button>
			<form target="iframe1" action="fileOK_f.jsp" style="display:none" method="post" enctype="multipart/form-data">
        		<input type="file" id="filebutton" onchange="this.form.submit()" name="photo" id="photo">
       			<input type="submit" value="upload" >
    		</form>
    		
    		<iframe id="iframe1" name="iframe1" style="display:none"></iframe>
    
   <Script>function ifun(msg){<!--fileOK.jsp에서 날라온 메세지 띄우기-->
   }</Script>
        </div>
    </div>
<div class="clearfix"></div>

<script type="text/javascript">
		$(document).ready(function(){
			chatListFunction('ten');
			getInfiniteChat();
		});
</script>
</body>
</html>