<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 	request.setCharacterEncoding("UTF-8"); %>
	
	<%
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		int answer = Integer.parseInt(request.getParameter("answer"));
		
		int cnt = (int) session.getAttribute("cnt");
		cnt++;
		session.setAttribute("cnt", cnt);
		
		int score = (int) session.getAttribute("score");
		
		if(answer == (num1 + num2)){
			score++;
			session.setAttribute("score", score);
	%>
	
	<script>
		alert("정답입니다.");
		location.href="ranNum.jsp";
	</script>
	
	<%
		} else {
	%>
	
	<script>
		alert("오답입니다.");
		location.href="ranNum.jsp";
	</script>
	
	<%
		}
	%>
</body>
</html>