<%@page import="com.momo.dto.Person"%>
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
	
	String request_str = (request.getAttribute("request_str") != null) ? 
			request.getAttribute("request_str").toString() : "값 없음" ;
	Person request_person = (request.getAttribute("request_person") != null) ? 
			(Person)request.getAttribute("request_person") : new Person() ;
	
	
	String title = request.getParameter("isRedirect") != null ? 
						"redirect" : "forward" ;
%>

<br><h2><%= title %> 방식으로 호출되었어요!</h2>
<br><%= request_person %>
<br><%= request_str %>



</body>
</html>