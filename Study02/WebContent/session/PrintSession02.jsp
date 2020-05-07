<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 정보 확인</title>
</head>
<body>
	<%
		Enumeration<String> en = session.getAttributeNames();
		while(en.hasMoreElements()){
			String name = (String) en.nextElement();
			String value = (String) session.getAttribute(name);
			
			out.print("세션이름 : "+name+"<br>");
			out.print("세션 값 : "+value+"<br>");
			out.print("세션 id : "+session.getId() + "<br><br>");
		}
	%>
</body>
</html>