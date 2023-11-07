package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import com.momo.common.DBConnection;
import com.momo.dto.JobDto;

public class JobDao extends DBConnection {
	
	// 생성자
	public JobDao(ServletContext application) {
		super(application) ;
	}
	
	/**
	 * job 테이블의 내용을 조회 후 리스트에 담아서 반환하는 메서드
	 * @return
	 */
	public List<JobDto> getList() {
		List<JobDto> list = new ArrayList<>() ;
		
		try {
			stmt = con.createStatement() ;
			String sql = "SELECT * FROM JOB" ;
			rs = stmt.executeQuery(sql) ;
			while(rs.next()) {
				JobDto job = new JobDto() ;
				job.setJobCode(rs.getString(1));
				job.setJobName(rs.getString(2));
				
				list.add(job) ;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list ;
	}

}
