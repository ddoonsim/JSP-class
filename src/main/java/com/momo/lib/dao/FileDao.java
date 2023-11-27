package com.momo.lib.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.momo.common.DBConnPool;
import com.momo.lib.dto.FileDto;

public class FileDao extends DBConnPool {

	public int regFile(FileDto fileDto) {
		int res = 0 ;
		String sql = "INSERT INTO tbl_file (file_no, name, title, cate, ofile, sfile)\r\n"
				+ "VALUES ( seq_tbl_file.nextval, ?, ?, ?, ?, ?)" ;
		
		try {
			pstmt = con.prepareStatement(sql) ;
			pstmt.setString(1, fileDto.getName());
			pstmt.setString(2, fileDto.getTitle());
			pstmt.setString(3, fileDto.getCate());
			pstmt.setString(4, fileDto.getOfile());
			pstmt.setString(5, fileDto.getSfile());
			
			res = pstmt.executeUpdate() ;
			
			System.out.println(res + "건이 추가되었습니다.");
		} 
		catch (SQLException e) {
			System.out.println("파일 DB 등록 과정에 예외 발생");
			e.printStackTrace();
		}
		return res;
	}

	public List<FileDto> getList() {
		List<FileDto> list = new ArrayList<>() ;
		String sql = "SELECT * FROM tbl_file ORDER BY file_no DESC" ;
		
		try {
			stmt = con.createStatement() ;
			rs = stmt.executeQuery(sql) ;
			
			while(rs.next()) {
				FileDto dto = new FileDto() ;
				dto.setFile_no(rs.getInt("file_no"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setCate(rs.getString("cate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPostdate(rs.getString("postdate"));
				
				list.add(dto) ;
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	

}
