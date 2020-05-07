<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- type = text -->
	<form action="action.do" method="get">
		이름 : <input type="text" name="st_name"><br>
		<input type="submit">
	</form>
	<!-- type=password -->
	<form action="action.do" method="post">
		비밀번호<input type="password" name="password" value="pwd">
		<br>
		<input type="submit">
	</form>
	<!-- type=checkbox -->
	<h1>체크박스 </h1>
	<p>다음 중 재밌고 내용이 알찬 강좌를 모두 골라주세요 </p>
	<form action="action.do">
		<input type="checkbox" name="lecture" value="html" checked> HTML<br>
		<input type="checkbox" name="lecture" value="css"> CSS <br>
		<input type="checkbox" name="lecture" value="java">JAVA <br>
		<input type="checkbox" name="lecture" value="cpp"> C++ <br>
	</form>
	
	<!-- type=radio -->
	<form action="action.do" method="get">
		당신의 나이대를 골라보세요<br>
		<input type="radio" name="ages" value="teenage" checked>10대 <br>
		<input type="radio" name="ages" value="twenties">20대 <br>
		<input type="radio" name="ages" value="thirties">30대 <br>
		<input type="radio" name="ages" value="forties">40대 이상<br>
		<input type="submit">
	</form>
	
	<!-- button태그 -->
	
	<button type="button" onclick="alert('Hello World!')">클릭해 보세요!</button>
	
	<!-- type=submit -->
	<h1> 전송 버튼 </h1>
	<form action="action.do">
		어릴 때 자신의 별명을 적어주세요 : <br>
		<input type="text" name="nickname" value="별명">
		<br><br>
		<input type="submit" value="전송">
	</form>
	<p>별명을 적은 후 전송 버튼을 눌러보세요!</p>
	
	<!-- type="reset" -->
	<form action="exam" method="get">
		이름 : <input	 type="text" name="st_name"><br>
		학번 : <input type="text" name="st_id"><br>
		학과 : <input type="text" name="department"> <br>
		<input type="submit">
		<input type="reset">
	</form>
	
	<!-- type = hidden -->
	<form action="action_target" method="get">
		아이디 : <input type="text" name="user_id"><br>
		비밀번호 : <input type="password" name="user_pw"><br>
		<input type="hidden" id="member_id" name="m_id" value="qwerty">
		<input type="submit">
	</form>
	
	<!-- type="file" -->
	<form action="write.jsp" method="post" enctype="multipart/form-data">
		사진 : <input type="file" name="myfile"><br>
		<input type="submit">
	</form>
	
	<!-- <select> 태그 -->
	<select name="fruit">
		<option value="apple">사과
		<option value="orange" selected> 귤
		<option value="strawberry"> 딸기
		<option value="peach"> 복숭아
	</select>
	
	<!-- <textarea>태그 -->
	<h1>문장 입력</h1>
	<p>여러분의 부모님께 하고 싶은 말을 적어보세요. </p>
	<textarea name="message" rows="5" cols="30">여기에 적으세요 </textarea>
	
	<!-- type = date -->
	<form>
		이 수업을 처음 들은 날을 기억하시나요?<br><br>
		<input type="date" name="startday">
		<input type="submit" value="전송">
	</form>
	
</body>
</html>