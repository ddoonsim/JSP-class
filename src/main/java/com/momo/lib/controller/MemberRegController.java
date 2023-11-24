package com.momo.lib.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.momo.dao.MemberDao;
import com.momo.dto.MemberDto;

@WebServlet("/regProcess")
public class MemberRegController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// 주소표시줄에서 바로 호출하는 경우, 기본방식인 get방식으로 요청이 되므로
	// 405 오류가 발생!!
	/**
	 * 회원가입 진행
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// 회원가입 성공 -> msg&로그인페이지.jsp
			// 파라미터 수집
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String pw = request.getParameter("pw");

			// dto를 생성			
			MemberDto dto = new MemberDto(id, pw, name, "", email) ;
			// System.out.println(dto);
			MemberDao dao = new MemberDao() ;
			// 회원가입
			int res = dao.regMember(dto) ;
			dao.close();    // 자원 반납
			
			// 페이지 전환 (성공 : 로그인페이지로 이동, 실패 : 뒤로가기)
			if(res > 0) {
				// 회원가입 성공
				request.setAttribute("msg", "회원가입 성공!! 환영합니다! 로그인을 해주세요!");
				request.setAttribute("url", "/lib/loginForm.jsp");
			} else {
				// 회원가입 실패
				// ex) 컬럼의 사이즈보다 입력값이 큰 경우, 타입이 맞지 않는 경우 -> 입력화면에서 유효성검증을 추가하여 해결
				request.setAttribute("msg", "회원가입 실패! 관리자에게 문의해주세요.") ;
			}
			// 페이지 전환
			request.getRequestDispatcher("/msgbox.jsp").forward(request, response) ;
		
	}

}
