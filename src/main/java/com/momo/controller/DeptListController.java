package com.momo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.momo.dao.DeptDao;
import com.momo.dto.DeptDto;

/**
 * Servlet implementation class DeptController
 */
@WebServlet("/DeptListController")
public class DeptListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeptListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// DB에 접근해서 리스트를 조회
		DeptDao dao = new DeptDao(request.getServletContext()) ;
		List<DeptDto> list = dao.getList() ;
		System.out.println("===================deptList");
		System.out.println(list);
		
		request.setAttribute("list", list) ;
		request.getRequestDispatcher("deptList.jsp").forward(request, response) ;
		//PrintWriter out = response.getWriter() ;
		//out.print("<h2>안녕하세요</h2>") ;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
