<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body {
		margin: 100px ;
	}
</style>
</head>
<body>

<h2>폼값 출력</h2>

<p>표현식을 이용한 출력</p>
이름 : <%= request.getParameter("name") %><br>
성별 : <%= request.getParameter("gender") %><br>
학력 : <%= request.getParameter("grade") %><br>
관심사 : <%= request.getParameterValues("inter") %><br>

<hr>
<%
	/*
	요청 시 받아온 파라미터를 출력
	
	request.getParameter("name속성명")
	${ param.name속성명 }

	request.getParameterValues("name속성명")
	${ paramValues.name속성명[배열인덱스] }
	
	체크박스는 선택된 내용만 넘어옴 / null에 대한 오류 처리 ❌
	*/
%>

<p>el을 이용한 출력</p>
이름 : ${ param.name }<br>
성별 : ${ param.gender }<br>
학력 : ${ param.grade }<br>
관심사 : ${ paramValues.inter[0] }
		${ paramValues.inter[1] }
		${ paramValues.inter[2] }
		${ paramValues.inter[3] }

</body>
</html>