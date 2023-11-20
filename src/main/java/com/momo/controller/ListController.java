package com.momo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.BoardDao;
import com.momo.dto.Criteria;

@WebServlet("/list")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * 리스트를 조회 후 반환
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDao dao = new BoardDao() ;
		// request 영역에 list를 담기
		request.setAttribute("list", dao.getList(new Criteria()));
		dao.close();
		
		// forward - request 영역을 공유하기 위해서
		request.getRequestDispatcher("/09JSTL/core/list.jsp").forward(request, response);
	}
}
