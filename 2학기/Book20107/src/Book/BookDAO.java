package Book;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDAO {
	private static BookDAO instance = new BookDAO();
	
	public static BookDAO getInstance() {
		return instance;
	}
	
	public Connection getConnection() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String password = "hr";
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public int getMaxNo() {
		int no = 0;
		String sql = "SELECT MAX(bcode) as bcode FROM BOOK_TBL";
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) no = rs.getInt("bcode");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		return ++no;
	}
	
	public void close(ResultSet rs) {
		try {if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
	}
	
	public void close(PreparedStatement pstmt) {
		try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
	}
	
	public void close(Connection conn) {
		try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
	}
	
	public ArrayList<BookVO> getList(){
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		String sql = "SELECT * FROM BOOK_TBL ORDER BY BCODE ASC";
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookVO vo = new BookVO(rs.getInt("bcode"), rs.getString("btitle"), rs.getString("bwriter"), rs.getInt("bpub"), rs.getInt("bprice"), rs.getDate("bdate"));
				list.add(vo);
			}
		} catch (Exception e) {
			close(rs);
			close(pstmt);
			close(conn);
		}
		return list;
	}
	
	public int insertBook(int bcode, String btitle, String bwriter, int bpub, int bprice, String bdate) {
		int cnt = 0;
		String sql = "INSERT INTO BOOK_TBL VALUES(?, ?, ?, ?, ?, ?)";
		Connection conn = getConnection();
		Date date = Date.valueOf(bdate);
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bcode);
			pstmt.setString(2, btitle);
			pstmt.setString(3, bwriter);
			pstmt.setInt(4, bpub);
			pstmt.setInt(5,  bprice);
			pstmt.setDate(6, date);
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(conn);
		}
		return cnt;
	}
	
	public BookVO searchBook(int bcode) {
		String sql = "SELECT * FROM BOOK_TBL WHERE BCODE = ?";
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BookVO vo = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bcode);
			rs = pstmt.executeQuery();
			if(!rs.next()) vo = new BookVO(rs.getInt("bcode"), rs.getString("btitle"), rs.getString("bwriter"), rs.getInt("bpub"), rs.getInt("bprice"), rs.getDate("bdate"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		return vo;
	}
	
	public void sendMsg(PrintWriter out, String msg, String url) {
		out.println("<script>");
		out.println("alert('" + msg +"');");
		out.println("location.href='"+url+"';");
		out.println("</script>");
	}
	
	public void errorMsg(PrintWriter out, String msg) {
		out.println("<script>");
		out.println("alert('" + msg +"');");
		out.println("history.back();");
		out.println("</script>");
	}
}
