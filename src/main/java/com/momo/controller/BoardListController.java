package com.momo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.BoardDao;
import com.momo.dto.Criteria;
import com.momo.dto.PageDto;

@WebServlet("/boardList")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 리스트를 조회하기 위한 파라미터 수집
		Criteria cri = new Criteria(request.getParameter("pageNo"), 
				request.getParameter("amount"), 
				request.getParameter("searchField"), 
				request.getParameter("searchWord")) ; 
		System.out.println(cri);
		
		// 리스트 조회 후 요청 영역에 저장
		BoardDao dao = new BoardDao() ;
		
		request.setAttribute("list", dao.getList(cri)) ;
		
		// 페이지 블럭을 생성하기 위해 필요한 정보를 저장
		// 조회조건을 세팅하지 않으면 조회되는 게시글의 건수와 페이지블럭이 다르게 표시될 수 있다
		int totalCnt = dao.getTotalCnt(cri) ;
		PageDto pageDto = new PageDto(totalCnt, cri) ;
		request.setAttribute("pageDto", pageDto);
		
				
		dao.close();
		
		// 페이지 전환
		// forward방식으로 전환하므로 request영역이 공유됨
		request.getRequestDispatcher("06session/servletEx/board.jsp")
								.forward(request, response) ;
	}

}
