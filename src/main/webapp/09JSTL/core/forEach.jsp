<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.odd {
		background-color: lightgray ;
	}
</style>
</head>
<body>

<!-- 일반 for문 형태의 forEach문 
	forEach 태그를 활용한 반복문
	- begin : 시작값
	- end : 종료값
	- step : 증가값
	- var : 변수명
-->
<c:forEach begin="1" end="10" step="2" var="i">
	i : ${ i } / 
</c:forEach>

<!-- varStatus 루프의 현재 상태를 알려주는 변수 이름
	- current : var에 저장한 현재 루프의 변수값
	- index : var에 저장한 현재 루프의 인덱스값
	- count : 실제 반복횟수(1부터 시작)
	- first : 루프의 처음일 때 true
	- last : 루프의 마지막일 때 true
 -->
 <!-- 일반 for문의 경우 current, index, var 3가지 값이 동일 -->
<table>
 	<c:forEach begin="3" end="5" var="i" varStatus="loop">
 		<!-- 첫 번째 행인 경우, 버튼 출력 -->
 		<c:if test="${ loop.first }">
	 		<tr>
	 			<td colspan="6"><button>글쓰기</button></td>
	 		</tr>
	 	</c:if>
 		<tr>
 			<td>i : ${ i }</td>
 			<td>loop.current : ${ loop.current }</td>
 			<td>loop.index : ${ loop.index }</td>
 			<td>loop.count : ${ loop.count }</td>
 			<td>loop.first : ${ loop.first }</td>
 			<td>loop.last : ${ loop.last }</td>
 		</tr>
 		<!-- 마지막 행인 경우, 버튼 출력 -->
 		<c:if test="${ loop.last }">
	 		<tr>
	 			<td colspan="6"><button>글쓰기</button></td>
	 		</tr>
	 	</c:if>
 	</c:forEach>
</table>


<hr>
<h2>1~100까지 정수 중 홀수의 합</h2>

<c:set var="sum" value="0"></c:set>
<c:forEach begin="1" end="100" var="i" varStatus="loop">
	<c:if test="${ i mod 2 ne 0 }">
		${ sum = sum + i;"" }
	</c:if>
</c:forEach>

<p>1부터 100까지 홀수의 합계 : ${ sum }</p>


<hr>
<h2>향상된 for문 형태의 forEach 태그</h2>
<%
	String[] rgba = {"red", "green", "blue", "black"} ;
	for(String color : rgba) {
		out.print(color + " / ") ;
	}
%>
<br>
<table border="1">
	<c:forEach items="<%= rgba %>" var="color" varStatus="loop">
	<!-- 향상된 for문에서 
		index : 0부터 시작 
		count : 1부터 시작(반복한 수만큼 증가) -->
		<c:set value='${ (loop.index mod 2 eq 0)? "odd" : "" }' var="odd"/>
		<tr class="${ odd }">
			<td>color : ${ color }</td>
			<td>loop.current : ${ loop.current }</td>
			<td>loop.index : ${ loop.index }</td>
			<td>loop.count : ${ loop.count }</td>
			<td>loop.first : ${ loop.first }</td>
			<td>loop.last : ${ loop.last }</td>
		</tr>
		
	</c:forEach>
</table>

</body>
</html>