<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>다중 조건문</h2>

<p>홀짝 판단하기</p>

<!-- 변수 선언 -->
<c:set var="num" value="101"/>

<!-- 다중 조건문 사용하기 -->
<c:choose>
	<c:when test="${ num mod 2 eq 0 }">
		num(${ num })은 짝수입니다.
	</c:when>
	
	<c:otherwise>
		num(${ num })은 홀수입니다.
	</c:otherwise>
</c:choose>

<hr>
<h2>국, 영, 수 점수를 입력하면 평균을 내어 학점을 출력</h2>
<p>>=90 : A | >= 80 : B | >= 70 : C | >= 60 : D</p>

<!-- form에 action을 주지 않은경우, 동일한 페이지를 다시 요청합니다. -->
<form id="score">
	국어 : <input type="text" name="ko"><br>
	영어 : <input type="text" name="eng"><br>
	수학 : <input type="text" name="math"><br>
	<button type="submit">학점 구하기</button>
</form>
<hr>
<p>
국어점수 : ${ param.ko }점<br>
영어점수 : ${ param.eng }점<br>
수학점수 : ${ param.math }점<br>
</p>

국어학점 : 
<c:choose>
	<c:when test="${ param.ko >= 90 }">A</c:when>
	<c:when test="${ param.ko >= 80 }">B</c:when>
	<c:when test="${ param.ko >= 70 }">C</c:when>
	<c:otherwise>D</c:otherwise>
</c:choose>
<br>
영어학점 : 
<c:choose>
	<c:when test="${ param.eng >= 90 }">A</c:when>
	<c:when test="${ param.eng >= 80 }">B</c:when>
	<c:when test="${ param.eng >= 70 }">C</c:when>
	<c:otherwise>D</c:otherwise>
</c:choose>
<br>
수학학점 : 
<c:choose>
	<c:when test="${ param.math >= 90 }">A</c:when>
	<c:when test="${ param.math >= 80 }">B</c:when>
	<c:when test="${ param.math >= 70 }">C</c:when>
	<c:otherwise>D</c:otherwise>
</c:choose>

</body>
</html>