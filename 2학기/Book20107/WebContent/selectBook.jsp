<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Book.BookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "header.jsp" %>

<%
	ArrayList<BookVO> list = (ArrayList<BookVO>) request.getAttribute("list");
	DecimalFormat formatter = new  DecimalFormat("###,###");
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
				<td><a href="updateBook.jsp?bcode=${book.bcode}">${book.bcode}</a></td>
				<td>${book.title}</td>
				<td>${book.bwriter}</td>
				<td>${book.bpub }</td>
				<td>${formatter.format(book.bprice)}</td>
				<td>${book.bdate}</td>
				<td><a href="deleteBook.jsp?bcode=${book.bcode}">${book.bcode }</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>


<%@ include file = "footer.jsp" %>