<%@page import="com.momo.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	body {
		margin: 100px ;
	}
</style>
<title>Insert title here</title>
</head>
<body>

<%
	BoardDto dto = (BoardDto)request.getAttribute("one") ;
%>

<h1>게시글 상세보기</h1>
<h2><%= dto.getTitle() %></h2>
<hr>
<h3>작성자 : <%= dto.getId() %></h3><br>
<p><%= dto.getContent() %>
<hr>
<button onclick="history.back()">목록</button>

</body>
</html>