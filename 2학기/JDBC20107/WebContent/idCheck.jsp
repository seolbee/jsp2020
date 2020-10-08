<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<%
		MemberDAO instance = MemberDAO.getInstance();
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		boolean find = instance.idAvailableChk(id);
		String msg = "";
		String color = "";
		if(find) {
			msg = "사용 불가능";
			color = "red";
		} else{
			msg = "사용가능";
			color="blue";
		}
	%>
	
	<p><b><%= id %></b>는 <font color="<%= color %>"><%=msg %></font>입니다.</p>
	<hr>
	<a href="javascript:self.close()">창 닫기</a>