package com.momo.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.momo.dao.JobDao;
import com.momo.dto.JobDto;

/**
 * 사용자가 /JobList 경로를 요청하면
 * 요청 url에 매핑된 서블릿이 실행
 * 
 * 요청 시 전달된 메서드에 의해 실행될 메서드가 결정됨
 * get방식 요청 => doGet메서드 실행
 * post방식 요청 => doPost메서드 실행
 * 해당 요청방식이 구현되어 있지 않은 경우, 오류 발생
 * 
 * - 사용자가 지정하지 않은 경우 -> doGet메서드 실행
 * 		- 링크를 클릭했을 때
 * 		- 주소창에서 직접 입력했을 때
 * 
 */
@WebServlet("/JobList")
public class JobListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 1. DB로부터 직급목록을 조회
	 * 2. 리스트로 전달 받아서 화면에 출력
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request.getServletContext() = jsp의 내장객체인 application
		JobDao jobDao = new JobDao(request.getServletContext()) ;
		List<JobDto> list = jobDao.getList() ;
		System.out.println("===================jobList");
		System.out.println(list);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("jobList.jsp").forward(request, response);
		
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
