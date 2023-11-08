package com.momo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloController
 * 
 * 서블릿 호출 방법
 * localhost:포트번호/path/매핑주소
 * 
 */
@WebServlet("/h")
public class HelloController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HelloController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8") ;
		response.setContentType("text/html; charset=UTF-8") ;
		
		PrintWriter out = response.getWriter() ;
		out.append("<h2>out객체를 이용한 출력</h2><br>") ;
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
