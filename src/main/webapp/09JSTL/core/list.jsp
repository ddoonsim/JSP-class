<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body { 
		margin: 100px ;
	}
	table, tr, th, td {
		border: 1px solid ;
		border-collapse:  collapse;
	}
</style>
</head>
<body>

<h2>list 출력하기</h2>

<table>
	<tr>
		<th>일련번호</th>
		<th style="width:40%">제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>

<!-- 데이터가 없는 경우, empty -->
<c:if test="${ empty list }" var="res">
	<tr>
		<td colspan="5" align="center">게시글이 존재하지 않습니다.</td>
	</tr>
</c:if>

<c:if test="${ not empty list }">
<c:forEach items="${ list }" var="dto">
	<tr>
		<td>${ dto.num }</td>
		<td>${ dto.title }</td>
		<td>${ dto.id }</td>
		<td>${ dto.postdate }</td>
		<td>${ dto.visitcount }</td>
	</tr>
</c:forEach>
</c:if>

</table>

</body>
</html>