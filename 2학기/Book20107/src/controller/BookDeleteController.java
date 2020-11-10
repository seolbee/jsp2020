package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Book.BookDAO;

@WebServlet("/deleteBook.do")

public class BookDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		deleteBook(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		deleteBook(req, resp);
	}
	
	public void deleteBook(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		int bcode = Integer.parseInt(req.getParameter("bcode"));
		BookDAO instance = BookDAO.getInstance();
		int cnt = instance.deleteBook(bcode);
		if(cnt > 0) instance.sendMsg(out, "도서 삭제 완료", "selectBook.do");
		else instance.errorMsg(out, "도서 삭제 실패 ");
	}
}
