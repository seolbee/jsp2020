<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<pre>
		1. 숫자 2개를 1 - 10 사이의 랜덤 숫자를 받아서 그 두 숫자의 덧셈 게임을 5회만 반복한다.
		2. 한 문제의 정답을 맞추면 20점 입니다.
		3. test02pro페이지에 사용자의 정답을 비교해서 
			정답입니다 / 오답입니다를 출력(alert)하고 test02 페이지로 자동 돌아오게 만든다
		4. 게임 종료 후 성적을 출력한다.
		5. 게임 종류 후 다시시작하는 버튼을 만든다.
		세션을 사용해서 점수와 횟수를 저장한다.
	</pre>
	
	<%
		int cnt = 0;
		int score = 0;
		
		if(session.getAttribute("cnt") != null &&  session.getAttribute("score")!= null){
			cnt = (int) session.getAttribute("cnt");
			score = (int) session.getAttribute("score");
			
		} else {
	
			session.setAttribute("cnt", cnt);
			session.setAttribute("score", score);
		}
		
		if(cnt >= 5){
			session.invalidate();
	%>
		<script>
			alert("문제가 끝났습니다.");
		</script>
		<h1> 점수 : <%= score * 20 %></h1>
		<button onclick="location.href='ranNum.jsp'"> 다시 시작하기 </button>
	<%
		} else {
			Random ran = new Random();
			int num1 = ran.nextInt(10) + 1;
			int num2 = ran.nextInt(10) + 1;
	%>
	
	<h1> 게임 시작 </h1>
	<h1> 반복한 횟수 : <%= cnt %></h1>
	<h1> 점수 : <%= score * 20 %></h1>
	
	<h1> <%= num1 %> + <%= num2 %> = ?</h1>
	
	<form action="ranNumPro.jsp" method="post">
		<input type="hidden" value="<%= num1%>" name="num1">
		<input type="hidden" value="<%= num2 %>" name="num2">
		<input type="number" name="answer">
		<input type="submit" value="확인">
	</form>
	
	<%
		}
	%>
</body>
</html>