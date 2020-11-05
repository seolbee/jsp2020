<%@page import="Book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

<%
	BookDAO instance = BookDAO.getInstance();
	int bcode = instance.getMaxNo();
%>

<form action="AddBook.do" method="post">
	<table border=1 style="text-align: center;">
		<tr>
			<th>도서코드</th>
			<td><input type="text" name="bcode" value="<%= bcode %>" readonly/></td>
		</tr>
		<tr>
			<th>도서제목</th>
			<td><input type="text" name="btitle" required></td>
		</tr>
		<tr>
			<th>도서저자</th>
			<td><input type="text" name="bwriter" required /></td>
		</tr>
		<tr>
			<th>출판사코드</th>
			<td>
				<select name="bpub" required>
					<option value="1001">양영디지털</option>
					<option value="1002">북스미디어</option>
					<option value="1003">한빛아카데미</option>
					<option value="1004">이지스</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="number" name="bprice" required></td>
		</tr>
		<tr>
			<th>출간날짜</th>
			<td><input type="text" name="bdate"  placeholder="'ex)2020-11-05' 앞의 형식을 지켜주세요" required></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="등록"/><input type="reset" value="재작성" /></td>
		</tr>
	</table>
</form>

<%@ include file ="footer.jsp" %>