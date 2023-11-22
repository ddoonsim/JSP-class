package com.momo.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.dto.BoardDto;
import com.momo.dto.Criteria;

// DBConnPool : 톰캣에서 제공해주는 기능을 사용하여 커넥션풀이라는 공간에 커넥션 객체를 미리 생성해놓고 사용하는 객체
// main메서드 사용 불가, 서버가 실행되어야 사용 가능
// 만약, main 메서드를 이용해서 테스트를 하고 싶다면 상속받는 객체를 DBConnection으로 변경해야 함.
public class BoardDao extends DBConnPool{
	
	public List<BoardDto> getList(Criteria cri) {
		List<BoardDto> list = new ArrayList<>() ;
		String where = "" ;
		// 컬럼명은 인파라미터(?)로 쿼리 작성이 불가능하고 null처리가 필요하기 때문에
		if(!"".equals(cri.getSearchField())
				&& !"".equals(cri.getSearchWord())) {
			where = "where " + cri.getSearchField() 
							+ " like '%" + cri.getSearchWord() + "%'\r\n" ;
		}
		String sql = "select *\r\n"
				+ "from (select rownum rnum, b.*\r\n"
				+ "        from (select * from board \r\n"
				+ where 
				+ "                order by num desc) b)\r\n"
				+ "where rnum between ? and ?" ;
		
		try {
			pstmt = con.prepareStatement(sql) ;
			pstmt.setInt(1, cri.getStartNum());
			pstmt.setInt(2, cri.getEndNum());
			
			// System.out.println("where문 : " + where);
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				BoardDto dto = new BoardDto() ;
				
				dto.setNum(rs.getString("NUM"));
				dto.setTitle(rs.getString("TITLE"));
				dto.setContent(rs.getString("CONTENT"));
				dto.setId(rs.getString("ID"));
				dto.setPostdate(rs.getString("POSTDATE"));
				dto.setVisitcount(rs.getString("VISITCOUNT"));
				
				list.add(dto) ;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list ;
	}
	
	/**
	 * 게시글의 총 건수를 조회 후 반환
	 * - 집계함수를 이용하여 게시글의 총 건수 반환
	 * @return 게시글의 총 건수
	 */
	public int getTotalCnt(Criteria cri) {
		int res = 0 ;
		String where = "" ;
		// 컬럼명은 인파라미터(?)로 쿼리 작성이 불가능하고 null처리가 필요하기 때문에
		if(!"".equals(cri.getSearchField())
				&& !"".equals(cri.getSearchWord())) {
			where = "where " + cri.getSearchField() 
							+ " like '%" + cri.getSearchWord() + "%'\r\n" ;
		}
		
		String sql = "select count(*) from board " + where ;
		
		try {
			pstmt = con.prepareStatement(sql) ;
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				res = rs.getInt(1) ;
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return res ;
	}
	
	/**
	 * 게시글 1건 조회하여 반환
	 */
	public BoardDto getOne(String num) {
		BoardDto dto = new BoardDto() ;
		String sql = "select * from board where num = ?" ;
		try {
			pstmt = con.prepareStatement(sql) ;
			pstmt.setString(1, num);
			rs = pstmt.executeQuery() ;
			
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPostdate(rs.getString(5));
				dto.setVisitcount(rs.getString(6));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto ;
	}
	
	/**
	 * 새 게시글을 작성하는 메서드
	 */
	//public int insertBoard(BoardDto dto) {
		
	//}
	
	/**
	 * 게시글의 조회수를 1 증가 시키는 메서드
	 * 
	 * insert, update, delete의 반환 타입은 int(몇 건이 처리되었는지)
	 * 반환타입은 int로 설정
	 */
	public int visitcountUp(String num) {
		int res = 0 ;
		String sql = "update board set visitcount = visitcount + 1 \r\n"
				+ "where num = ?" ;
		try {
			pstmt = con.prepareStatement(sql) ;
			pstmt.setString(1, num) ;
			
			res = pstmt.executeUpdate() ;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res ;
	}
	
	/**
	 * 게시글 1건 삭제하는 메서드
	 */
	public int deleteBoard(String num) {
		int res = 0 ;
		String sql = "delete from board where num = ?" ;
		try {
			pstmt = con.prepareStatement(sql) ;
			pstmt.setString(1, num);
			
			res = pstmt.executeUpdate() ;
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return res ;
	}

}
