package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Book.BookDAO;
import Book.BookVO;

@WebServlet("/selectBook.do")//어노테이션으로 selectBook.do로 서블릿을 매핑한다.

public class BookListController extends HttpServlet{//서블릿으로 만들어주기 위해 HttpServlet클래스를 상속 받는다.
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {//get 요청을 처리하는 매서드 //파라매터로 HttpServletRequest객체와 HttpServletResponse객체를 받는다.
		getList(req, resp);//get방식으로 selectBook.do요청이 온다면 getList 매서드를 실행
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {//post 요청을 처리하는 매서드 //파라매터로 HttpServletRequest객체와 HttpServletResponse객체를 받는다.
		getList(req, resp);//post방식으로 selectBook.do요청이 온다면 getList 매서드를 실행 
	}
	
	public void getList(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		BookDAO instance = BookDAO.getInstance();
		ArrayList<BookVO> list = instance.getList();
		req.setAttribute("list", list);
		
		RequestDispatcher rd = req.getRequestDispatcher("selectBook.jsp");
		rd.forward(req, res);
	}
}
