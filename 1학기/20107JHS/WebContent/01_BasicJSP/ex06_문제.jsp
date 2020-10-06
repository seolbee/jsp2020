<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>배열 문제</title>
	</head>
	<body>
		<% int[] arr = new int[5]; %>
		
		<%--
			문제 1) 10부터 50까지 arr 배열에 저장
			정답 1) 10 20 30 40 50
		 --%>
		<%
			for(int i = 0; i < arr.length; i++){
				arr[i] = 10 * (i+1);
		%>
				<%= arr[i] %>
		<%
			}
		 %>
		<br />
		<%--
			문제 2) 4의 배수만 출력
			정답 2) 20 40
		 --%>
		<%--
			문제 3) 4의 배수의 합 출력
			정답 3) 60
		 --%>
		<%--
			문제 4) 4의 배수의 개수 출력
			정답 4) 2
		 --%>
		<%--
			문제 5) 짝수의 개수 출력
			정답 5) 5
		 --%>
	</body>
</html>