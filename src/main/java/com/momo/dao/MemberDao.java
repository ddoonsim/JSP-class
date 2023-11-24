package com.momo.dao;

import java.sql.SQLException;

import com.momo.common.DBConnPool;
import com.momo.dto.MemberDto;

/**
 * DB의 Member테이블에서 데이터 조회 객체
 */
public class MemberDao extends DBConnPool{
	
	// 로그인 메서드
	public MemberDto login(String id, String pass) {
		MemberDto memberDto = new MemberDto() ;
		String sql = "SELECT * FROM MEMBER WHERE ID LIKE ? AND PASS LIKE ?" ;
		
		try {
			// 입력받은 사용자 정보를 DB로부터 조회
			pstmt = con.prepareStatement(sql) ;
			// 파라미터 세팅 
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			// 쿼리 실행
			rs = pstmt.executeQuery() ;
			if(rs.next()) {
				// 로그인 성공
				memberDto.setId(rs.getString("id"));
				memberDto.setPass(rs.getString("pass"));
				memberDto.setName(rs.getString("name"));
				memberDto.setRegidate(rs.getString("regidate"));
				memberDto.setEmail(rs.getString("email"));
				
				// 사용자 정보를 MemeberDto객체에 담아서 반환
				return memberDto ;
			} else {
				// 로그인 실패
				return null ;
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		close() ;    // 자원 반납
		return null ;
	}

	
	/**
	 * Member 테이블에 회원 추가
	 */
	public int regMember(MemberDto dto) {
		int res = 0 ;
		String sql = "insert into member (id, pass, name, regidate, email)\r\n"
				+ "values('" + dto.getId() + "', '" + dto.getPass() + "', '" + 
							dto.getName() + "', sysdate, '" + dto.getEmail() + "')" ;
		
		try {
			stmt = con.createStatement() ;
			res = stmt.executeUpdate(sql) ;
			System.out.println("Member테이블에 " + res + "건 추가되었습니다.");
		} 
		catch (SQLException e) {
			System.out.println("회원 추가 쿼리 실행 중 예외 발생");
			e.printStackTrace();
		}
		return res ;
		
	}
	

}
