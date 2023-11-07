<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
	String id = request.getParameter("id") ;
	String pw = request.getParameter("pw") ;
	
	// id == momo && pw == 1234 => 로그인 성공
	if ("momo".equals(id) && "1234".equals(pw)) {
		// 로그인 성공 
		// 페이지 전환 -> 웹브라우저 -> 웹브라우저가 다시 요청
		// 기존의 요청 정보가 공유되지 않음    
			// ## 아이디를 파라미터로 넘겨주지 않으면 id값이 공유되지 않는다.
		// 주소 표시줄이 변경됨
		response.sendRedirect("responseWelcome.jsp?id=" + request.getParameter("id")) ;
	} else {
		// 로그인 실패
		// 웹브라우저로 다시 요청하지 않음
		// 기존의 요청 정보가 공유됨
		// 주소 표시줄 변경되지 않음
		request.getRequestDispatcher("responseMain.jsp?loginErr=1") 
						.forward(request, response) ;
	}
%>
<h2>페이지를 전환하는 방법 2가지</h2>
<p>1. sendRedirect</p>
<p>2. forward</p>

id : <%= id %><br>
pw : <%= pw %>
</body>
</html>