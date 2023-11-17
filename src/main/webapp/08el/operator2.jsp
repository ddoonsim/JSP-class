<%@page import="java.util.ArrayList"%>
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
	/*
	empty 연산자 : 값이 없는 경우 true를 반환
	- null
	- 빈문자열
	- 길이가 0인 배열
	- size가 0인 컬렉션
	*/
	
	// null
	pageContext.setAttribute("nullStr", null) ;
	// 빈 문자열
	pageContext.setAttribute("emptyStr", "") ;
	// 배열
	pageContext.setAttribute("lengthZero", new Integer[0]) ;
	// 컬렉션
	pageContext.setAttribute("sizeZero", new ArrayList()) ;
	// 문자열
	pageContext.setAttribute("str", "str") ;
%>

<h3>empty 연산자</h3>
<!-- 주로 리스트 출력 시 리스트가 비었는지 확인하는 용도로 사용 -->
empty nullStr    : ${ empty nullStr }    <br><!-- true -->
empty emptyStr   : ${ empty emptyStr }   <br><!-- true -->
empty lengthZero : ${ empty lengthZero } <br><!-- true -->
empty sizeZero   : ${ empty sizeZero }   <br><!-- true -->
empty str        : ${ empty str }        <br><!-- false -->

<h3>null을 이용한 연산</h3>
<!-- null이 연산에 사용될 경우 0으로 인식, 오류 발생 ❌ -->
${ null + 10 }<br>
${ nullStr + 10 }<br>
${ param.noVar > 10 }<br>

<hr>
<h3>삼항 연산자</h3>
<!-- 조건 ? true : false -->
num1 : ${ num1 = 10 }, num2 : ${ num2 = 20 }
<br> num1 gt num2 : ${ num1 gt num2 ? "num1이 크다" : "num2가 크다" }


</body>
</html>