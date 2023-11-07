<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkbox request</title>
</head>
<body>
<form action="requestCheckbox.jsp" method="post">
	관심사 : <input type="checkbox" name="favo" value="eco"> 경제
		  <input type="checkbox" name="favo" value="pol"> 정치
		  <input type="checkbox" name="favo" value="ent"> 연예
	<br>
	<button>확인</button>
</form>
</body>
</html>