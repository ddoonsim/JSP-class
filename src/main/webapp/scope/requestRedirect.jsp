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
<h2>sendRedirect </h2>
<%
	String str = "" ;
	Person person = new Person() ;
	
	if(request.getAttribute("request_str") != null) {
		str = request.getAttribute("request_str").toString() ;
	} else {
		str = "값 없음" ;
	}
	
	if (request.getAttribute("request_person") != null) {
		person = (Person)request.getAttribute("request_person") ; 
	}
%>

<h2>getAttribute 결과</h2>
<p>리다이렉트 시 request 영역이 공유되지 않기 때문에 값이 출력되지 않음</p>
<br>str : <%= str %>
<br>person : <%= person %>

<!-- ------------------------------------------------------ -->
<br><hr>

<h2>queryString 출력</h2>
<p>queryString으로 전달한 데이터는 getParameter메서드를 이용해서 수집</p>
isRedirect : <%= request.getParameter("isRedirect") %>

<!-- ------------------------------------------------------ -->
<br><hr>

<h3>session을 이용한 값 출력</h3>
session_str : <%= session.getAttribute("session_str") %>

<%
	// 세션에 저장된 속성을 제거 
		// ## 서버에 부하를 주지 않기 위해
	session.removeAttribute("session_str") ;
%>
<h3>세션 제거 후</h3>
session_str : <%= session.getAttribute("session_str") %>

</body>
</html>