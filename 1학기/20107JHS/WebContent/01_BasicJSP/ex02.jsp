<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.Random"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP 기본 태그</title>
	</head>
	<body>
	<%--
		JSP 기본 태그
		[1] 지시자(directive)
			. 용도 : JSP 페이지의 속성을 지정함
			. 형식 : <%@ %>
			. 종류 : page, include, taglib
		[2] 스크립트릿(scriptlet)
			. 용도 : 자바 코드를 기술함
			. 형식 : <% %>
		[3] 선언식(declaration)
			. 용도 : 전역변수와 메서드를 선언함
			. 형식 : <%! %>
		[4] 표현식(expression)
			. 용도 : 웹 브라우저에 문자열 형태로 출력함
			. 형식 : <%= %>
		[5] 주석(comment)
			. 용도 : JSP 페이지에 설명을 넣음
			. 형식 : <%----%>
	 --%>
	 <%	// 자바의 main() 메서드 영역, service 메서드 안에서 선언됨.
	 	Random ran = new Random();
	 	int num = 10;
	 %>
	 <%! //자바의 멤버변수로 heap 영역, 그래서 main()메서드 영역에 선언된 num과 중복이 되어도 상관없이 선언됨
	     //실제로 선언식은 많이 사용하지 않음.
	     //class 메서드 안에서 선언됨.
	  	int num;
	 %>
	 <%	// 자바의 main() 메서드 영역
	 	
	 %>
	 <%	// 자바의 main() 메서드 영역
	 	// 콘솔에 출력
	 	out.println("안녕!");
	 %>
	 
	 <!-- 브라우저에 출력  -->	
	 
	 
	</body>
</html>