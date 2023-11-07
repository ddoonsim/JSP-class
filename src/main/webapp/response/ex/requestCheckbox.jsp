<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request - 체크박스</title>
</head>
<body>
<h3>관심사</h3>
<%
	String[] favo = request.getParameterValues("favo") ;

	for(String favo1 : favo) {
		out.print(favo1 + " ") ;
	}
	out.print("에 관심이 있습니다.") ;
%>
</body>
</html>