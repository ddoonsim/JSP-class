package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import com.momo.common.DBConnection;
import com.momo.dto.EmpDto;

/**
 * 데이터 베이스에 접근해서
 * 데이터 입력, 출력, 삭제, 조회 작업을 처리하는 객체
 * 
 * Dao -> mapper
 * 
 */
public class EmpDao extends DBConnection{
	
	public EmpDao(ServletContext application) {
		super(application) ;
	}
	
	/**
	 * [데이터베이스로부터 사원의 목록을 조회하여 반환하는 메서드]
	 * - 조회된 데이터를 웹브라우저 화면에 출력하기 위해서 리스트에 담는다.
	 * @return List<EmpDto> 타입
	 */
	public List<EmpDto> getList() {
		List<EmpDto> list = new ArrayList<>() ;
		
		try {
			stmt = con.createStatement() ;
			String sql = "SELECT * FROM EMPLOYEE" ;
			
			rs = stmt.executeQuery(sql) ;
			while(rs.next()) {
				EmpDto dto = new EmpDto() ;
				dto.setEmp_id(rs.getString(1));
				dto.setEmp_name(rs.getString(2));
				dto.setEmp_no(rs.getString(3));
				
				list.add(dto) ;
			} ;
			
		} catch (SQLException e) {
			System.out.println("SQLException 예외사항 발생");
			e.printStackTrace();
		}
		
		return list ;
	}
	
	public static void main(String[] args) {
		
		// EmpDao empDao = new EmpDao() ;
		// empDao.getList();
		// 기본 생성자가 없기 때문에 오류남
	}

}
