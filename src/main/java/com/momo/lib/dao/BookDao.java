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
	public List<BookDto> getList(Criteria cri) {
		List<BookDto> list = new ArrayList<>() ;
		
		String sql = "select * from (select rownum, b.* \r\n"
				+ "                from book b order by no desc)\r\n"
				+ "where rownum between ? and ?" ;
		
		try {
			pstmt = con.prepareStatement(sql) ;
			pstmt.setInt(1, cri.getStartNum());
			pstmt.setInt(2, cri.getEndNum());
			
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				String no = rs.getString("no") ;
				String title = rs.getString("title") ;
				String author = rs.getString("author") ;
				BookDto dto = new BookDto(no, title, author) ;
				
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
	
	public int totalCnt() {
		int totalCnt = 0 ;
		String sql = "select count(*) from book" ;
		
		try {
			stmt = con.createStatement() ;
			rs = stmt.executeQuery(sql) ;
			
			if(rs.next()) {
				totalCnt = rs.getInt(1) ;
			}
			System.out.println("totalCnt : " + totalCnt);
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return totalCnt ;
	}

}
