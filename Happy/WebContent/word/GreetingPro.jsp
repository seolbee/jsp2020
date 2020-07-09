<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int type = Integer.parseInt(request.getParameter("country"));

	switch(type){
		case 1:
			out.print("<h2>감사합니다.</h2>");
			break;
		case 2:
			out.print("<h2>谢谢</h2>");
			break;
		case 3:
			out.print("<h2>ありがとうございます</h2>");
			break;
	}
%>