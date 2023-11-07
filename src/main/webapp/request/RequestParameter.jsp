<%@page import="java.util.Arrays"%>
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
	// POST 방식일 때 발생하는 한글 깨짐 처리 --> 일반적으로 필터로 처리
	// 필터 : web.xml, 어노테이션
	request.setCharacterEncoding("UTF-8") ;

	String id = request.getParameter("id") ;
	String sex = request.getParameter("sex") ;
	String favo = "" ;
	
	// 체크박스인 경우, 여러 개가 선택될 수 있기 때문에 배열형태로 받아서 처리
	String[] favoArr = request.getParameterValues("favo") ;
	// 1. 반복문을 이용해서 하나씩 출력
	// 배열의 처음부터 끝까지 반복하며 값을 저장
	for (String favoStr : favoArr) {
		favo += favoStr + " " ;
	}
	//out.print("==========================") ;
	// 2. 인덱스를 이용한 반복 - 범위 지정
	//for (int i = 0; i < favoArr.length; i++) {
	//	favo += favoArr[i] + " " ;
	//}
	//out.print("==========================") ;
	// 2. Arrays.toString()
	// out.print(Arrays.toString(favoArr)) ;
	
	String intro = request.getParameter("intro") ;
%>
<ul>
	<li>아이디 : <%= id %></li>
	<li>성별 : <%= sex %></li>
	<li>관심사 : <%= favo %></li>
	<li>자기소개 : <%= intro %></li>
</ul>
</body>
</html>