package com.momo.lib.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.lib.dao.BookDao;
import com.momo.lib.dto.Criteria;

@WebServlet("/bookList")
public class BookListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * 도서목록을 조회 후 request영역에 저장
	 * bookList.jsp로 forward
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookDao dao = new BookDao() ;
		Criteria cri = new Criteria(request.getParameter("pageNo"), 
									request.getParameter("amount")) ;
		request.setAttribute("list", dao.getList(cri));
		
		
		dao.close();
		request.getRequestDispatcher("/lib/bookList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
