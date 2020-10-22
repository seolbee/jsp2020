<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file= "header.jsp"%><!--  header.jsp include 하기 -->
	<form method="post" action="insertMemberPro.jsp" name="regForm"><!-- form 태그 선언 -->
		<table border="1" style="width:400">
			<tr>
				<td colspan="2" align="center"><b>회원 가입 정보 입력</b></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" required></td><!-- required: 입력란이 비어있을 시 전송을 막고 입력하라고 알림창 띄움 -->
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" required><!-- 아이디 중복 체크 -->
					<input type="button" value="중복확인" onclick="idCheck(this.form.id.value)"> <!-- button을 누를 시 function idCheck로 id값을 넘김-->
				</td>
			</tr>
			<tr>
				<th> 비밀번호 </th>
				<td>
					<input type="password" name="pass" required>
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" name="confirm_pass" required>
					<input type="button" value="비밀번호 확인" onclick="pass_check(this.form.pass, this.form.confirm_pass)">
					<!-- button 클릭시 function pass_check에 비밀번호와 비밀번호 확인 값이 전달되면서 함수 호출 -->
				</td>
			</tr>
			<tr>
				<th>생년(4자리)</th>
				<td>
					<select name="birth">
						<%
							for(int i = 2001; i<= 2010; i++){//int i = 2001에서 부터 2010까지 돌아감.
						%>
						<option value="<%=i %>"><%= i %></option><!-- option value와 태그에 i값을 넣어줌 -->
						<%
							}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="m" required>남자<!-- value에 m을 넣음 보여줄 땐 남자로 -->
					<input type="radio" name="gender" value="f" required>여자<!-- value에 f를 넣음 보여줄 땐 여자로 -->
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
		function idCheck(id){//아이디 중복 확인 체크하는 함수
			if(id == ""){// 아이디가 공백인지 체크
				alert("아이디를 입력해주세요");//공백이면 경고창 띄우기
				document.regForm.focus();//아이디 입력창 포커싱
			} else {
				url = "idCheck.jsp?id="+id;
				window.open(url, "post", "width=400,height=200");//window 창을 열어서 idCheck.jsp로 이동
				
			}
		}
		
		function pass_check(pass, confirm_pass){//비밀번호 확인 함수
			if(pass.value !== confirm_pass.value){//비밀번호가 같은지 확인
				alert("비밀번호가 틀립니다.");//비밀번호가 맞지 않다면 경고창 출력
				pass.value = "";//password 입력창 비우기
				confirm_pass.value = "";//confirm 패스워드창 비우기
			} else {
				alert("비밀번호가 일치합니다.");//일치하다는 경고창 출력
			}
		}
	</script>
<%@ include file= "footer.jsp"%><!--  footer.jsp include 하기 -->