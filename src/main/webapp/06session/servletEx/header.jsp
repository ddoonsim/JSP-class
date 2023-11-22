<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav>
	<ul>
		<li>Home</li>
		<li>Board</li>
		<li>Contact</li>
		<li>Map</li>
	</ul>
</nav>

<form method="get" name="loginForm">
	 <c:if test="${ empty id }">
	 	guest님 환영합니다!
	 		<button id="loginBtn">로그인</button>
	 </c:if>
	 <c:if test="${ not empty id }">
	 	${ sessionScope.id }님 환영합니다😊
	 		<button id="logoutBtn">로그아웃</button>
	 </c:if>
 </form>
</body>
</html>