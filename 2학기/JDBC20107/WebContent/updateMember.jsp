<%@page import="member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file= "header.jsp"%>
<%
	MemberVO vo = instance.getAMember(Integer.parseInt(request.getParameter("memno")));
	System.out.println(vo.toString());
%>
	<form action="updateMemberPro.jsp" method="post">
		<table border="1" style="width:400">
			<tr>
				<td colspan="2" align="center"><b>회원 수정 정보 입력</b></td>
			</tr>
			<tr>
				<th>회원번호</th>
				<td>
					<input type="text" name="memno" value="<%= vo.getMemno() %>" readonly>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" value="<%=  vo.getName() %>" disabled>
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" value="<%= vo.getId() %>" disabled>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pass" value="<%= vo.getPassword() %>">
				</td>
			</tr>
			<tr>
				<th>생년</th>
				<td>
					<select name="birth">
					<%
						for(int i = 2001; i <= 2010; i++){
					%>
						<option value="<%= i %>" <%= i == vo.getBirth() ? "selected" : "" %>><%= i %></option>
					<%
						}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="남자" <%= vo.getGender().equals("남자") ? "selected" : "" %>>남자
					<input type="radio" name="gender" value="여자" <%= vo.getGender().equals("여자") ? "selected" : "" %>>여자
				</td>
			</tr>
			<tr>
				<th>직업</th>
				<td><input type="text" name="job" value="<%= vo.getJob() %>"></td>
			</tr>
			<tr>
				<th>직업</th>
				<td>
					<input type="text" name="city" value="<%= vo.getCity() %>">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
<%@ include file= "footer.jsp"%>