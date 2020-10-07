<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레코드 출력</title>
</head>
<body>
	<a href="03selectMember.jsp">회원 목록</a>&nbsp;&nbsp;&nbsp;
	<a href="05insertMember.jsp">회원 가입</a>&nbsp;&nbsp;&nbsp;
	<hr>
	<%
		MemberDAO instance = MemberDAO.getInstance();
		Connection conn = instance.getConnection();
		String selectSql = "SELECT * FROM MEMBER_TBL ORDER BY MEMNO";
		PreparedStatement pstmt = conn.prepareStatement(selectSql);
		ResultSet rs = pstmt.executeQuery();
	%>
	
	<h2>회원 목록</h2>
	<table border=1>
		<tr align="center">
			<th width="100">회원번호</th>
			<th width="100"> 이름  </th>
			<th width="100">아이디</th>
			<th width="100">비밀번호</th>
			<th width="100">생년(4자리)</th>
			<th width="50">성별</th>
			<th width="100">직업</th>
			<th width="100">도시</th>
			<th width="100">가입일자</th>
			<th width="50">탈퇴</th>
		</tr>
		<%
			while(rs.next()){
				int memno = rs.getInt("MEMNO");
				String name = rs.getString("NAME");
				String id = rs.getString("ID");
				String pass = rs.getString("PASS");
				int birth = rs.getInt("BIRTH");
				String gender = rs.getString("GENDER");
				String job = rs.getString("job");
				String city = rs.getString("city");
				Date joinDate = rs.getDate("JOINDATE");
		%>
		<tr align="center">
			<td width="100"><a href="09updateMember.jsp?memno=<%= memno %>"><%=memno %></a></td>
			<td width="100"><%=name %></td>
			<td width="100"><%=id %></td>
			<td width="100"><%=pass %></td>
			<td width="100"><%= birth %></td>
			<td width="50"><%= gender %></td>
			<td width="100"><%= job %></td>
			<td width="100"><%= city %></td>
			<td width="100"><%= joinDate.toString() %></td>
			<td width="100"><a href="07deleteMember.jsp?memno=<%= memno %>">탈퇴</a></td>
		</tr>
		<%
			}
			instance.close(rs, pstmt, conn);
		%>
	</table>
</body>
</html>