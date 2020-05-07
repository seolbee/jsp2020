<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 생성하기 </title>
</head>
<body>
	<% 
		Cookie cook1 = new Cookie("logId", "admin");
		Cookie cook2 = new Cookie("logId", "guest");
		/* 쿠키에 등록 */
		response.addCookie(cook1);
		response.addCookie(cook2);
	%>
	
	쿠키가 생성되었습니다.<hr>
	쿠키확인은 <a href="testCookie01.jsp">여기로</a>
</body>
</html>