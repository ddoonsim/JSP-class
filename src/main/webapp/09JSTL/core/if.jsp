<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>jstl 제어문을 통해 짝수/홀수 판단</h2>
<c:set var="num" value="101"/>
<!-- 제어문에서 사용되는 속성
	test : if문에서 사용할 조건 지정(표현언어 사용 가능)
	var : 조건의 결과를 저장할 변수명
	scope : 변수가 저장될 영역
 -->
<c:if test="${ num mod 2 eq 0 }" var="result" scope="request">
	<!-- 조건이 참일때만 실행
		else문장 ❌ -> 단일조건문 처리만 가능-->
	${ num }은 짝수입니다.<br>
</c:if>
result : ${ result }

<c:if test="${ not result }">
	${ num }은 홀수입니다.<br>
</c:if>

</body>
</html>