<%@page import="com.momo.dto.Person"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 영역</title>
</head>
<body>
<h2>application 영역</h2>
<!--  application 영역 : 
	웹서버가 실행 시 생성되는 영역
	클라이언트가 요청하는 모든 페이지가 application영역을 공유
	웹서버를 종료할 때 소멸
	
	application 내장객체
		웹 애플리케이션당 하나만 생성되며 모든 JSP페이지에서 접근 할수 있는 객체
		ServletContext타입으로 웹 애플리케이션 전반에 이용하는 정보를 저장하거나
		서버의정보, 서버의 물리적 경로등을 얻어오는데 사용 합니다.

	web.xml (배포서술자)
		웹 어플리케이션에 대한 여러가지 설정을 저장하는 파일
	
	서버의 물리적경로 : 이클립스에서 지정한 임의의 경로가 출력 
 -->
 <%
 	Map<String, Person> map = new HashMap<>() ;
 	
 	map.put("actor1", new Person("user1", 20)) ;
 	map.put("actor2", new Person("user2", 30)) ;
 	map.put("actor3", new Person("user3", 40)) ;
 	
 	application.setAttribute("map", map) ;
 %>
 
<p>어플리케이션 영역에 속성이 저장되었습니다.</p>
<hr>
<h3>web.xml 파일에 초기화 변수 출력</h3>
<%= application.getInitParameter("INIT_PARAM") %>

<h3>서버의 물리적 경로</h3>
<%= application.getRealPath("") %>

</body>
</html>