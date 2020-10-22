<%@page import="member.MemberVO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");//인코딩 utf-8로 설정
	
	int memno = Integer.parseInt(request.getParameter("memno"));//memno 가져오기 정수형으로 형변환을 위해 Integer.parseInt()
	String password = request.getParameter("pass");//password 가져오기
	MemberDAO instance  = MemberDAO.getInstance();//memberDAO 객체 가져오기
	MemberVO vo = instance.getAMember(memno);//memno를 통해서 탈퇴하려는 유저의 정보 가져오기
	if(!vo.getPassword().equals(password)){//입력한 password와 유저의 password가 같은지 체크
%>
	<script>
		alert("비밀번호가 같지 않습니다. 다시 입력하세요");//다르면 경고창 띄우기
		history.back();//뒤로가기
	</script>

<%
	return;
	}
	
	int cnt = instance.deleteMember(vo);//탈퇴한 멤버의 vo 객체 가져오기 반환값은 삭제된 row 갯수
	String msg = "";//메시지 변수
	if(cnt > 0) msg = "회원삭제 성공";//cnt > 0보다 크다 -> 삭제가 되었다. -> 성공 메시지 저장
	else msg = "회원 삭제 실패";//cnt 0이거나 0보다 작다 -> 삭제가 안 됨. -> 실패 메시지 저장
			
%>

<script>
	alert("<%= msg %>");//메시지 출력
	location.href="selectMember.jsp";
</script>