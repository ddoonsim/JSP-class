package com.momo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.BoardDao;
import com.momo.dto.BoardDto;

@WebServlet("/link")
public class BoardLinkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardNo = request.getParameter("boardNo") ;
		
		BoardDao boardDao = new BoardDao() ;
		List<BoardDto> list = boardDao.getList() ;
		boardDao.close() ;
		for(BoardDto dto : list) {
			if(boardNo.equals(dto.getNum())) {
				request.setAttribute("content", dto);
				request.getRequestDispatcher("06session/servletEx/content.jsp").forward(request, response); ;
			}
		}
	}

}
