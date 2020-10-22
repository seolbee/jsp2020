<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="member.MemberDAO"%><!--  memberDAO import 해주기 -->
<% MemberDAO instance = MemberDAO.getInstance();//MemberDAO Instance 객체 가져오기%>
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