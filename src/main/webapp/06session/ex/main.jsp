<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3><%= session.getAttribute("userId") %>님 환영합니다.</h3>
<br>
<a href="/logoutProcess">로그아웃</a>

</body>
</html>