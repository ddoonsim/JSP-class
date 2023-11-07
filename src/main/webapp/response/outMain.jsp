<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - out</title>
</head>
<body>
<%
	// 다양한 타입의 값을 출력 가능!
	out.print(1);
	out.print(false);
	out.print('a');
	out.print("bye~~");
	
	// 버퍼의 데이터를 삭제
	out.clearBuffer() ;
	
	// 버퍼의 정보를 확인
	out.print("출력 버퍼의 크기 : " + out.getBufferSize()) ;   // 출력 버퍼의 크기
	out.print("<br>남은 버퍼의 크기 : " + out.getRemaining()) ;    // 남은 버퍼의 크기
%>
</body>
</html>