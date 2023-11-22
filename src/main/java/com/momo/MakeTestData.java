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
	public void insert(int i) {
		String sql = "INSERT INTO BOOK VALUES (" + i + ", '책" + i +"', 'N', '작가" + i + "')" ;
		
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
		for(int i=100; i < 201; i++) {
			d.insert(i);
		}
		d.close();    // 자원 반납
	}

}
