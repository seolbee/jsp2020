<%@page import="member.MemberVO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int memno = Integer.parseInt(request.getParameter("memno"));
	
	MemberDAO instance  = MemberDAO.getInstance();
	MemberVO vo = instance.getAMember(memno);
	int cnt = instance.deletemember(vo);
	String msg = "";
	if(cnt > 0) msg = "회원삭제 성공";
	else msg = "회원 삭제 실패";
%>

<script>
	alert("<%= msg %>");
	location.href="selectMember.jsp";
</script>