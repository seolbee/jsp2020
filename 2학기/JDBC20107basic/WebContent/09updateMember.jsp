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
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int memno = Integer.parseInt(request.getParameter("memno"));
		MemberDAO instance = MemberDAO.getInstance();
		Connection conn = instance.getConnection();
		String selectSql = "SELECT * FROM MEMBER_TBL WHERE memno = ?";
		PreparedStatement pstmt = conn.prepareStatement(selectSql);
		pstmt.setInt(1, memno);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
	%>
	<form action="10updateMemberPro.jsp" method="post">
		<table border="1" style="width:400">
			<tr>
				<td colspan="2" align="center"><b>회원 수정 정보 입력</b></td>
			</tr>
			<tr>
				<th>회원번호</th>
				<td>
					<input type="text" name="memno" value="<%= rs.getInt("memno") %>" readonly>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" value="<%= rs.getString("name") %>" disabled>
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" value="<%= rs.getString("id") %>" disabled>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pass" value="<%= rs.getString("pass")%>">
				</td>
			</tr>
			<tr>
				<th>생년</th>
				<td>
					<select name="birth">
					<%
						for(int i = 2001; i <= 2010; i++){
							if(rs.getInt("birth") == i){
					%>
						<option value="<%= i %>" selected><%= i %></option>
					<%
							} else{
					%>
						<option value="<%= i %>"><%= i %></option>
					<%
							}
						}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<%
						if(rs.getString("gender").equals("남자")){
					%>
						<input type="radio" name="gender" value="남자" checked>남자
						<input type="radio" name="gender" value="여자">여자		
					<%
						} else {
					%>
						<input type="radio" name="gender" value="남자">남자
						<input type="radio" name="gender" value="여자" checked>여자
					<%
						}
					%>
				</td>
			</tr>
			<tr>
				<th>직업</th>
				<td><input type="text" name="job" value="<%= rs.getString("job")%>"></td>
			</tr>
			<tr>
				<th>직업</th>
				<td>
					<input type="text" name="city" value="<%= rs.getString("city")%>">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
	<%
		}
		instance.close(null, pstmt, conn);
	%>
</body>
</html>