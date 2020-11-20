package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.MovieDAO;
import movie.MovieVO;

@WebServlet("/viewMovie.do")
public class viewMovieController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		viewMovie(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		viewMovie(req, resp);
	}
	
	public void viewMovie(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html; charset=utf-8;");
		PrintWriter out = res.getWriter();
		
		int no = Integer.parseInt(req.getParameter("no"));
		
		MovieDAO instance = MovieDAO.getInstance();
		
		MovieVO vo = instance.getMovie(no);
		
		RequestDispatcher rd = req.getRequestDispatcher("viewMovie.jsp");
		
		req.setAttribute("movie", vo);
		rd.forward(req, res);
		
	}
}
