<%@page import="Book.BookVO"%>
<%@page import="Book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

<%
	BookVO vo = (BookVO) request.getAttribute("book");
%>

<form action="<%= request.getParameter("type").equals("insert") ? "AddBook.do" : "EditBook.do" %>" method="post">
	<table border=1 style="text-align: center;">
		<tr>
			<th>도서코드</th>
			<td><input type="text" name="bcode" value="<%= vo.getBcode() %>" readonly/></td>
		</tr>
		<tr>
			<th>도서제목</th>
			<td><input type="text" name="btitle" value="<%= vo.getBtitle().isEmpty() ? "" : vo.getBtitle() %>" required></td>
		</tr>
		<tr>
			<th>도서저자</th>
			<td><input type="text" name="bwriter" value="<%= vo.getBwriter().isEmpty() ? "" : vo.getBwriter() %>" required /></td>
		</tr>
		<tr>
			<th>출판사코드</th>
			<td>
				<select name="bpub" required>
					<option value="1001" <%= vo.getBpub() == 1001 ? "selected" : "" %>>양영디지털</option>
					<option value="1002" <%= vo.getBpub() == 1002 ? "selected" : "" %>>북스미디어</option>
					<option value="1003" <%= vo.getBpub() == 1003 ? "selected" : "" %>>한빛아카데미</option>
					<option value="1004" <%= vo.getBpub() == 1004 ? "selected" : "" %>>이지스</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="number" name="bprice" value="<%= vo.getBprice() >= 0 ? vo.getBprice() : "" %>" required></td>
		</tr>
		<tr>
			<th>출간날짜</th>
			<td><input type="text" name="bdate" value="<%= vo.getBdate() == null ? "" : vo.getBdate() %>"  placeholder="ex)2020-11-05 앞의 형식을 지켜주세요" required></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="등록"/><input type="reset" value="재작성" /></td>
		</tr>
	</table>
</form>

<%@ include file ="footer.jsp" %>