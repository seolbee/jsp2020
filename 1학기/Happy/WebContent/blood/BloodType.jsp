<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>혈액형에 따른 성격 출력</title>
	</head>
	<body>
		<h3>혈액형을 입력해주세요</h3>
		<form action="BloodTypePro.jsp" method="post">
			이름 : <input type="text" name="user"><br>
			<input type='radio' name="bType" value="A"> A형
			<input type='radio' name="bType" value="B"> B형 
			<input type="radio" name="bType" value="AB"> AB형 
			<input type='radio' name="bType" value="O"> O형 
			<br>
			<input type="submit" value="확인">
			<input type="reset" value="취소">
		</form>
	</body>
</html>