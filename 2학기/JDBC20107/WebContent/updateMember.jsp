<%@page import="member.MemberVO"%><!-- member.MemberVO 객체 import -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file= "header.jsp"%><!-- header.jsp include -->
<%
	MemberVO vo = instance.getAMember(Integer.parseInt(request.getParameter("memno")));
	//1. 수정하려는 유저의 회원번호를 가져옴
	//2. memberDAO에 있는 getAMember()를 통해 수정하는 유저의 정보를 가져옴
	//3. vo객체에 넣어준다.
%>
	<form action="updateMemberPro.jsp" method="post">
		<table border="1" style="width:400">
			<tr>
				<td colspan="2" align="center"><b>회원 수정 정보 입력</b></td>
			</tr>
			<tr>
				<th>회원번호</th>
				<td>
					<input type="text" name="memno" value="<%= vo.getMemno() %>" readonly><!-- 유저의 memno를 input 창에 넣어줌 -->
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" value="<%=  vo.getName() %>" disabled><!-- 유저의 name을 input 창에 넣어줌 -->
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" value="<%= vo.getId() %>" disabled><!-- 유저의 id를 input 창에 넣어줌  -->
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pass" value="<%= vo.getPassword() %>"><!-- 유저의 password를 input 창에 넣어줌 -->
				</td>
			</tr>
			<tr>
				<th>생년</th>
				<td>
					<select name="birth">
					<%
						for(int i = 2001; i <= 2010; i++){//for문으로 option 태그들을 넣어줌
					%>
						<option value="<%= i %>" <%= i == vo.getBirth() ? "selected" : "" %>><%= i %></option><!-- i의 값이 유저의 birth와 같을 시 selected 속성을 부여 -->
						<!-- i의 값들을 각각 value와 text로 넣어줌 -->
					<%
						}
					%>
					</select>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="m" <%= vo.getGender().equals("m") ? "checked" : "" %>>남자<!-- 유저의 gender 값이 m이면 value가 m인 radio에 checked 속성 부여 -->
					<input type="radio" name="gender" value="f" <%= vo.getGender().equals("f") ? "checked" : "" %>>여자<!-- 유저의 gender 값이 f이면 value가 f인 radio에 checked 속성 부여 -->
				</td>
			</tr>
			<tr>
				<th>직업</th>
				<td><input type="text" name="job" value="<%= vo.getJob() %>"></td><!-- 유저의 job을 input 창에 넣어줌 -->
			</tr>
			<tr>
				<th>도시</th>
				<td>
					<input type="text" name="city" value="<%= vo.getCity() %>"><!-- 유저의 city를 input 창에 넣어줌 -->
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