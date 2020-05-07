<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! private static final String STR = "WORD"; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- Determine the specified name (or user default) --%>
	<% 
		String name = request.getParameter("name"); 
		if((name == null) || (name.length()) == 0){
			name = STR;
		}
	%>
	<b>Hello, <%= name %></b>
</body>
</html>