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
/** 
 * Servlet : URL(/DeptListController 페이지를 요청하면)매핑하는 것
 * - 요청 메서드에 따라서 실행되는 메서드가 결정
 * 
 * 주소표시줄, 링크 => get방식 -> doGet()메서드 호출
 * 
 * Controller 
 * - 사용자의 요청 정보를 수집
 * - 비즈니스로직 호출 : 서비스
 * - view 페이지로 전환
 */
@WebServlet("/DeptListController")
public class DeptListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeptListController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// DB에 접근해서 리스트를 조회
		DeptDao dao = new DeptDao(request.getServletContext()) ;
		List<DeptDto> list = dao.getList() ;
		System.out.println("===================deptList");
		System.out.println(list);
		
		request.setAttribute("list", list) ;
		// Controller에서 화면을 구성하는 태그를 작성하는 것은 매우 번거롭기때문에
		// JSP를 이용해서 화면을 작성 후 페이지 전환
		request.getRequestDispatcher("deptList.jsp").forward(request, response) ;

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
