package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class MemberDAO {
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	public Connection getConnection() {
		String id = "hr";
		String password = "hr";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.dirver.OracleDriver");
			conn = DriverManager.getConnection(url);
			System.out.println("오라클 접속 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public int getMaxNo() {
		ArrayList<MemberVO> list = this.selectMembers();
		int no = 0;
		for(MemberVO vo : list) {
			int voNum = vo.getNum();
			if(voNum > no) {
				no = voNum;
			}
		}
		return no;
	}
	
	public ArrayList<MemberVO> selectMembers(){
		ArrayList<MemberVO> list = new ArrayList<>();
		Connection conn = this.getConnection();
		String sql = "SELECT * FROM MEMBER_TBL";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				String id = rs.getString("id");
				String password = rs.getString("pass");
				int birth = rs.getInt("birth");
				String gender = rs.getString("gender");
				String job = rs.getString("job");
				String city = rs.getString("city");
				Date registeDate = rs.getDate("joinDate");
				MemberVO vo = new MemberVO(num, name, id, password, birth, gender, job, city, registeDate);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close(rs, pstmt, conn);
		}
		return list;
	}
	
	public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			if(pstmt != null) {
				pstmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			if(conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int insertMember(int num, String name, String id, String password, int birth, String gender, String job, String city) {
		int cnt = 0;
		Connection conn = getConnection();
		String sql = "INSERT INTO MEMBER_TBL VALUES(?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, name);
			pstmt.setString(3, id);
			pstmt.setString(4, password);
			pstmt.setInt(5, birth);
			pstmt.setString(6, gender);
			pstmt.setString(7, job);
			pstmt.setString(8, city);
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}
		return cnt;
	}
	
	public int updateMember(int num, String name, String id, String password, int birth, String gender, String job, String city) {
		int cnt = 0;
		Connection conn = getConnection();
		String sql = "UPDATE MEMBER_TBL SET name = ?, id = ?, password = ?, birth = ?, gender = ?, job = ?, city = ? WHERE num = ?";
		
		return cnt;
	}
}
