<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	
	MemberDAO instance = MemberDAO.getInstance();
	Connection conn = instance.getConnection();
	String checkSql = "SELECT * FROM MEMBER_TBL WHERE id = ?";
	boolean result = false;
	PreparedStatement pstmt = conn.prepareStatement(checkSql);
	pstmt.setString(1, id);
	
	ResultSet rs = pstmt.executeQuery();
	if(!rs.next()) result = true;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<b><%= id %></b>는
	<%
		if(result){
	%>
	<font color="blue">사용 가능</font>합니다.
	<%
		} else {
			
	%>
		<font color ="red">사용 불가능</font>합니다.
	<%
		}
	%>
	<hr>
	<a href="javascript:self.close()">창 닫기</a>
</body>
</html>