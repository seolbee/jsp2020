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

@WebServlet("/updateBook.do")//어노테이션으로 updateBook.do로 서블릿 매핑

public class updateBook extends HttpServlet{//서블릿으로 만들어주기 위해 HttpServlet클래스를 상속 받는다.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {//get전송 방식 처리 매서드
		updateBook(req, resp);//get전송 방식 으로 updateBook.do로 요청이 온다면 updateBook()메서드를 실행
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {//post전송 방식 처리 매서드
		updateBook(req, resp);//post전송 방식으로 updateBook.do로 요청이 온다면 updateBook() 매서드를 실행
	}
	
	public void updateBook(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=utf-8;");
		int bcode = Integer.parseInt(req.getParameter("bcode"));
		BookDAO instance = BookDAO.getInstance();
		BookVO vo = instance.searchBook(bcode);
		RequestDispatcher rd = req.getRequestDispatcher("insertBook.jsp?type=update");
		req.setAttribute("book", vo);
		rd.forward(req, res);
	}
}
