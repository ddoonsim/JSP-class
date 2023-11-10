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
	if(request.getAttribute("one") != null) {
		BoardDto dto = (BoardDto)request.getAttribute("one") ;
%>

<h1>게시글 상세보기</h1>
<h2><%= dto.getTitle() %></h2>
<p>작성일 : <%= dto.getPostdate() %></p>
<hr>
<h3>작성자 : <%= dto.getId() %></h3><br>
<p><%= dto.getContent() %></p>
<p>조회수 : <%= dto.getVisitcount() %></p>

<% } %>
<hr>
<button onclick="history.back()">목록</button>

</body>
</html>