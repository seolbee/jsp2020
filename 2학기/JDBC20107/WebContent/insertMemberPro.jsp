<%@page import="member.MemberVO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	MemberDAO instance = MemberDAO.getInstance();
    	request.setCharacterEncoding("utf-8");
    	String name = request.getParameter("name");
    	String password = request.getParameter("pass");
    	String confirm_password = request.getParameter("confirm_pass");
    	String id = request.getParameter("id");
    	int birth = Integer.parseInt(request.getParameter("birth"));
    	String gender = request.getParameter("gender");
    	String job = request.getParameter("job");
    	String city = request.getParameter("city");
    	Date now = new Date();
    	
    	if(password.equals(confirm_password)){
   %>
   <script>
   		alert("비밀번호가 일치하지 않습니다.");
   		history.back();
   </script>
   <%
   		return;
    	}
    	
    	MemberVO vo = new MemberVO(instance.getMaxNo()+1, name, id, password, birth, gender, job, city, null);
    	
    	int cnt = instance.insertMember(vo);
    	String msg = "";
    	if(cnt > 0) msg = "회원가입 성공";
    	else msg="회원가입 실패";
    %>
    
    <script>
    	alert("<%= msg %>");
    	location.href="selectMember.jsp";
    </script>