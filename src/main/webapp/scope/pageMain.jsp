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
<h1>페이지 영역의 속성 값</h1>
<!--  내장객체의 영역 : 
		웹에서는 페이지(page)들이 모여 하나의 요청(request)을 처리하여 요청들이 모여 하나의 세션(session)을,
		세션이 모여 하나의 어플리케이션(application)을 이룹니다. 
		
		page영역 : 동일한 페이지에서만 공유
		request영역 : 하나의 요청에 의해 호출된 페이지 및 포워드 페이지
		session영역 : 클라이언트가 처음 웹브라우저로 접속한 후 웹브라우저를 닫을 때까지
		application영역 : 웹 어플리케이션(웹서버)가 종료될 때까지 -->

<%
	// setAttribute : 해당 내장객체의 영역에 값을 저장
	pageContext.setAttribute("page", "페이지 영역(스코프)") ;
	pageContext.setAttribute("page_int", 10000) ;
	
	// 해당 영역에 데이터 저장
	Person p = new Person("momo", 23) ;
	pageContext.setAttribute("pagePerson", p) ;
	pageContext.getAttribute("") ;
	
	// 해당 영역에 저장된 데이터 꺼내기
	// getAttribute 메서드의 반환 타입은 Object이므로 형변환이 필요함!!!
	String page_str = pageContext.getAttribute("page").toString() ;
	int page_int = (Integer)pageContext.getAttribute("page_int") ;
	Person page_p = (Person)pageContext.getAttribute("pagePerson") ;
%>

<ul>
	<li>String : <%= page_str %></li>
	<li>int : <%= page_int %></li>
	<li>person : <%= page_p.getAge() %> / <%= page_p.getName() %></li>
</ul>

<!-- ----------------------------------------------------------- -->
<h2>include된 파일에서 page 영역 읽어오기</h2>
	<p>include지시어로 감싼 JSP파일은 포함관계를 가지므로 같은 페이지</p>
	<p>페이지 영역이나 변수등이 공유됨</p>
<%@ include file="pageinclude.jsp" %>

<!-- ----------------------------------------------------------- -->
<h2>페이지 이동 후 페이지 영역 읽어오기</h2>
<!-- 페이지 요청 -->

<!-- 링크 또는 form을 이용해서 페이지를 다시 요청하게 되면 페이지 영역이 초기화됩니다. -->
<a href="pageLocation.jsp">pageLocation 바로가기</a>

<!-- remove -->
<%
	pageContext.removeAttribute("page") ;
%>
<h2>영역에 저장된 속성을 삭제</h2>

<!-- removeAttribute 메서드는 값이 없는 경우 오류는 발생❌
		getAttribute 메서드는 값이 없는 경우 null을 반환 -->
page : <%= pageContext.getAttribute("page") %>
</body>
</html>