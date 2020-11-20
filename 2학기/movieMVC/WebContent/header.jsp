<%@page import="movie.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	UserVO user = null;
 	if(request.getAttribute("user") != null) user = (UserVO) request.getAttribute("user");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화</title>
</head>
<body>

<h1>영화 리스트</h1>

<header>
	<nav>
		<a href="index.jsp?type=01">액션</a>
		<a href="index.jsp?type=02">로맨스</a>
		<a href="index.jsp?type=03">코미디</a>
		<a href="index.jsp?type=04">스릴러</a>
		<a href="index.jsp?type=05">애니메이션</a>
	</nav>
	
	<% if(request.getAttribute("user") == null) { %>
		<nav>
			<a href="Login.jsp">로그인</a>
			<a href="Registe.jsp">회원가입</a>
		</nav>
	<% } else {%>
		<nav>
			<a href="User.jsp"><%= user.getId() %></a>
			<a href="Registe.jsp">회원가입</a>
		</nav>
	<%} %>
</header>