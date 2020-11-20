package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MovieDAO {
	private static MovieDAO instance = new MovieDAO();
	
	public static MovieDAO getInstance() {
		return instance;
	}
	
	public Connection getConnection() {
		Connection conn = null;
		String id = "hr";
		String pass = "1234";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public ArrayList<MovieVO> getMovieList(int type){
		ArrayList<MovieVO> list = new ArrayList<MovieVO>();
		String sql = "SELECT * FROM movie";
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		if(type > 0)  sql += " WHERE category = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			if(type > 0) pstmt.setInt(1, type);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MovieVO vo = new MovieVO(rs.getInt("movieNo"), rs.getString("movieName"), rs.getString("category"), rs.getInt("runtime"), rs.getString("img"), rs.getString("info"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		
		return list;
	}
	
	public int getMaxNo() {
		int no = 0;
		String sql = "SELECT MAX(movieNo) as movieNo FROM movie";
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) no = rs.getInt("movieNo");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
			close(pstmt);
			close(rs);
		}
		
		return no;
	}
	
	public MovieVO getMovie(int no) {
		MovieVO vo = null;
		String sql = "SELECT movieNo, movieName, decode(category, 01, '액션', 02, '로맨스', 03, '코미디', 04, '스릴러', '애니메이션') as category, runtime, img, info FROM movie WHERE movieNo = ?";
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) vo = new MovieVO(rs.getInt("movieNo"), rs.getString("movieName"), rs.getString("category"), rs.getInt("runtime"), rs.getString("img"), rs.getString("info"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn);
			close(pstmt);
			close(rs);
		}
		
		return vo;
	}
	
	public void close(ResultSet rs) {
		try { if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
	}
	
	public void close(PreparedStatement pstmt) {
		try { if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
	}
	
	public void close(Connection conn) {
		try { if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
	}
}
