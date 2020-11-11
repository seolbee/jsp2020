package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Book.BookDAO;
import Book.BookVO;

@WebServlet("/insertBook.do")//어노테이션으로 insertBook.do로 서블릿 매핑을 시켜준다.

public class InsertBook extends HttpServlet{//서블릿으로 만들기 위해서 HttpServlet클래스를 상속받는다.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {//get방식 요청
		insertBook(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		insertBook(req, resp);
	}
	
	public void insertBook(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=utf-8;");
		BookDAO instance = BookDAO.getInstance();
		int bcode = instance.getMaxNo();
		BookVO vo = new BookVO(bcode, "", "", -1, -1, null);
		req.setAttribute("book", vo);
		RequestDispatcher rd = req.getRequestDispatcher("insertBook.jsp?type=insert");
		rd.forward(req, res);
	}
}
