<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "header.jsp" %>

<form action="AddBook.do">
	<table border=1>
		<tr>
			<th>도서코드</th>
			<td><input type="text" name="bcode" readonly/></td>
		</tr>
		<tr>
			<th>도서제목</th>
			<td><input type="text" name="btitle"/></td>
		</tr>
		<tr>
			<th>출판사코드</th>
			<td>
				<select name="bpub">
					<option value="1001">양영디지털</option>
					<option value="1002">북스미디어</option>
					<option value="1003">한빛아카데미</option>
					<option value="1004">이지스</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="number" name="bprice"/></td>
		</tr>
		<tr>
			<th>출간날짜</th>
			<td><input type="date" name="bdate"/></td>
		</tr>
		<tr>
			<input type="submit" value="등록" />
			<input type="reset" value="재작성" />
		</tr>
	</table>
</form>

<%@ include file ="footer.jsp" %>