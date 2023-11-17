<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>영역을 통해 전달된 객체 읽기</h3>
<%
	// 표현언어를 이용하면 형변환이 필요 없이 파라미터를 읽어올 수 있음
	// 별도의 null처리를 하지 않아도 오류 발생 ❌
	// 객체를 사용하기 위해서 import만 해주면 됨
%>

<ul>
	<li>Person객체(personObj)
		<p>이름 : ${ personObj.name } / 나이 : ${ personObj.age }</p>
	</li>
	<li>문자열 
		<p>${ requestScope.str }</p>
	</li>
	<li>숫자
		<p>${ requestScope.integer }</p>
	</li>
</ul>

</body>
</html>