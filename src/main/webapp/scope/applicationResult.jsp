<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="com.momo.dto.Person"%>
<%@page import="java.util.HashMap"%>
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
	if(application.getAttribute("map") != null) {
		
		// 브라우저를 닫았다가 다시 열어도 값이 유지됨
		// 서버를 종류 후 다시 실행 시 제거
		Map<String, Person> map = 
				(Map<String, Person>)application.getAttribute("map") ;
		// 맵에 담겨진 데이터의 키값을 조회
		// keySet() : 키의 집합을 Set타입으로 반환
		Set<String> keys = map.keySet() ;
		for(String key : keys) {
			// get(key) : 키값을 이용하여 value값을 반환 받음
			Person p = map.get(key) ;
			out.print(p + "<br>") ;
		}
	} else {
		out.print("map이 존재하지 않습니다.") ;
	}
%>
</body>
</html>