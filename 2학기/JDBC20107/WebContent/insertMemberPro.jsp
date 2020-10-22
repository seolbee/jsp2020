<%@page import="member.MemberVO"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	MemberDAO instance = MemberDAO.getInstance();//MemberDAO 객체 가져오기
    	request.setCharacterEncoding("utf-8");//인코딩 utf-8로 설정
    	String name = request.getParameter("name");//name 값 가져오기
    	String password = request.getParameter("pass");//pass 값 가져오기
    	String confirm_password = request.getParameter("confirm_pass");//confirm_pass 값 가져오기
    	String id = request.getParameter("id");//id 값 가져오기
    	int birth = Integer.parseInt(request.getParameter("birth"));//birth 값 가져오기 정수형 변환을 위해 Integer.parseInt()로 형변환
    	String gender = request.getParameter("gender");//gender 값 가져오기
    	String job = request.getParameter("job");//job 값 가져오기
    	String city = request.getParameter("city");//city 값 가져오기
    	
    	if(!password.equals(confirm_password)){//패스워드 값이 confirm 패스워드와 같은지 체크
   %>
   <script>
   		alert("비밀번호가 일치하지 않습니다.");//다르면 경고창 띄우기
   		history.back();//뒤로 가기
   </script>
   <%
   		return;
    	}
    	
    	MemberVO vo = new MemberVO(instance.getMaxNo()+1, name, id, password, birth, gender, job, city, null);//MemberVO 객체 생성
    	//생성자에 파리미터 넣기
    	int cnt = instance.insertMember(vo);//insertMember()를 실행하여 반환 값인 row를 반환
    	String msg = "";// 출력 메시지 변수
    	if(cnt > 0) msg = "회원가입 성공";// insert한 row 값이 0보다 큰지 체크 크다면 성공
    	else msg="회원가입 실패";//아니면 실패 문구를 넣음
    %>
    <script>
    	alert("<%= msg %>");//메시지 출력
    	location.href="selectMember.jsp";//selectMember.jsp로 이동
    </script>