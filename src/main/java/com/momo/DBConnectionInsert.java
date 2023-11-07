package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnectionInsert {
	
	public static void main(String[] args) {
		
		String url = "jdbc:oracle:thin:@localhost:1521:orcl" ;
		String id = "test" ;
		String pw = "1234" ;
		
		Connection conn = null ;
		
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver") ;
			
			// 2. 커넥션 생성
			conn = DriverManager.getConnection(url, id, pw) ;
			
			// 3. 쿼리 생성
			String sql = "INSERT INTO JOB VALUES (?, ?)" ;
			
			// 4. pstmt 객체 생성
			PreparedStatement pstmt = conn.prepareStatement(sql) ;
			// 쿼리 상 물음표에 들어갈 값(인파라미터) 세팅
			pstmt.setString(1, "99");
			pstmt.setString(2, "값99");
			
			// 5. 실행 => int값 반환
			int res = pstmt.executeUpdate() ;
			System.out.println(res + "건 생성되었습니다.");
			
		} catch (ClassNotFoundException e) {
			System.out.println("라이브러리를 확인해주세요.");
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

}
