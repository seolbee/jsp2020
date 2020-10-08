<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file= "header.jsp"%>
	<form method="post" action="insertMemberPro.jsp" name="regForm">
		<table border="1" style="width:400">
			<tr>
				<td colspan="2" align="center"><b>회원 가입 정보 입력</b></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" required></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" required>
					<input type="button" value="중복확인" onclick="idCheck(this.form.id.value)">
				</td>
			</tr>
			<tr>
				<th> 비밀번호 </th>
				<td>
					<input type="password" name="pass">
				</td>
			</tr>
			<tr>
				<th>생년(4자리)</th>
				<td>
					<select name="birth">
						<%
							for(int i = 2001; i<= 2010; i++){
						%>
						<option value="<%=i %>"><%= i %></option>
						<%
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="남자" required>남자
					<input type="radio" name="gender" value="여자" required>여자
				</td>
			</tr>
			<tr>
				<th>직업</th>
				<td><input type="text" name="job" required></td>
			</tr>
			<tr>
				<th>도시</th>
				<td>
					<input type="text" name="city" required>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="가입">
					<input type="reset" value="재작성">
				</td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		function idCheck(id){
			if(id == ""){
				alert("아이디를 입력해주세요");
				document.regForm.focus();
			} else {
				url = "idCheck.jsp?id="+id;
				window.open(url, "post", "width=400,height=200");
			}
		}
	</script>
<%@ include file= "footer.jsp"%>