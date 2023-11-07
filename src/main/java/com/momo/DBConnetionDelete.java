package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnetionDelete {

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
			String sql = "delete job where job_code = ?" ;
			
			// 4. 객체 생성
			PreparedStatement pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, "99");
			
			// 5. 쿼리 실행
			int res = pstmt.executeUpdate() ;
			System.out.println(res + "건이 삭제되었습니다.");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
					

	}

}
