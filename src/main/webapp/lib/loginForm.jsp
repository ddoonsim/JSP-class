<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style type="text/css">
	body {
		padding: 10% ;
		padding-left: 20% ;
		padding-right: 20% ;
	}
</style>
</head>
<body>

<h2>🆔로그인</h2>
<hr>

<form action="/login" method="post" name="loginForm">
        아이디 : <input type="text" name="id" required="required" value="test"/><br />
        패스워드 : <input type="password" name="pw" required="required" value="1234"/><br />
        <input type="submit" value="로그인하기" />
</form> 

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>


</body>
</html>