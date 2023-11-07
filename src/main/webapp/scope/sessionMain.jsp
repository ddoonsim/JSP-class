<%@page import="java.util.List"%>
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
<!-- 
	웹 브라우저에서 서버에 처음 요청할 때 서버가 sessionId를 발급
	-> sessionId를 응답객체의 쿠키에 담아서 웹브라우저로 전송
	-> 웹브라우저는 응답을 받아서 쿠키에 저장 
	-> 서버에 요청 시 쿠키정보를 담아서 요청
	## 개발자 창의 Application 탭에서 쿠키 확인 가능
	
	- 회원 인증 후 로그인 상태를 유지하는 데에 사용
	- 웹 브라우저를 닫고 다시 열게 되면 세션은 유지되지 ❌, 쿠키도 유지 ❌
 -->
 
 <%
 	session.setAttribute("person", new Person("momo", 30)) ;
 	
 	List<String> list = new ArrayList<String>() ;
 	list.add("list") ;
 	list.add("set") ;    // 새로운 숫자를 추출 --> 담아 중복 제거
 	list.add("map") ;
 	
 	session.setAttribute("list", list) ;
 %>
 
 <h2>페이지 이동 후 session영역에 저장된 값을 출력</h2>
 <a href="sessionLocation.jsp">sessionLocation.jsp 바로가기</a>
 
 <!-- ------------------------------------------ -->
 <hr>
 
 <h2>세션 무효화하는 방법</h2>
 <a href="sessionInvalidate.jsp">sessionInvalidate.jsp 바로가기</a>
 
</body>
</html>