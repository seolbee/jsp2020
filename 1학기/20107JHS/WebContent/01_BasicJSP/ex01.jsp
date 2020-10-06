<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 간단한 정리</title>
</head>
<body>
		JSP는 Java Server Page의 약자로서<br />
		HTML 태그에 자바로 프로그래밍하여 브라우저에 보여주는 특별한 페이지이다. <br />
<pre>
HTML 파일에는 자바 코드를 작성할 수 없기 때문에
자바 코드를 넣어야 한다면 JSP 페이지로 만들어야 한다.
    JSP 특징
동적 웹어플리케이션 컴포넌트
<!-- 확장자는 jsp -->
클라이언트의 요청에 동적으로 동작을 하며, 응답은 html로 응답을 한다.
jsp 파일은 서블릿으로 변환되어 실행된다.
    MVC 패턴에서 view로 이용된다.</pre>
<hr/>
JSP 표현식으로 3 + 1의 결과를 출력하면  <%= 3 + 1 %> 입니다.	
</body>
</html>