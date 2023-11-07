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

<h2>리다이렉트로 호출된 페이지</h2>

<%
// 저장된 데이터 호출해서 변수에 저장
	String str = (request.getAttribute("str") != null) ?
			pageContext.getAttribute("str").toString() : "값 없음" ;
	Person person = (request.getAttribute("person") != null) ?
			(Person)pageContext.getAttribute("str") : new Person() ;
	ArrayList<String> arr_ = (request.getAttribute("arr_") != null) ?
			(ArrayList)request.getAttribute("arr_") : new ArrayList<>();
	
%>
<h3>request영역에 저장된 데이터 출력</h3>
str : <%= str %><br>
person : <%= person %><br>
arr_ : <%= arr_ %>

<br>
<hr>

<%
// 저장된 데이터 호출해서 변수에 저장
	String session_str = (session.getAttribute("session_str") != null) ?
			session.getAttribute("session_str").toString() : "값 없음" ;
	Person session_person = (session.getAttribute("session_person") != null) ?
			(Person)session.getAttribute("session_person") : new Person() ;
	ArrayList<String> session_arr_ = (session.getAttribute("session_arr_") != null) ?
			(ArrayList)session.getAttribute("session_arr_") : new ArrayList<>();
	
%>

<h3>session영역에 저장된 데이터 출력</h3>
str : <%= session_str %><br>
person : <%= session_person %><br>
arr_ : <%= session_arr_ %>

<br>
<hr>

<h4>session 제거</h4>
<%
	session.removeAttribute("session_str") ;
	session.removeAttribute("session_person") ;
	session.removeAttribute("session_arr_") ;
%>
str : <%= session.getAttribute("session_str") %><br>
person : <%= session.getAttribute("session_person") %><br>
arr_ : <%= session.getAttribute("session_arr_") %>

<br>
<hr>

<h2>session 무효화</h2>

<a href="sessionInvalidate.jsp">sessionInvalidate.jsp 바로가기</a>

</body>
</html>