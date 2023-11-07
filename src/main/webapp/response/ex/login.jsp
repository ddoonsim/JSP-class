<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- id : momo pw : 1234이면 loginOk로 페이지 전환
	아니면 오류메시지를 출력할 수 있도록 main페이지로 파라미터 전달 -->
	
<%
	String id = request.getParameter("id") ;
	String pw = request.getParameter("pw") ;
	
	if("momo".equals(id) && "1234".equals(pw)) {
		// 로그인 성공
		response.sendRedirect("loginOk.jsp?id=" + request.getParameter("id")) ;
	} else {
		// 로그인 실패
		request.getRequestDispatcher("main.jsp?loginErr=1").forward(request, response) ;
	}
%>
</body>
</html>