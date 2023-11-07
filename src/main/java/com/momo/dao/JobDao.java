package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import com.momo.common.DBConnection;
import com.momo.dto.JobDto;

/**
 * Dao : 데이터 액세스 객체(Data Access Object)
 * 데이터베이스와의 상호작용을 관리하고 데이터베이스에서 데이터를 읽고 쓰는 데 사용되는 객체
 * 
 * Dto : 데이터 전송 객체(Data Transfer Object)
 * 데이터를 전송하거나 전달하기 위해 사용되는 객체(메서드X)
 */
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
