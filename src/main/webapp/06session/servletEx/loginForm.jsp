<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
	loginProcess 또는 ./loginProcess : 현재 페이지의 위치를 기준으로 경로를 호출
					/06session/ex/loginProcess
					
	/loginProcess : 루트경로를 기준으로
					/loginProcess
					## 06session/ex 상위 경로 모두 ❌
					
	../loginProcess : 상위 경로로 이동
					/06session/loginProcess
 -->

<%
	String isErr = request.getParameter("isErr") ;

	if(isErr != null && isErr.equals("1")) {
		out.print("아이디/비밀번호가 일치하지 않습니다. 확인해주세요.") ;
	}
%>

<form action="loginProcess" method="post" name="loginFrm">
        아이디 : <input type="text" name="user_id" required="required" value="test"/><br />
        패스워드 : <input type="password" name="user_pw" required="required" value="1234"/><br />
        <input type="submit" value="로그인하기" />
</form> 

</body>
</html>