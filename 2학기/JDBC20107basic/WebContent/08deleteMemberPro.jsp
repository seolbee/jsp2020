<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	int memno = Integer.parseInt(request.getParameter("memno"));
	String pass = request.getParameter("pass");
	MemberDAO instance = MemberDAO.getInstance();
	Connection conn = instance.getConnection();
	
	String selectSql = "SELECT ID, PASS FROM MEMBER_TBL WHERE MEMNO = ?";
	String deleteSql = "DELETE FROM MEMBER_TBL WHERE MEMNO = ?";
	int cnt = 0;
	String msg = null;
	PreparedStatement pstmt = conn.prepareStatement(selectSql);
	pstmt.setInt(1, memno);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		String dbPass = rs.getString("pass");
		if(pass.equals(dbPass)){
			pstmt = conn.prepareStatement(deleteSql);
			pstmt.setInt(1, memno);
			cnt = pstmt.executeUpdate();
			if(cnt > 0) {msg = "회원 탈퇴 완료";}
		} else {
			msg = "비밀번호 오류";
		}
	}
	instance.close(rs, pstmt, conn);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<script type="text/javascript">
		alert('<%= msg %>');
		location.href('03selectMember.jsp');
	</script>
</body>
</html>