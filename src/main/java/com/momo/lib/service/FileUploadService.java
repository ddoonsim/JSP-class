package com.momo.lib.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.momo.lib.dao.FileDao;
import com.momo.lib.dto.FileDto;
import com.oreilly.servlet.MultipartRequest;

public class FileUploadService {
	
	private int maxSize = 1024 * 1000 ;
	private String uploadDir = "c:/upload" ;
	private String encode = "utf-8" ;
	
	public FileUploadService() {}
	
	public FileUploadService(int maxSize, String uploadDir, String encode) {
		super();
		this.maxSize = maxSize;
		this.uploadDir = uploadDir;
		this.encode = encode;
	}
	
	public MultipartRequest fileUpload(HttpServletRequest request, String uploadFile, String cate) {
		MultipartRequest mr = null ;
		try {
			mr = new MultipartRequest(request, uploadDir, maxSize, encode) ;
			
			String fileName = mr.getFilesystemName(uploadFile) ;
			System.out.println("fileName : " + fileName);
			
			if(fileName != null && !"".equals(uploadFile)) {
				
				String oFileName = rename(fileName) ;
				
				FileDto fileDto = new FileDto() ;
				fileDto.setOfile(fileName);
				fileDto.setSfile(oFileName);
				fileDto.setName("test");
				fileDto.setTitle("제목");
				fileDto.setCate(cate);
				System.out.println("fileDto : " + fileDto);
				// 저장된 파일의 이력을 관리하기 위해서 DB에 저장
				FileDao dao = new FileDao() ;
				dao.regFile(fileDto) ;
			}
		} 
		catch (IOException e) {
			e.printStackTrace();
		}
		return mr ;
	}
	
	/**
	 * 중복된 파일명의 경우 소실될 위험이 있으므로 파일명을 변경
	 * 파일의 이름을 변경하고 변경된 이름을 반환
	 * @return 파일의 변경된 이름
	 */
	public String rename(String fileName) {
		String oFileName = "" ;
		if(fileName != null && !fileName.equals("")) {
			// 새로운 파일이름을 생성 : 원본파일명 + 시간날짜(uuId를 이용하기도 함) + 확장자
			// 지금 날짜와 시간을 파일이름에 붙임
			String now = new SimpleDateFormat("yyyyMMdd_HmmsS").format(new Date()) ;
			
			// 첨부파일의 확장자
			String ext = fileName.substring(fileName.lastIndexOf(".")) ;
			
			// 원본파일 명
			oFileName = fileName.substring(0, fileName.lastIndexOf(".")) ;
			// 새 파일명
			String newFileName = oFileName + "_" + now + ext ;
			System.out.println("newFileName : " + newFileName);
			
			File oldFile = new File("c:/upload/" + fileName) ;
			File newFile = new File("c:/upload/" + newFileName) ;
			
			// 파일이름을 변경
			oldFile.renameTo(newFile) ;
		}
		return oFileName ;
	}

}
