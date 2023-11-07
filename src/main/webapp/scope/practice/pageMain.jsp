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

<%
	//페이지 영역에 데이터 저장
	pageContext.setAttribute("str", "문자열") ;
	pageContext.setAttribute("person", new Person("ddoonsim", 30)) ;
	ArrayList<String> arr = new ArrayList<String>() ;
	arr.add("Oracle") ;
	arr.add("JAVA") ;
	arr.add("HTML / CSS") ;
	arr.add("JavaScript") ;
	arr.add("JSP") ;
	// request영역에 데이터 저장
	request.setAttribute("arr_", arr) ;
	
	// 저장된 데이터 호출해서 변수에 저장
	String str = pageContext.getAttribute("str").toString() ;
	Person person = (Person)pageContext.getAttribute("person") ;
	ArrayList<String> arr_ = (ArrayList)request.getAttribute("arr_") ;
	
%>
<h2>저장된 데이터 출력</h2>
str : <%= str %><br>
person : <%= person %><br>
arr_ : <%= arr_ %>

<hr><!-- ------------------------------------------------------- -->
<br>

<h2>include된 파일에서 page 영역에 저장한 데이터 읽어오기</h2>
<%@ include file="pageInclude.jsp" %>

<hr><!-- ------------------------------------------------------- -->
<br>

<h2>페이지 이동 후 페이지 영역 읽어오기</h2>
<!-- 페이지 링크 -->
<a href="anotherPage.jsp">anotherPage.jsp 바로가기</a>

</body>
</html>