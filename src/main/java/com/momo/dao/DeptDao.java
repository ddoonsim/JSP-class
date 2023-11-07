package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.common.DBConnection;
import com.momo.dto.DeptDto;

public class DeptDao extends DBConnection{
	
	// 생성자
	public DeptDao(ServletContext application) {
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
