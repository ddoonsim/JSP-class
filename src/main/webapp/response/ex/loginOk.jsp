<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Welcome!!</h2>
	<p><%= request.getParameter("id") %>님 환영합니다.</p>
	<%
	out.print(request.getParameter("id") + "님 환영합니다.") ;
	%>
</body>
</html>