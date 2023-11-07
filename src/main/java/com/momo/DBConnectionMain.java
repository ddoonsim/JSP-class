package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnectionMain {

	
	public static void main(String[] args) {
		
		// DB에 접근하기 위해 필요한 정보를 변수에 저장
		String url = "jdbc:oracle:thin:@localhost:1521:orcl" ;
		String id = "test" ;
		String pw = "1234" ;
		
		/*
		 *  1. 드라이버 로딩 : DB에 접근하기 위해 필요한 라이브라리가 있는지 확인
		 *  2. 커넥션 객체를 호출
		 */
		try {
			// 1. 드라이버 로딩 : 드라이버가 존재하는지 확인
			Class.forName("oracle.jdbc.driver.OracleDriver") ;
			System.out.println("오라클드라이버 확인");
			
			// 2. 커넥션 생성
			Connection con = DriverManager.getConnection(url, id, pw) ;
			
			// 3. 쿼리문장 준비
			String sql = "SELECT SYSDATE FROM DUAL" ;
			
			// 4. 쿼리 문장 실행
			Statement stmt = con.createStatement() ;
			ResultSet rs = stmt.executeQuery(sql) ;
			rs.next() ;   // 다음 줄의 데이터가 있는지 확인하는 코드 
						  // --> while문의 조건문으로 대입하여 여러 줄의 데이터 가져오기 가능
			// 인덱스는 1부터 시작, 숫자 집합 또는 컬럼 이름(SYSDATE)
			System.out.println(rs.getString("SYSDATE")) ;    
			System.out.println(con);    // 주소값 출력
		} 
		catch (ClassNotFoundException e) {
			System.out.println("⚠️드라이버 로딩 실패 - 라이브러리를 찾을 수 없습니다.");
			e.printStackTrace();
		} 
		catch (SQLException e) {
			System.out.println("⚠️Connection 객체 생성 실패");
			e.printStackTrace();
		}

	}

}
