
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<%
		MemberDAO instance = MemberDAO.getInstance();//MemberDAO 객체 가져오기
		request.setCharacterEncoding("utf-8");//인코딩 utf-8로 설정
		String id = request.getParameter("id");//get방식으로 보낸 id 가져오기
		boolean find = instance.idAvailableChk(id);//id가 다른 유저 중에서 중복이 되는 지 체크
		String msg = "";//메세지 출력용 변수
		String color = "";//메세지 색깔 변수
		if(find) {//find가 true인지 아닌지 체크
			//true-> 아이디가 다른 유저와 중복됨
			msg = "사용 불가능";
			color = "red";
		} else{
			//false -> 아이디가 다른 유저와 중복되지 않음
			msg = "사용가능";
			color="blue";
		}
	%>
	
	<p><b><%= id %></b>는 <font color="<%= color %>"><%=msg %></font>입니다.</p><!-- 중복 체크 문자 띄어주기 -->
	<hr>
	<a href="javascript:self.close()">창 닫기</a>