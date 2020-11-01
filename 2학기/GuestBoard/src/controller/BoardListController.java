package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;
@WebServlet("/BoardList.do")

public class BoardListController extends HttpServlet{
	//방명록 목록을 보여주는 서블릿
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		getList(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		getList(req, resp);
	}
	
	public void getList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		//1. 한글 인코딩
		//2. 파라미터 가져오기
		//3. DAO, VO 객체 생성 -> vo객체에 담아주기
		BoardDAO instance = BoardDAO.getInstance();
		ArrayList<BoardVO> list = instance.selectAllBoards();
		//공유 - 세션
		req.setAttribute("list", list);
		//4. view page -> selectBoard.jsp
		RequestDispatcher rd = req.getRequestDispatcher("selectBoard.jsp");
		rd.forward(req, resp);
	}
}
