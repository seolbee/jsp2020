<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 정보 출력 </title>
</head>
<body>
	<%
		Enumeration<String> en = session.getAttributeNames();
		while(en.hasMoreElements()){
			String name = (String)en.nextElement();
			String value = (String)session.getAttribute(name);
			
			out.print("session name : "+ name + "<br>");
			out.print("session value : "+value + "<br>");
			out.print("session id : " + session.getId()+"<br><br>");
			
			if(name.equals("logId1")){
				session.removeAttribute("logId1");
			}
		}
	%><hr>
	<a href="PrintSession02.jsp">다음 페이지에서 세션 확인</a>
</body>
</html>