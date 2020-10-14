package board;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();
	private BoardDAO() {}
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private static ArrayList<BoardVO> list = new ArrayList<BoardVO>();
	
	public ArrayList<BoardVO> selectAllBoards(){
		System.out.println("게시글 출력 완료");
		return list;
	}
	
	public int getBoardNum() {
		int cnt = 0;
		for(int i = 0; i<list.size(); i++) {
			int no = list.get(i).getBoardNum();
			if(cnt < no) {
				cnt = no;
			}
		}
		return cnt;
	}
	
	public String getDate() {
		Date today = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH/mm/ss");
		String writeDate = df.format(today);
		return writeDate;
	}
	
	public int insertBoard(BoardVO vo) {
		int cnt = 1;
		list.add(vo);
		return cnt;
	}
}
