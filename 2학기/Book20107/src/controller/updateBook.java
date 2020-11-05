package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Book.BookDAO;
import Book.BookVO;

@WebServlet("updateBook.do")

public class updateBook extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		updateBook(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		updateBook(req, resp);
	}
	
	public void updateBook(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=utf-8;");
		int bcode = Integer.parseInt(req.getParameter("bcode"));
		BookDAO instance = BookDAO.getInstance();
		BookVO vo = instance.searchBook(bcode);
		RequestDispatcher rd = req.getRequestDispatcher("insertBook?type='update'.jsp");
		req.setAttribute("book", vo);
		rd.forward(req, res);
	}
}
