package com.momo.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.BoardDao;
import com.momo.dto.BoardDto;

@WebServlet("/boardRead")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String num = request.getParameter("boardNo") ;
		System.out.println("요청 게시글번호 : " + num);
		
		BoardDao dao = new BoardDao() ;
		BoardDto one = dao.getOne(num) ;
			
		request.setAttribute("one", one);
		request.getRequestDispatcher("06session/servletEx/content.jsp").forward(request, response);
	}

}
