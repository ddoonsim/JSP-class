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

<h2>페이지 이동 후 페이지영역의 속성 값 읽기</h2>
<%
	//getAttribute 메서드의 반환 타입은 Object이므로 형변환이 필요함!!!
	Object page_str = pageContext.getAttribute("page") ;
	Object page_int = pageContext.getAttribute("page_int") ;
	Object page_p = pageContext.getAttribute("pagePerson") ;
%>

<br>String : <%= (page_str == null) ? "값 없음" : page_str %>
<br>in : <%= (page_int == null) ? "값 없음" : page_int %>
<br>person : <%= (page_p == null) ? "값 없음" : page_p %>
</body>
</html>