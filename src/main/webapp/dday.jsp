<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang = "ko">
<head>

	<meta charset= "UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name = "viewport" content="width=device-width, initial-scale=1.0">
	<title>D-day 알리미</title>
	<link href="dday.css" rel="stylesheet">
	<%@ include file="/pet/dbconn.jsp" %>
	<%
	 String ownerId = (String) session.getAttribute("sessionId");
	 String date1 = "";
	 String date2 = "";
	 String date3 = "";
	 String date4 = "";
	 
	
	 ResultSet rs = null;
	 PreparedStatement pstmt = null;
	
	 try{
		String sql="select * from date where owner_id='"+ownerId+"'";
		pstmt=conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if (!rs.next()){
			
		} else{
			date1 = rs.getString("date1");
			date2 = rs.getString("date2");
			date3 = rs.getString("date3");
			date4 = rs.getString("date4");
		}
		
		request.setAttribute("date1", date1);
		request.setAttribute("date2", date2);
		request.setAttribute("date3", date3);
		request.setAttribute("date4", date4);
		
	 }catch (SQLException ex){
		
	 }finally{
		if (pstmt!=null)
			pstmt.close();
		if (conn!=null)
			conn.close();
	 }
	 
	%>
	<script type="text/javascript">
	function popup(num,date){
		if(num<5){
		var	inputStartDay = date;
		}else{
		var inputStartDay = prompt("시작일을 입력해주세요","2021-01-01");
		}
		var today = new Date();
		var startDay = new Date(inputStartDay);
		var year = startDay.getFullYear();
		var month = startDay.getMonth() + 1;
		var day = startDay.getDate(); 

		var startMilli = startDay.getTime();
		var todayMilli = today.getTime();
		var calcDay = 24 * 60 * 60 * 1000;
		var passedDay = Math.round((todayMilli - startMilli)/calcDay);
		
		
		if(num==1){
			calcDate(30);
		}else if(num==2){
			calcDate(60);
		}else if(num==3){
			calcDate(180);
		}else if(num==4){
			calcDate(365);
		}else{
			calcDate(num);
			
			if(num==30){
				document.querySelector('#date1').value = inputStartDay;
			}else if(num==60){
				document.querySelector('#date2').value = inputStartDay;
			}else if(num==180){
				document.querySelector('#date3').value = inputStartDay;
			}else if(num==365){
				document.querySelector('#date4').value = inputStartDay;
			}
			document.getElementById('filebutton').click();
		}

		function calcDate(number){
			var futureMilli = startMilli + (calcDay * number);
			var dDay = Math.round((futureMilli - todayMilli) / calcDay);
			if(number == 365){
				year = startDay.getFullYear() + 1;
				month = startDay.getMonth() + 1;
				day = startDay.getDate();
				}
			else{
				var futureDate = new Date(futureMilli);
				year = futureDate.getFullYear();
				month = futureDate.getMonth() + 1;
				day = futureDate.getDate();
				}
			console.log(number);
				if(dDay > 0){
					document.querySelector("#dday" + number).innerHTML = dDay + "일 남음<br>" + year + "년" + month + "월" + day + "일";
					}
				else if(dDay<=0){
					document.querySelector("#dday" + number).innerHTML = dDay * -1 + "일 지남<br>" + year + "년" + month + "월" + day + "일";
					}
				else{
					document.querySelector("#dday" + number).innerHTML = "최근 접종일을 입력하세요.";
				}
					
				}
	}
	
	</script>
</head>
<body>
	<script>
	window.onload=function(){
		
		popup(1,"<%=date1%>");
		popup(2,"<%=date2%>");
		popup(3,"<%=date3%>");
		popup(4,"<%=date4%>");
		
	}
	</script>
	<div id = "container">
		<div id="top">
			<img src="overaction.jpg">
			<span id = "heart">♥</span>
			<img src="overaction.jpg">
			<div>접종주기</div>
			<div id = "startDay"></div>
			<div id = "today"></div>
			<br>
			<br>
			<br>
		</div>
		<form action="processAddDate.jsp" id="frm1" method="POST" class="loginForm" onsubmit="return checkForm()">
		<input type="text" name="date1" class="date1" id="date1" value="<%=date1%>"  style="display:none">
		<input type="text" name="date2" class="date2" id="date2" value="<%=date2%>"  style="display:none">
		<input type="text" name="date3" class="date3" id="date3" value="<%=date3%>"  style="display:none">
		<input type="text" name="date4" class="date4" id="date4" value="<%=date4%>"  style="display:none">
		<ul><a href="javascript:popup(30);" class="btn">
			<li>
				
	            
				<span class="days">심장사상충</span>
				<span class="days2">
					<div id="dday30"></div>
				</span>
			</li>
			</a>
			<a href="javascript:popup(60);" class="btn" onclick="formSubmit();return false;">
			<li>
				<span class="days">기생충</span>
				<span class="days2">
					<div id="dday60"></div>
					
				</span>
			</li>
			</a>
			<a href="javascript:popup(180);" class="btn" onclick="formSubmit();return false;">
			<li>
				<span class="days">광견병</span>
				<span class="days2">
					<div id="dday180"></div>
				</span>
			</li>
			</a>
			<a href="javascript:popup(365);" class="btn" onclick="formSubmit();return false;">
			<li>
				<span class="days">종합예방</span>
				<span class="days2">
					<div id="dday365"></div>
				</span>
			</li>
			</a>
		</ul>
		<input id="filebutton" type="submit" value="upload"  style="display:none">
		</form>
	</div>
</body>
</html>