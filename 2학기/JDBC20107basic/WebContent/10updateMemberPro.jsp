<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int memno = Integer.parseInt(request.getParameter("memno"));
	String pass = request.getParameter("pass");
	int birth = Integer.parseInt(request.getParameter("birth"));
	String gender = request.getParameter("gender");
	String job = request.getParameter("job");
	String city = request.getParameter("city");
	MemberDAO instance = MemberDAO.getInstance();
	Connection conn = instance.getConnection();
	
	String updateSql = "UPDATE MEMBER_TBL SET PASS = ?, BIRTH = ?, GENDER = ?, JOB = ?, CITY =? WHERE MEMNO =?";
	int cnt = 0;
	String msg = null;
	PreparedStatement pstmt = conn.prepareStatement(updateSql);
	pstmt.setString(1, pass);
	pstmt.setInt(2, birth);
	pstmt.setString(3, gender);
	pstmt.setString(4, job);
	pstmt.setString(5, city);
	pstmt.setInt(6, memno);
	
	cnt = pstmt.executeUpdate();
	if(cnt > 0) msg= "회원 정보 수정 성공";
	else msg = "회원정보 수정 실패";
	instance.close(null, pstmt, conn);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		alert('<%=msg %>');
		location.href('03selectMember.jsp');
	</script>
</body>
</html>