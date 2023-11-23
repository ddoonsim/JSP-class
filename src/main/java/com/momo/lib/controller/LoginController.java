package com.momo.lib.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.momo.dao.MemberDao;
import com.momo.dto.MemberDto;

@WebServlet("/logIn")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("로그인 서블릿 실행");
		HttpSession session = request.getSession() ;
		String id = request.getParameter("id") ;
		String pw = request.getParameter("pw") ;
		
		MemberDao dao = new MemberDao() ;
		MemberDto dto = dao.login(id, pw) ;
		if(dto != null) {
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			response.sendRedirect("/bookList");
		} else {
			response.sendRedirect("/lib/loginForm.jsp?isError=1") ;
		}
		
	}

}
