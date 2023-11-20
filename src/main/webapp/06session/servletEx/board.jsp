<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.momo.dao.BoardDao"%>
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
		border : 1px solid lightgray ;
		border-collapse: collapse;
		text-align: center ;
	}
	table {
		width: 700px ;
		height: 200px ;
	}
	a {
		text-decoration: none ;
	}
</style>
</head>
<body>
	<!-- 
	로그인 여부 체크
	로그인 성공 = 세션에 id가 저장되어 있음
		- 로그아웃 버튼을 출력
	없으면
		- 로그인 버튼을 출력
 -->
 
 <!-- 
 	submit : form의 요소들을 파라미터로 가지고 서버에 요청
 	action : 서버에 요청할 url 주소
 	method : 요청 방식
 			- get : 조회 용 파라미터
 			- post : 등록, 수정 용 파라미터
 	* 버튼을 생성했더라도 form안에 버튼이 하나밖에 없다면 해당 버튼은 서브밋 버튼이 됨
  -->
  
 <form method="get" name="loginForm">
 <%
 	// getAttribute의 반환 타입은 Object이므로 형변환이 필요
 	// NPE를 방지하기 위해서 null 체크 진행
 	// 세션에 id가 저장되어있지 않으면 => 로그인 버튼 출력
 	// 세션에 id가 저장되어 있으면 => 로그아웃 버튼 출력
 	if(session.getAttribute("id") != null && 
 		!"".equals(session.getAttribute("id").toString())) {
 		// 로그인한 사용자 -> 로그아웃 버튼 출력
 %>
 		<%= session.getAttribute("id").toString() %>님 환영합니다😊
 		<button id="logoutBtn">로그아웃</button>
 <%
 		// -> 세션을 무효화하고 로그인 페이지로 이동
 	} else {
 		// 로그인하지 않은 사용자 -> 로그인 버튼 출력 -> 로그인 페이지로 이동
 %>
 		<button id="loginBtn">로그인</button>
 <%
 	}
 %>
 </form>
 
 <script type="text/javascript">
 	// 화면에서 동적인 처리
 	let logoutBtn = document.querySelector('#logoutBtn') ;
 	let loginBtn = document.querySelector('#loginBtn') ;
 	
 	if(logoutBtn != null) {
 		logoutBtn.onclick = function() {
	 		// 로그아웃
	 		loginForm.action="/logout" ;
	 		loginForm.submit() ;
 		}
 	}
 	if(loginBtn != null) {
 		loginBtn.addEventListener('click', function() {
	 		// 로그인페이지로 이동
	 		loginForm.action="/06session/servletEx/loginForm.jsp" ;
	 		loginForm.submit() ;
 		}) ;
 	}
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
<!-- 만약 리스트의 사이즈가 0이라면 조회된 데이터가 없습니다 출력 -->
<!-- 만약 리스트의 사이즈가 0이 아니면 목록 출력 -->
<c:if test="${ empty list }" var="result">
	<tr>
		<td colspan="6">조회된 데이터가 없습니다.</td>
	</tr>
</c:if>
<c:if test="${ not empty list }">
	<c:forEach var="board" items="${ list }">
		<tr>
			<td>${ board.num }</td>
			<td><a href="/boardRead?boardNo=${ board.num }">${ board.title }</a></td>
			<td>${ board.content }</td>
			<td>${ board.id }</td>
			<td>${ board.postdate }</td>
			<td>${ board.visitcount }</td>
		</tr>
	</c:forEach>
</table>
</c:if>

<!-- 페이지 네비게이션 작성 
	- 페이지 번호 pageNo
	- 한 블럭 당 페이지 수 pagePerBlock
		* 페이지 블럭의 시작번호 ~ 페이지 블럭의 끝번호
	- 총 게시물의 개수 totalCnt
	- 한 페이지 당 게시물 개수 amount
		* 진짜 블럭의 최종 번호
-->
<!-- pageNavi include -->
<%@include file="pageNavi.jsp" %>

</body>
</html>