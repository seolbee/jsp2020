<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Book.BookVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "header.jsp" %>

<%
	ArrayList<BookVO> list = (ArrayList<BookVO>) request.getAttribute("list");
%>

<table border=1>
	<thead>
		<tr>
			<th>도서코드</th>
			<th>도서제목</th>
			<th>도서저자</th>
			<th>출판사</th>
			<th>가격</th>
			<th>출간날짜</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="book" items="${list}">
			<tr>
				<td><a href="updateBook.do?bcode=${book.bcode}">${book.bcode}</a></td>
				<td>${book.btitle}</td>
				<td>${book.bwriter}</td>
				<td>
					<c:set var="bpub" value="${book.bpub}"/>
					<c:choose>
						<c:when test="${bpub == 1001}">
							양영디지털
						</c:when>
						<c:when test="${bpub == 1002}">
							북스미디어
						</c:when>
						<c:when test="${bpub == 1003 }">
							한빛아카데미
						</c:when>
						<c:when test="${bpub == 1004}">
							이지스
						</c:when>
					</c:choose>
				</td>
				<td><fmt:formatNumber value="${book.bprice}" groupingUsed="true"/></td>
				<td><fmt:formatDate value="${book.bdate}" pattern="yyyy년 MM월 dd일"/></td>
				<td><a href="deleteBook.jsp?bcode=${book.bcode}">삭제</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>


<%@ include file = "footer.jsp" %>