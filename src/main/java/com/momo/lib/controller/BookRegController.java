package com.momo.lib.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.lib.dao.BookDao;

@WebServlet("/bookRegProcess")
public class BookRegController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터 수집
		String title = request.getParameter("title") ;
		String author = request.getParameter("author") ;
		String content = request.getParameter("content") ;
		String imgFile = request.getParameter("imgFile") ;
		
		// 도서 등록 처리
		BookDao dao = new BookDao() ;
		int res = dao.regBook(title, author);
		
		if(res > 0) {
			request.setAttribute("msg", "도서 " + res + "건이 등록되었습니다😄");
			request.setAttribute("url", "/bookList");
		} else {
			request.setAttribute("msg", "⚠️등록 중 예외가 발생하였습니다.");
		}
		//페이지 전환
		request.getRequestDispatcher("/msgbox.jsp").forward(request, response) ;
	}

}
