package com.momo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.momo.dao.MemberDao;
import com.momo.dto.MemberDto;


@WebServlet("/06session/ex/loginProcess")
public class loginProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청 파라미터 수집
		String id = request.getParameter("user_id") ;
		String pw = request.getParameter("user_pw") ;
		
		// 2. 사용자 인증
		// login()메서드 : id, pw가 일치하는 사용자가 있다면 MemberDto객체를 반환하고 아니면 null 반환
		MemberDao dao = new MemberDao() ;
		MemberDto dto = dao.login(id, pw) ;
		
		if(dto != null) {
			// 로그인 성공
			// 3. session 영역에 memberDto 저장
			HttpSession session = request.getSession() ;    // 세션 객체 생성
			// 세션의 만료기간이 남아 있고 웹 브라우저를 닫을 때까지 세션 정보가 서버에 유지
			session.setAttribute("memberDto", dto);
			session.setAttribute("userId", id);
			
			// 4. 페이지 전환
			response.sendRedirect("main.jsp");
		} else {
			// 로그인 실패
			request.getRequestDispatcher("loginForm.jsp?isError=1").forward(request, response); ;
		}
	}

}
