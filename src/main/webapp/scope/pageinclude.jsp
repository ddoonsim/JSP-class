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

<ul>
	<!-- 다른 페이지에서 불러오는 페이지이기 때문에 빨간줄 떠도 작동됨 -->
	<li>String : <%= page_str %></li>
	<li>int : <%= page_int %></li>
	<li>person : <%= page_p.getAge() %> / <%= page_p.getName() %></li>
</ul>

<ul>
	<li>String : <%= pageContext.getAttribute("page") %></li>
	<li>int : <%= pageContext.getAttribute("page_int") %></li>
	<li>person : <%= pageContext.getAttribute("pagePerson") %></li>
</ul>

</body>
</html>