<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p> ** 국가별 감사인사 **</p>
	한국어 : 
	<jsp:include page="GreetingPro.jsp">
		<jsp:param value="1" name="country"/>
	</jsp:include>
	
	<br> 중국어 : 
	<jsp:include page="GreetingPro.jsp">
		<jsp:param value="2" name="country"/>
	</jsp:include>
	
	<br> 일본어 : 
	<jsp:include page="GreetingPro.jsp">
		<jsp:param value="3" name="country"/>
	</jsp:include>
</body>
</html>