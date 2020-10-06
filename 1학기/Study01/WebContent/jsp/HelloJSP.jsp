<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello JSP</h1>
	<%
		int total = 0;
		for(int cnt = 1; cnt<=100; cnt++)
			total+=cnt;
	%>
	1부터 100까지 더한 값은? <%=total %>
	<!-- JSP 주석으로 설명하겠습니다. -->
	<%@ page import="java.text.SimpleDateFormat" %>
	<!-- 여러 개의 패키지는 쉼표로 구분해서 사용합니다. -->
	<%@ page import ="java.util.* , java.sql.*" %>
	<!-- 사용자가 만든 패키지의 클래스를 지정할 수 있습니다. -->
<%-- 	<%@ page import ="com.edu.vo.MemberVO" %> --%>

</body>
</html>