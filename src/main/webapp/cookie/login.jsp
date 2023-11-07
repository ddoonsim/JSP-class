<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	// userid를 쿠키에서 찾기
	// 요청객체로부터 쿠키 정보를 꺼내서 userid값을 변수에 저장
	
	String userId = "" ;
	String checked = "" ;    // userId 쿠키 값이 존재하는 경우 체크박스에 체크가 되게 설정
	
	userId = CookieManager.readCookie(request, "userid") ;
	if(!"".equals(userId)) {
		checked = "checked" ;
	}
	/*
	Cookie[] cookies = request.getCookies() ;
	
	if(cookies != null) {
		for(Cookie cookie : cookies) {
			if("userid".equals(cookie.getName())) {
				userId = cookie.getValue() ;
				// userId 쿠키 값이 존재하는 경우 체크박스에 체크가 되게 설정
				checked = "checked" ;
				break ;
			}
		}
	} */
%>

<form action="loginAction.jsp" method="post">
<div class='loginbox'>
        <div id='login'>
            <input type="text" name="id" id="userid" placeholder='ID를 입력해주세요.' 
            				required="required" value=<%= userId %>><br>
            				
            <input type="password" name="pw" id="userpw" value="1234" placeholder='PW를 입력해주세요.' required="required"><br>
            <!-- 체크박스는 체크한 경우에만 값이 전송됨 -->
            <label><input type="checkbox" <%= checked %> name="save_check" value="Y">아이디 저장하기</label><br>
        </div>
        <div id='button'>
        <input type="submit" value="로그인">
        </div>
    </div>
    <div id='info'>
        <a href="">회원가입</a>
        <a href="">ID찾기</a>
        <a href="">PW찾기</a>
    </div> 
</form>

</body>
</html>