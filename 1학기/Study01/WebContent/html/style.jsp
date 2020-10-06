<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 기본요소 살펴보기</title>
	<style type="text/css">
		p {
			color = #00FF00;
			font-size = 15px;
		}
		
		.addP{
			font-family:맑은고딕;
		}
		#change_color{
			color: #0000FF;
		}
	</style>
</head>
<body>
	<p> 이 글자는 green 색이고, 크기는 <span id="change_color"> 15</span>입니다.</p>
	<p class="addP"> 이 글자는 blue 색이고, 크기는 <span id="change_color"> 15</span>, 맑은 고딕 글꼴입니다.
	</p>
</body>
</html>