<%@page import="com.momo.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, th, td {
		border : 1px solid ;
		border-collapse: collapse;
		text-align: center ;
	}
	table {
		width: 700px ;
		height: 200px ;
	}
</style>
</head>
<body>
	<!-- 
	로그인/로그아웃 링크 보여주기
	- 세션에 userId가 null이 아니라면 로그아웃 링크, 아니면 로그인 링크를 화면에 출력
 	-->
<%
	
	if (session.getAttribute("id") != null) {
		String id = session.getAttribute("id").toString();
		out.print(id + "님 환영합니다.");
	%>
	<form name="loginForm">
		<button id="logoutBtn">로그아웃</button>
	<% 
	} else {
	%>
		<button id="loginBtn">로그인</button>
	</form>
	<%
	}
	
%>
<script type="text/javascript">
	let logoutBtn = document.querySelector("#logoutBtn") ;
	if(logoutBtn != null) {
		logoutBtn.onclick = function() {
			alert("로그아웃합니다.") ;
			loginForm.action = "/logout" ;
			loginForm.submit() ;
		}
	}
	
	let loginBtn = document.querySelector("#loginBtn") ;
	loginBtn.addEventListener('click', function() {
		loginForm.action = "loginFrom.jsp" ;
		loginForm.submit() ;
	});
</script>

<h2>📋게시판</h2>

<table>
	<tr>
		<th>일련번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>

<%
	if(request.getAttribute("list") != null) {
		List<BoardDto> list = (List<BoardDto>)request.getAttribute("list") ;
	
		for(BoardDto dto : list) {
%>
			<tr>
				<td><%= dto.getNum() %></td>
				<td><a href="/link?boardNo=<%= dto.getNum() %>"><%= dto.getTitle() %></a></td>
				<td><%= dto.getContent() %></td>
				<td><%= dto.getId() %></td>
				<td><%= dto.getPostdate() %></td>
				<td><%= dto.getVisitcount() %></td>
			</tr>
<%
		}
	}
%>
</table>

</body>
</html>