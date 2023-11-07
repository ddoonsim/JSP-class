package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.momo.dto.Job;

public class DBConnectionJob {

	public static void main(String[] args) {
		
		String url = "jdbc:oracle:thin:@localhost:1521:orcl" ;
		String id = "test" ;
		String pw = "1234" ;
		
		Connection conn = null ;
		Statement stmt = null ;
		ResultSet rs = null ;
		
		List<Job> list = new ArrayList<>() ;
		
		try {
			// 1. 오라클 드라이버(라이브러리) 확인
			Class.forName("oracle.jdbc.driver.OracleDriver") ;
			
			// 2. 커넥션 객체 생성
			conn = DriverManager.getConnection(url, id, pw) ;
			
			// 3. 쿼리문장 준비
			String sql = "SELECT * FROM JOB" ;
			
			// 4. 쿼리문장 실행
			stmt = conn.createStatement() ;
			rs = stmt.executeQuery(sql) ;
			// 결과 출력
			while (rs.next()) {
				Job job = new Job() ;
				job.setJobCode(rs.getString(1));
				job.setJobName(rs.getString(2));
				list.add(job) ;
			}
			System.out.println(list);
			
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
