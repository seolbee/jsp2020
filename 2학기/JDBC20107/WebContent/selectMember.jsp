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
			<td><a href="updateMember.jsp?memno=<%=vo.getMemno()%>"><%=vo.getMemno() %></a></td><!-- updatemember.jsp에 파라미터 memno 값을 전달을 위해 getMemno를 함. 유저 memno를 출력 -->
			<td><%= vo.getName() %></td><!-- 유저 네임 값 출력 -->
			<td><%= vo.getId() %></td><!-- 유저 아이디 값 출력 -->
			<td><%= vo.getPassword() %></td><!-- 유저 패스워드 값 출력 -->
			<td><%= vo.getBirth() %></td><!-- 유저 생년 값 출력 -->
			<td><%= vo.getGender().equals("m") ? "남자" : "여자"%></td><!-- 유저 성별 값 출력 -> getGender().equals("m")이 true 라면 남자 아니면 여자 -->
			<td><%= vo.getJob() %></td><!-- 유저 직업 값 출력 -->
			<td><%= vo.getCity() %></td><!-- 유저가 사는 지역 값 출력 -->
			<td><%= vo.getRegisteDate().toString() %></td><!-- 유저가 가입한 날 출력  Date 객체이기 때문에 toString을 해줘야 함. -->
			<td><a href="deleteMember.jsp?memno=<%=vo.getMemno()%>">탈퇴</a></td><!-- deleteMember.jsp-> 유저 삭제 (삭제를 위해 memno 값을 전달) -->
		</tr>
		<%
			}
		%>
	</tbody>
</table>
<%@ include file= "footer.jsp"%> <!-- include file 태그로 footer.jsp include 해주기 -->