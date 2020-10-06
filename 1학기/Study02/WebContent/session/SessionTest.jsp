<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 정보 설정</title>
</head>
<body>
	<%
		String setId1 = "admin";
		String setId2 = "guest";
		/* 세션설정 admin 과 guest 값을 저장 */
		session.setAttribute("logId1", setId1);
		session.setAttribute("logId2", setId2);
	%>
	
	세션에 속성을 설정하였습니다. <hr>
	<a href="PrintSession01.jsp">세션정보확인</a>
</body>
</html>