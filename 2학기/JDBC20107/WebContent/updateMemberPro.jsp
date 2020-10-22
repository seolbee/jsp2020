<%@page import="member.MemberDAO"%>
<%@page import="member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	request.setCharacterEncoding("utf-8");
	
	int memno = Integer.parseInt(request.getParameter("memno"));
	String password = request.getParameter("pass");
	int birth = Integer.parseInt(request.getParameter("birth"));
	String gender = request.getParameter("gender");
	String job = request.getParameter("job");
	String city = request.getParameter("city");
	
	MemberVO vo = new MemberVO(memno, null, null, password, birth, gender, job, city, null);
	MemberDAO instance = MemberDAO.getInstance();
	int cnt = instance.updateMember(vo);
%>

<script>
	alert("회원 수정 성공");
	location.href="selectMember.jsp";
</script>