<%@page import="java.util.List"%>
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

<h2>session영역의 속성 읽기</h2>
<%
	if (session.getAttribute("person") != null) {
		Person p = (Person)session.getAttribute("person") ;
		out.print(p) ;
	} else {
		out.print("session에 저장된 person 객체는 존재하지 않습니다.") ;
	}
	
	// List 객체 꺼내오기
	if (session.getAttribute("list") != null) {
		List<String> list = (List)session.getAttribute("list") ;
		// 반복문으로 요소 출력
		out.print("<br>") ;
		for (String str : list) {
			out.print(str + "<br>") ;
		}
		
	}
%>

</body>
</html>