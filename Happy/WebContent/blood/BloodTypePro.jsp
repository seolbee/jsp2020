<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>혈액형에 따른 성격 판단</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("user");
		String bType = request.getParameter("bType");
	%>
		<h1><%= name %>님</h1>
	<%
		
		switch(bType){
			case "A":
				//브라우저에 html 태그
			%>
				<pre>
					<b>A형은 대표적으로 소심한 성격!</b><br>
					고집과 자기주장이 없어 답답한 성격이에요
					답답할 정도로 표현을 못하는 분들도 있죠
					그러므로 마음을 쉽게 잘 열지 않고
					상대방에게 누구보다 마음을 따뜻하게 잘 쓰는 성격이다.
				</pre>
			<%
				break;
			case "B":
			%>
				<%@ include file="B.jsp" %>
			<%
				break;
			case "O":
			%>
				<jsp:forward page="O.jsp"></jsp:forward>
			<%
				break;
			case "AB":
			%>
					<jsp:include page="AB.jsp"></jsp:include>
			<%
				break;
		}
	%>
</body>
</html>