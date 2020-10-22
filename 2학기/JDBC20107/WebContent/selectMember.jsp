<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="member.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ include file= "header.jsp"%><!-- include file 태그로 header.jsp include 해주기 -->

<table border="1" style="text-align:center">
	<thead>
		<tr>
			<td>회원번호</td>
			<td>이름</td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>생년월일</td>
			<td>성별</td>
			<td>직업</td>
			<td>도시</td>
			<td>가입날짜</td>
			<td>탈퇴</td>
		</tr>
	</thead>
	<tbody>
		<%
			ArrayList<MemberVO> list = instance.selectMembers();//유저 리스트 가져오기 -> instance 객체는 header.jsp에 있음
			for(MemberVO vo:list){//for문으로 list에 있는 값들 출력하기
		%>
		<tr>
			<td><a href="updateMember.jsp?memno=<%=vo.getMemno()%>"><%=vo.getMemno() %></a></td>
			<td><%= vo.getName() %></td>
			<td><%= vo.getId() %></td>
			<td><%= vo.getPassword() %></td>
			<td><%= vo.getBirth() %></td>
			<td><%= vo.getGender().equals("m") ? "남자" : "여자"%></td>
			<td><%= vo.getJob() %></td>
			<td><%= vo.getCity() %></td>
			<td><%= vo.getRegisteDate().toString() %></td>
			<td><a href="deleteMember.jsp?memno=<%=vo.getMemno()%>">탈퇴</a></td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
<%@ include file= "footer.jsp"%> <!-- include file 태그로 footer.jsp include 해주기 -->