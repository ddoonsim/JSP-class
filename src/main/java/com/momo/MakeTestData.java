package com.momo;
import java.sql.SQLException;

import com.momo.common.DBConnection;

/**
 * board 테이블에 테스트 데이터를 생성
 * JDBC를 활용한 테스트 데이터 생성
 */
public class MakeTestData extends DBConnection{
	
	/**
	 * board 테이블에 데이터를 삽입
	 */
	public void insert() {
		String sql = "insert into board  (num, title, content, id) \r\n"
				+ "    values (seq_board_num.nextval, '제목'||seq_board_num.currval||'입니다', '내용'||seq_board_num.currval||'입니다', 'test')" ;
		
		try {
			pstmt = con.prepareStatement(sql) ;
			
			// 입력 실행
			int res = pstmt.executeUpdate() ;
			System.out.println("새 test 데이터 " + res + "건 입력");
		} 
		catch (SQLException e) {
			System.out.println("⚠️새 test 데이터 입력 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	/**
	 * 자바 프로그램 실행
	 */
	public static void main(String[] args) {
		MakeTestData d = new MakeTestData() ;
		for(int i=0; i < 100; i++) {
			d.insert();
		}
		d.close();    // 자원 반납
	}

}
