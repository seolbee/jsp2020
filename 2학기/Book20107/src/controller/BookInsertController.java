package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.SendResult;

import Book.BookDAO;

@WebServlet("/AddBook.do")
public class BookInsertController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		bookInsert(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		bookInsert(req, resp);
	}
	
	
	public void bookInsert(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		int bcode = Integer.parseInt(req.getParameter("bcode"));
		String btitle = req.getParameter("btitle");
		String bwriter = req.getParameter("bwriter");
		int bpub = Integer.parseInt(req.getParameter("bpub"));
		int bprice = Integer.parseInt(req.getParameter("bprice"));
		String bdate = req.getParameter("bdate");
		BookDAO instance = BookDAO.getInstance();
		int cnt = instance.insertBook(bcode, btitle, bwriter, bpub, bprice, bdate);
		if(cnt > 0) instance.sendMsg(out, "도서 등록 성공", "selectBook.do");
		else instance.errorMsg(out, "도서 등록 실패");
	}
}
