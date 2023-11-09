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
		// 파라미터 값 가져오기
		String boardNo = request.getParameter("boardNo") ;
		
		// 보드 정보 가져오기
		BoardDao boardDao = new BoardDao() ;
		List<BoardDto> list = boardDao.getList() ;
		boardDao.close() ;
		
		for(BoardDto dto : list) {
			// 가져온 파라미터 값과 dto의 일련번호(num)이 같으면 내용 페이지로 이동
			if(boardNo.equals(dto.getNum())) {
				request.setAttribute("content", dto);
				request.getRequestDispatcher("06session/servletEx/content.jsp").forward(request, response); ;
			}
		}
	}

}
