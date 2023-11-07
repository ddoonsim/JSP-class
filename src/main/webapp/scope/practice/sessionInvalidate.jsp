<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>session 무효화 페이지</h2>
<%
	// 세션 무효화
	session.invalidate() ;

	// 새로운 세션 발급
	request.getSession(true) ;
	
	response.sendRedirect("sendRedirect.jsp") ;
%>

</body>
</html>