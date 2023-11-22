<%@page import="com.momo.dao.BoardDao"%>
<%@page import="com.momo.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	body {
		margin: 100px ;
	}
</style>
<title>Insert title here</title>
</head>
<body>


<h1>📑게시글 상세보기 EL</h1>
<h2>${ requestScope.one.title }</h2>
<p>작성일 : ${ requestScope.one.postdate }</p>
<hr>
<h3>작성자 : ${ requestScope.one.id }</h3><br>
<p>${ requestScope.one.content }</p>
<p>조회수 : ${ requestScope.one.visitcount }</p>


<hr>
<button id="backBtn">목록</button>
<button id="editBtn">수정</button>
<button id="deleteBtn">삭제</button>

<form action="/boardList" name="searchForm" style="display: none">
	pageNo : <input type="text" name="pageNo" value="${ param.pageNo }">
	searchField : <input type="text" name="searchField" value="${ param.searchField }">
	searchWord : <input type="text" name="searchWord" value="${ param.searchWord }">
</form>

<script type="text/javascript">
	backBtn.addEventListener('click', ()=>{
		searchForm.submit() ;
		
	})
	deleteBtn.addEventListener('click', ()=>{
		// jsp를 단독으로 실행할 경우, 경로문제가 발생하지 않음
		// 같은 경로에 들어 있기 때문에
		// 하지만 서블릿을 통해 들어오는 경우, 경로문제가 발생할 수 있음
		// 그래서 루트 경로부터 풀 경로를 적어주는 것이 오류를 예방하는 방법
		location.href='/06session/servletEx/deleteProcess.jsp?boardNo=${ param.boardNo }' ;
	})
	
</script>

</body>
</html>