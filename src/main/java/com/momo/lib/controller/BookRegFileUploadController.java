package com.momo.lib.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.lib.dto.FileDto;
import com.momo.lib.service.FileUploadService;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/book/regFileupload")
public class BookRegFileUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 첨부파일 저장
		FileUploadService fileService = new FileUploadService() ;
		MultipartRequest mr = fileService.fileUpload(request, "imgFile", "book") ;
		
		// 파라미터 수집
		String title = mr.getParameter("title") ;
		String author = mr.getParameter("author") ;
		System.out.println("title/author : " + title + "/" + author);
		
		request.setAttribute("msg", "등록되었습니다.") ;
		request.setAttribute("url", "/bookList") ;
		request.getRequestDispatcher("/msgbox.jsp") ;
	}

}
