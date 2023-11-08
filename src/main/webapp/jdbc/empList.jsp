<%@page import="com.momo.dto.EmpDto"%>
<%@page import="com.momo.dao.EmpDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>Controller를 이용해서 사원목록을 출력해봅시다.</h2>

<%
	List<EmpDto> list = (List<EmpDto>)request.getAttribute("list") ;
	out.print(list) ;
%>
</body>
</html>