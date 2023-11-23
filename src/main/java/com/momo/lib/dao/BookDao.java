package com.momo.lib.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.lib.dto.Criteria;
import com.momo.lib.dto.BookDto;

public class BookDao extends DBConnPool {
	
	/**
	 * 도서목록을 조회 후 리스트로 반환
	 * @return
	 */
	public List<BookDto> getList(Criteria cri, String searchField, String searchWord) {
		List<BookDto> list = new ArrayList<>() ;
		String where = "" ;
		if(searchField != null && searchWord != null) {
			where = "where " + searchField + " like '%" + searchWord + "%' " ;
		}
		
		String sql = "select * \r\n"
				+ "from (select rownum rnum, b.* \r\n"
				+ "        from (select * from book "
				
				+ where
				
				+ "order by no desc) b)\r\n"
				+ "where rnum between ? and ?" ;
		
		try {
			pstmt = con.prepareStatement(sql) ;
			pstmt.setInt(1, cri.getStartNum());
			pstmt.setInt(2, cri.getEndNum());
			
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				String no = rs.getString("no") ;
				String title = rs.getString("title") ;
				String author = rs.getString("author") ;
				String rentYn = rs.getString("rentYn") ;
				BookDto dto = new BookDto(no, title, author, rentYn) ;
				
				list.add(dto) ;
			}
			// System.out.println(list);
		} 
		catch (SQLException e) {
			System.out.println("쿼리 실행 중 에러 발생");
			e.printStackTrace();
		}
		return list ;
	}
	
	public int totalCnt(String searchField, String searchWord) {
		int totalCnt = 0 ;
		String where = "" ;
		if(searchField != null && searchWord != null) {
			where = "where " + searchField + " like '%" + searchWord + "%'" ;
		}
		
		String sql = "select count(*) from book " + where ;
		
		try {
			stmt = con.createStatement() ;
			rs = stmt.executeQuery(sql) ;
			
			if(rs.next()) {
				totalCnt = rs.getInt(1) ;
			}
			System.out.println("totalCnt : " + totalCnt);
		} 
		catch (SQLException e) {
			System.out.println("게시물 총 개수 구하는 쿼리에서 예외 발생");
			e.printStackTrace();
		}
		return totalCnt ;
	}

	/**
	 * 도서의 상세 정보를 조회 후 반환 
	 * @param no
	 * @return 도서정보(BookDto)
	 */
	public BookDto view(String no) {
		BookDto dto = new BookDto() ;
		String sql = "select * from book\r\n"
				+ "where no = " + no ;
		
		try {
			stmt = con.createStatement() ;
			rs = stmt.executeQuery(sql) ;
			
			if(rs.next()) {
				dto.setNo(rs.getString("no")) ;
				dto.setTitle(rs.getString("title")) ;
				dto.setAuthor(rs.getString("author")) ;
				dto.setRentYn(rs.getString("rentYn")) ;
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return dto ;
		
	}

}
