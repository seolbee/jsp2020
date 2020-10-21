<%@page import="member.MemberVO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int memno = Integer.parseInt(request.getParameter("memno"));
	String password = request.getParameter("pass");
	MemberDAO instance  = MemberDAO.getInstance();
	MemberVO vo = instance.getAMember(memno);
	if(!vo.getPassword().equals(password)){
%>
	<script>
		alert("비밀번호가 같지 않습니다. 다시 입력하세요");
		history.back();
	</script>

<%
	return;
	}
	
	int cnt = instance.deletemember(vo);
	String msg = "";
	if(cnt > 0) msg = "회원삭제 성공";
	else msg = "회원 삭제 실패";
			
%>

<script>
	alert("<%= msg %>");
	location.href="selectMember.jsp";
</script>