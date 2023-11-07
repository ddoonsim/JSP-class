package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnectionUpdate {

	public static void main(String[] args) {
		
		String url = "jdbc:oracle:thin:@localhost:1521:orcl" ;
		String id = "test" ;
		String pw = "1234" ;
		
		Connection conn = null ;
		Statement stmt = null ;
		ResultSet rs = null ;
		
		
		try {
			// 1. 오라클 드라이버(라이브러리) 확인
			Class.forName("oracle.jdbc.driver.OracleDriver") ;
			
			// 2. 커넥션 객체 생성
			conn = DriverManager.getConnection(url, id, pw) ;
			
			// 3. 쿼리문장 준비
			String sql = "update job set job_name = '대표이사' where job_code='J1' " ;
			
			// 4. 쿼리문장 실행
			stmt = conn.createStatement() ;
			int res = stmt.executeUpdate(sql) ;
			// 실행 결과
			System.out.println(res + "건 처리되었습니다.");
			
		} 
		catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		} 
		catch (SQLException e) {
			System.out.println("Connection 객체 생성 실패");
			e.printStackTrace();
		}
		finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
			}
			catch(Exception e) {
				System.out.println("자원 해제 중 예외 발생");
				e.getMessage() ;
			}
		}

	}

}
