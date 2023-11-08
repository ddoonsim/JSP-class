package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.common.DBConnection;
import com.momo.dto.DeptDto;

/**
 * DAO : DB로부터 데이터의 CRUD작업을 처리하는 객체
 * 
 */
public class DeptDao extends DBConnection{
	
	// 생성자
	// 생성자를 통해서 Connection 객체를 생성 후 멤버변수 con에 저장
	public DeptDao(ServletContext application) {
		// application으로부터 데이터베이스 접속 정보를 꺼내옴
		// DBConnection클래스(부모클래스)의 생성자 3 호출
		super(application) ;
	}
	
	// getList()메서드
	public List<DeptDto> getList() {
		
		List<DeptDto> list = new ArrayList<>() ;
		String sql = "SELECT DEPT_ID, DEPT_TITLE, LOCAL_NAME FROM DEPARTMENT, LOCATION WHERE LOCATION_ID = LOCAL_CODE" ;
		try {
			stmt = con.createStatement() ;
			rs = stmt.executeQuery(sql) ;
			
			while(rs.next()) {
				DeptDto dto = new DeptDto() ;
				dto.setDept_id(rs.getString(1));
				dto.setDept_title(rs.getString(2));
				dto.setLocal_name(rs.getString(3));
				
				list.add(dto) ;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list ;
	}

}
