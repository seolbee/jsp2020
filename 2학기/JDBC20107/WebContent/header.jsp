<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="member.MemberDAO"%>
<%
	MemberDAO instance = MemberDAO.getInstance();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="selectMember.jsp">회원 목록</a>
<a href="insertMember.jsp">회원 가입</a>
<hr>