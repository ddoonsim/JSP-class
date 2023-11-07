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

<h1>sendRedirect</h1>
<h2>request영역에 값 저장</h2>
<%
	// request영역에 값 저장
	
	request.setAttribute("str", "문자열") ;
	request.setAttribute("person", new Person("ddoonsim", 30)) ;
	ArrayList<String> arr = new ArrayList<String>() ;
	arr.add("Oracle") ;
	arr.add("JAVA") ;
	arr.add("HTML / CSS") ;
	arr.add("JavaScript") ;
	arr.add("JSP") ;
	request.setAttribute("arr_", arr) ;
	
	// request 영역을 이용 시 값이 유지되지 않으므로 다른 방법을 이용해야 함
	// 1. 파라미터
	response.sendRedirect("sendRedirect.jsp?isRedirect=1") ;
	
	// 2. 세션
	// 세션은 사용 후  무효화해야 함
	session.setAttribute("session_str", "문자열") ;
	session.setAttribute("session_person", new Person("ddoonsim", 30)) ;
	session.setAttribute("session_arr_", arr) ;
	
%>

</body>
</html>