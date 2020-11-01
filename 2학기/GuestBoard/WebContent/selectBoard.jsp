<%@page import="board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  El, JSTL -->
<%@ include file = 'header.jsp' %>
	<%
		ArrayList<BoardVO> list = (ArrayList<BoardVO>) request.getAttribute("list");
		// for(int i = 0; i< list.size(); i++){
			// BoardVO vo = list.get(i);
	%>
	<!--		<hr style="border: 2 solid #000">
			<%-- vo.getBoardNum() --%>번째 글
		작성날짜 : <%-- vo.getWriteDate() --%><br>
		작성자 : <%-- vo.getName() --%><br>
		제목 : <%-- vo.getTitle() --%><br>
		내용 : <%-- vo.getContent() --%><br>
	-->
	<%--
		}
	--%>
	<c:forEach var="board" items="${list}">
	${board.boardNum} 번째 글 &nbsp;&nbsp;&nbsp; 작성날짜 : ${board.writeDate}<br>
	작성자 : ${board.name} <br> 
	제목 : ${board.title}<br>	
	내용 : ${board.content}<br>
	<hr style="border:solid 2px">
	</c:forEach>
	
<%@ include file="footer.jsp" %>