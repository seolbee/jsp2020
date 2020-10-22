<%@page import="member.MemberDAO"%>
<%@page import="member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	request.setCharacterEncoding("utf-8");//인코딩 utf-8로 설정
	
	int memno = Integer.parseInt(request.getParameter("memno"));//memno를 가져옴 (정수 형으로 형변환 하기 위해 integer.parseInt() 사용)
	String password = request.getParameter("pass");//pass 가져옴
	int birth = Integer.parseInt(request.getParameter("birth"));//birth 가져옴 (정수 형으로 형변환을 위해 integer.parseInt 사용)
	String gender = request.getParameter("gender");//gender 가져옴
	String job = request.getParameter("job");//job 가져옴
	String city = request.getParameter("city");//city 가져옴
	
	MemberVO vo = new MemberVO(memno, null, null, password, birth, gender, job, city, null);//vo 객체 생성
	MemberDAO instance = MemberDAO.getInstance();//instance 객체 가져오기
	int cnt = instance.updateMember(vo);//updateMember() 함수 실행 반환 값은 수정 된 row 값
	String msg = "";//메시지 변수 
	if(cnt > 0) msg = "회원 수정 성공";//row가 0보다 크다 -> 수정이 되었다. -> 성공 메시지 출력
	else msg = "회원 수정 실패";//row가 0이거나 작다 -> 수정이 되지 않음 -> 실패 메시지 출력
%>

<script>
	alert("<%=msg%>");
	location.href="selectMember.jsp";
</script>