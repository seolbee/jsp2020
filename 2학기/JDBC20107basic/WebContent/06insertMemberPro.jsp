<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	int birth = Integer.parseInt(request.getParameter("birth"));
	String gender = request.getParameter("gender");
	String job = request.getParameter("job");
	String city = request.getParameter("city");
	
	MemberDAO instance = MemberDAO.getInstance();
	Connection conn = instance.getConnection();
	String getNoSql = "SELECT MAX(MEMNO) FROM MEMBER_TBL";
	int memno = 0;
	PreparedStatement pstmt = conn.prepareStatement(getNoSql);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		memno = rs.getInt(1)+1;
	}
	
	String insertSql = "INSERT INTO MEMBER_TBL (memno, name, id, pass, birth, gender, job, city, joindate) VALUES(?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";
	pstmt = conn.prepareStatement(insertSql);
	String msg = null;
	int cnt = 0;
	pstmt.setInt(1, memno);
	pstmt.setString(2, name);
	pstmt.setString(3, id);
	pstmt.setString(4, pass);
	pstmt.setInt(5, birth);
	pstmt.setString(6, gender);
	pstmt.setString(7, job);
	pstmt.setString(8, city);
	cnt = pstmt.executeUpdate();
	
	if(cnt > 0) msg = "회원가입 성공";
	else msg = "회원가입 실패";
	instance.close(rs, pstmt, conn);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<script type="text/javascript">
		alert('<%=msg%>');
		location.href="03selectMember.jsp";
	</script>
</body>
</html>