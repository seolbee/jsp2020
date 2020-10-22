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
		String id = "hr";//데이터베이스 계정 아이디
		String password = "hr"; //데이터베이스 계정 비밀번호
		String url = "jdbc:oracle:thin:@localhost:1521:xe";//데이터베이스 URL
		Connection conn = null;//Connection 객체
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");//데이터베이스 드라이버 설정
			conn = DriverManager.getConnection(url, id, password);//데이터 베이스 연결
			System.out.println("오라클 접속 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;//Connection 객체 반환
	}
	
	public int getMaxNo() {
		Connection conn = getConnection();//Connection 객체 가져오기
		String sql = "SELECT MAX(memno) as memno FROM MEMBER_TBL";//회원 번호 중 가장 큰 번호 찾아서 가져오기
		PreparedStatement pstmt = null;//preparedStatement 객체 선언
		ResultSet rs = null;//ResultSet 객체 선언
		int no = -1;//no변수 선언
		try {
			pstmt = conn.prepareStatement(sql);//preparestatement객체 저장
			rs = pstmt.executeQuery();//executeQuery로 실행된 결과 rs에 저장
			if(rs.next()) no = rs.getInt("memno");//rs.next()로 결과 값이 있을 시 rs.getInt("memno")로 no 값 가져오기
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);//close 메서드로 객체들 반환
		}
		return no;
	}
	
	public ArrayList<MemberVO> selectMembers(){
		ArrayList<MemberVO> list = null;//sql에 행을 저장하기 위해 MemberVO로 list를 만든다.
		Connection conn = this.getConnection();//conn 객체 반환
		String sql = "SELECT * FROM MEMBER_TBL ORDER BY memno asc";//table 전체 행을 가져옴.
		PreparedStatement pstmt = null;//preparedstatement 변수를 선언
		ResultSet rs = null;//ResultSet 변수 선언
		try {
			list = new ArrayList<>();
			pstmt = conn.prepareStatement(sql);//prepareStatement변수에 넣어줌
			rs = pstmt.executeQuery();//sql 실행시 반환되는 값을 넣어줌
			
			while(rs.next()) {//rs.next() 값이 없으면 false, 있으면 true 반환 -> 값이 없을 때까지 계속 돌아감
				//각 행의 속성값을 가져옴
				int num = rs.getInt("memno");
				String name = rs.getString("name");
				String id = rs.getString("id");
				String password = rs.getString("pass");
				int birth = rs.getInt("birth");
				String gender = rs.getString("gender");
				String job = rs.getString("job");
				String city = rs.getString("city");
				Date registeDate = rs.getDate("joinDate");
				MemberVO vo = new MemberVO(num, name, id, password, birth, gender, job, city, registeDate);//MemberVO 객체를 만들고 그 안에 가져온 속성값을 넣어줌
				list.add(vo);//list에 넣어준다.
			}
		} catch (Exception e) {
			e.printStackTrace();//에러시 오류내며 멈춤
		} finally {
			this.close(rs, pstmt, conn);//자원반환
		}
		return list;//ArrayList를 반환
	}
	
	public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(rs != null) {//rs 객체가 있는지 체크
				rs.close();//있으면 반환
			}
		} catch (SQLException e) {
			e.printStackTrace();//에러시 오류로 멈춤
		}
		
		try {
			if(pstmt != null) {//pstmt 객체가 있는지 체크
				pstmt.close();//있으면 반환
			}
		} catch (Exception e) {
			e.printStackTrace();//에러시 오류로 멈춤
		}
		
		try {
			if(conn != null) {//conn 객체가 있는지 체크
				conn.close();//있으면 반환
			}
		} catch (Exception e) {
			e.printStackTrace();//에러시 오류로 멈춤
		}
	}
	
	public int insertMember(MemberVO vo) {
		int cnt = 0;//행 갯수 변수
		Connection conn = getConnection();//conn 객체 가져오기
		String sql = "INSERT INTO MEMBER_TBL VALUES(?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";//insert sql문
		PreparedStatement pstmt = null;//preparedStatement 변수 만들기 첨엔 null값.
		try {
			pstmt = conn.prepareStatement(sql);//pstmt 넣어주기
			//sql ? 에 변수 세팅
			pstmt.setInt(1, vo.getMemno());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getId());
			pstmt.setString(4, vo.getPassword());
			pstmt.setInt(5, vo.getBirth());
			pstmt.setString(6, vo.getGender());
			pstmt.setString(7, vo.getJob());
			pstmt.setString(8, vo.getCity());
			cnt = pstmt.executeUpdate();//sql문 실행하면서 행 갯수 반환
		} catch (Exception e) {
			e.printStackTrace();//에러 나면 멈추면서 에러문 냄
		} finally {
			close(null, pstmt, conn);//자원반환
		}
		return cnt;//행 갯수 반환
	}
	
	public int updateMember(MemberVO vo) {
		int cnt = 0;//행 갯수 변수
		Connection conn = getConnection();//conn 객체 가져오기
		String sql = "UPDATE MEMBER_TBL SET pass = ?, birth = ?, gender = ?, job = ?, city = ? WHERE memno = ?";//Update 쿼리 문
		PreparedStatement pstmt = null;//preparestatement 변수
		try {
			pstmt = conn.prepareStatement(sql);//pstmt 넣어주기
			//sql ? 에 변수 세팅하기
			pstmt.setString(1, vo.getPassword());
			pstmt.setInt(2, vo.getBirth());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getJob());
			pstmt.setString(5, vo.getCity());
			pstmt.setInt(6, vo.getMemno());
			cnt = pstmt.executeUpdate();//sql문 실행하면서 행 갯수를 반환
		} catch (Exception e) {
			e.printStackTrace();//에러 날 시 에러문 내기
		} finally {
			close(null, pstmt, conn);//자원 반환
		}
		return cnt;//행 갯수 반환하기
	}
	
	public int deletemember(MemberVO vo) {
		int cnt = 0;//행 개수에 대한 변수
		Connection conn = getConnection();//conn 객체 가져오기
		String sql = "DELETE FROM MEMBER_TBL WHERE memno = ?";//delete sql문
		PreparedStatement pstmt = null;//preparedStatement 처음엔 null 값으로 
		try {
			pstmt = conn.prepareStatement(sql);//preparedStatement 객체 넣어주기
			pstmt.setInt(1, vo.getMemno());//sql ?에 값 넣어주는 작업
			cnt = pstmt.executeUpdate();//sql를 실행시키면서 행 갯수 반환
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);//마지막엔 항상 자원반환
		}
		return cnt;//행 갯수 반환
	}
	
	public boolean idAvailableChk(String id) {
		boolean find = false;//id가 table에 있을 시 true, 없으면 false를 반환하는 변수
		Connection conn = getConnection();//conn 객체 가져오기
		String sql = "SELECT id FROM MEMBER_TBL WHERE id = ?";//Select sql 사용자가 입력한 id를 찾아줌
		PreparedStatement pstmt = null;//preparedstatement 변수
		ResultSet rs = null;//resultset 함수
		try {
			pstmt = conn.prepareStatement(sql);//conn.preparestatement로 prepareStatement 객체 가져옴
			pstmt.setString(1, id);//sql ? 변수 설정
			rs = pstmt.executeQuery();//sql 쿼리를 실행하며 반환되는 값 가져오기
			if(rs.next()) find = true;//rs에 값이 있으면 true로 반환
		} catch (Exception e) {
			e.printStackTrace();//에러시 오류 내며 멈춤
		} finally {
			close(rs, pstmt, conn);//자원반환
		}
		return find;//find를 돌려줌
	}
	
	public MemberVO getAMember(int num) {
		MemberVO vo = null;//찾아낸 값을 저장할 때 사용할 변수
		Connection conn = getConnection();//connection 객체 가져오기
		String sql = "SELECT * FROM MEMBER_TBL WHERE memno = ?";//select문 선언
		PreparedStatement pstmt = null;//preparedStatement 변수 선언
		ResultSet rs = null;//ResultSet변수 선언
		try {
			pstmt = conn.prepareStatement(sql);//pstmt에 preparestatement 객체 저장
			pstmt.setInt(1, num);//sql '?' 에 값넣기
			rs = pstmt.executeQuery();//executeQuery()로 실행된 sql의 결과 값을 rs에 저장
			if(rs.next()) {//rs.next()로 결과 값이 있는지 체크
				//있으면 MemberVO 새로 생성해서 vo에 저장
				vo = new MemberVO(rs.getInt("memno"), rs.getString("name"), rs.getString("id"), rs.getString("pass"), rs.getInt("birth"), rs.getString("gender"),rs.getString("job"), rs.getString("city"), rs.getDate("joinDate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);//close 메서드로 객체 자원 반환
		}
		return vo;//vo 객체 리턴시켜주기
	}
}
