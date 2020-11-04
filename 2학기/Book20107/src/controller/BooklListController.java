package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Book.BookDAO;
import Book.BookVO;

@WebServlet("/selectBook.do")

public class BooklListController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		getList(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		getList(req, resp);
	}
	
	public void getList(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		BookDAO instance = BookDAO.getInstance();
		ArrayList<BookVO> list = instance.getList();
		
	}
}
