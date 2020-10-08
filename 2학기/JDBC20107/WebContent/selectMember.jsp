<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="member.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ include file= "header.jsp"%>

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
			ArrayList<MemberVO> list = instance.selectMembers();
			for(MemberVO vo:list){
		%>
		<tr>
			<td><a href="updateMember.jsp?num=<%=vo.getNum()%>"><%=vo.getNum() %></a></td>
			<td><%= vo.getName() %></td>
			<td><%= vo.getId() %></td>
			<td><%= vo.getPassword() %></td>
			<td><%= vo.getBirth() %></td>
			<td><%= vo.getGender() %></td>
			<td><%= vo.getJob() %></td>
			<td><%= vo.getCity() %></td>
			<td><%= vo.getRegisteDate().toString() %></td>
			<td><a href="updateMember.jsp?num=<%=vo.getNum()%>">탈퇴</a></td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
<%@ include file= "footer.jsp"%>