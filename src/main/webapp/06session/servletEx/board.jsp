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
</style>
</head>
<body>
	<!-- 
	로그인/로그아웃 링크 보여주기
	- 세션에 userId가 null이 아니라면 로그아웃 링크, 아니면 로그인 링크를 화면에 출력
 	-->
<%
	String id = session.getAttribute("id").toString();
	if (id != null) {
		out.print(id + "님 환영합니다.");
	%>
		<button>로그아웃</button>
	<%
	} else {
	%>
		<button>로그인</button>
	<%
	}
%>

<h2>게시판</h2>

<table>
	<tr>
		<th>no.</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>게시일</th>
		<th>조회수</th>
	</tr>


<%
	BoardDao dao = new BoardDao() ;
	List<BoardDto> boards = dao.getList() ;
	
	for(BoardDto board : boards) {
%>
		<tr>
			<td><%= board.getNum() %></td>
			<td><%= board.getTitle() %></td>
			<td><%= board.getContent() %></td>
			<td><%= board.getId() %></td>
			<td><%= board.getPostdate() %></td>
			<td><%= board.getVisitcount() %></td>
		</tr>
<%
	}
%>
</table>

</body>
</html>