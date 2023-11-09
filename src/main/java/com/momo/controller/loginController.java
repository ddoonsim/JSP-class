package com.momo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.momo.dao.BoardDao;
import com.momo.dao.MemberDao;
import com.momo.dto.MemberDto;

@WebServlet("/06session/servletEx/loginProcess")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Controller의 역할
	 * 	- 파라미터 수집
	 * 	- 페이지 전환(jsp로 요청을 위임)
	 * 
	 * 사용자의 로그인 요청을 처리
	 * 1. 파라미터 수집(id, pw)
	 * 2. DB로부터 해당 사용자가 있는지 확인
	 * 	2-1. 사용자가 존재하면 로그인 처리(세션에 사용자정보를 저장)
	 * 	2-2. 사용자가 존재하지 않으면 이전페이지로 넘어가서 오류 메세지를 출력
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession() ;    // 세션은 요청객체에 있으므로 생성해야 함
		
		// 파라미터 수집
		// request.getParameter("name") : 로그인 폼의 name속성에서 넘어온 값 얻는 메서드
		String id = request.getParameter("user_id") ;
		String pw = request.getParameter("user_pw") ;
		
		// 사용자 정보 인증
		MemberDao dao = new MemberDao() ;
		MemberDto dto = dao.login(id, pw) ;
		dao.close() ;
		
		// 페이지 전환
		if(dto != null) {
			// 로그인 처리
			// 세션에 로그인 정보 저장
			session.setAttribute("id", dto.getId()) ;
			session.setAttribute("pw", dto.getPass()) ;
			
			// 게시글 조회 후 request에 담기
			BoardDao boardDao = new BoardDao() ;
			request.setAttribute("list", boardDao.getList()) ;
			dao.close() ;
			// board.jsp로 이동
			// sendRedirect를 이용할 경우, request영역이 공유가 되지 않기 때문에 forward방식을 이용해야 함
			request.getRequestDispatcher("board.jsp").forward(request, response) ;
		} else {
			// 이전페이지로 이동, 오류 메세지 출력
			request.getRequestDispatcher("loginForm.jsp?isErr=1").forward(request, response) ;
		}
	}

}
