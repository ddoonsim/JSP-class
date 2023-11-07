<%@page import="java.util.ArrayList"%>
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

<h2>이동된 페이지</h2>

<%
// 저장된 데이터 호출해서 변수에 저장
	String str = (pageContext.getAttribute("str") != null) ?
			pageContext.getAttribute("str").toString() : "값 없음" ;
	Person person = (pageContext.getAttribute("person") != null) ?
			(Person)pageContext.getAttribute("str") : new Person() ;
	ArrayList<String> arr_ = (request.getAttribute("arr_") != null) ?
			(ArrayList)request.getAttribute("arr_") : new ArrayList<>();
	
%>
<h2>저장된 데이터 출력</h2>
str : <%= str %><br>
person : <%= person %><br>
arr_ : <%= arr_ %>

</body>
</html>