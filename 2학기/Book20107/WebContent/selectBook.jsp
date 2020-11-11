<%@page import="java.util.ArrayList"%>
<%@page import="Book.BookVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "header.jsp" %>

<%
	ArrayList<BookVO> list = (ArrayList<BookVO>) request.getAttribute("list");//request.getAttribute()로 session에 있는 list를 가져온다.
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
		 <!--  c:forEach var = '변수명' items='배열 또는 리스트'-->
			<tr>
				<td><a href="updateBook.do?bcode=${book.bcode}">${book.bcode}</a></td><!-- ${출력할 변수} bcode를 출력 -->
				<td>${book.btitle}</td><!-- btitle 출력 -->
				<td>${book.bwriter}</td><!-- bwriter 출력 -->
				<td>
					<c:set var="bpub" value="${book.bpub}"/><!-- jstl 안에 쓰일 변수 선언 -->
					<c:choose><!-- jstl choose 태그 = java switch -->
						<c:when test="${bpub == 1001}"><!-- c:when test='${조건문 입력}' -->
							양영디지털<!-- 참일 경우 -->
							<!-- bpub가 1001일경우 -->
						</c:when>
						<c:when test="${bpub == 1002}">
							북스미디어
							<!-- bpub가 1002일경우 -->
						</c:when>
						<c:when test="${bpub == 1003 }">
							한빛아카데미
							<!-- bpub가 1003일경우 -->
						</c:when>
						<c:when test="${bpub == 1004}">
							이지스
							<!-- bpub가 1004일경우 -->
						</c:when>
					</c:choose>
				</td>
				<td><fmt:formatNumber value="${book.bprice}" groupingUsed="true"/></td><!-- formatter 태그 -->
				
				<td><fmt:formatDate value="${book.bdate}" pattern="yyyy년 MM월 dd일"/></td>
				<td><a href="deleteBook.jsp?bcode=${book.bcode}">삭제</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>


<%@ include file = "footer.jsp" %>