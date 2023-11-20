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

<!-- 변수 선언 -->
<c:set var="scopeVar" value="pageValue"></c:set>
<c:set var="scopeVar" value="requestValue" scope="request"></c:set>
<c:set var="scopeVar" value="sessionValue" scope="session"></c:set>
<c:set var="scopeVar" value="applicationValue" scope="application"></c:set>

<h2>4가지 영역에 저장된 속성 출력</h2>
<ul>
	<li>페이지영역 : ${ scopeVar }</li>
	<li>요청영역 : ${ requestScope.scopeVar }</li>
	<li>세션영역 : ${ sessionScope.scopeVar }</li>
	<li>어플리케이션영역 : ${ applicationScope.scopeVar }</li>
</ul>

<h2>session 영역에서 삭제</h2>
<c:remove var="scopeVar" scope="session"/>
<ul>
	<li>페이지영역 : ${ scopeVar }</li>
	<li>요청영역 : ${ requestScope.scopeVar }</li>
	<li>세션영역 : ${ sessionScope.scopeVar }</li>
	<li>어플리케이션영역 : ${ applicationScope.scopeVar }</li>
</ul>

<hr>
<c:remove var="scopeVar"/>
<!-- 영역을 지정하지 않으면 모든 영역의 동일한 이름의 데이터 모두 삭제 -->
<ul>
	<li>페이지영역 : ${ scopeVar }</li>
	<li>요청영역 : ${ requestScope.scopeVar }</li>
	<li>세션영역 : ${ sessionScope.scopeVar }</li>
	<li>어플리케이션영역 : ${ applicationScope.scopeVar }</li>
</ul>

</body>
</html>