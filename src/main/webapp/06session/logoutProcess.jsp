<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	// 세션 무효화
	session.invalidate() ;

	// 로그인 폼 페이지 이동
	response.sendRedirect("loginForm.jsp") ;
%>

</body>
</html>