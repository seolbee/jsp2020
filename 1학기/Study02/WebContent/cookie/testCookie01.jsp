<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 확인하기 </title>
</head>
<body>
	<%
		Cookie[] cook = request.getCookies();
		if(cook != null){
			for(int i = 0; i<cook.length; i++){
				
	%>
	
	Cookie Name : <%= cook[i].getName() %> &nbsp;&nbsp;
	Cookie Value : <%= cook[i].getValue() %> <br><br>
	<%
				if(cook[i].getName().equals("logId1")){
					cook[i].setMaxAge(0);
					response.addCookie(cook[i]);
				}
			}
		}
	%>
	<a href="testCookie02.jsp">다음으로 이동 </a>
</body>
</html>