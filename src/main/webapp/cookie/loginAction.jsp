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

	String id = request.getParameter("id") ;
	String pw = request.getParameter("pw") ;
	
	// save_check값이 null이 아니라면 쿠키에 아이디를 저장
	// 체크박스는 값이 선택된 경우에만 넘어옴
	String save_check = request.getParameter("save_check") ;
	
	if(save_check != null) {
		// 쿠키에 아이디를 저장하는 메서드 사용
		CookieManager.makeCookie(response, "userid", id, 3600) ;
		
		// 쿠키에 아이디를 저장하는 코드
		// Cookie cookie = new Cookie("userid", id) ;
		// cookie.setMaxAge(3600) ;
		// response.addCookie(cookie) ;
		out.print("아이디를 쿠키에 저장했습니다.") ;
	}
	
	// if(true) {
	if("momo".equals(id) && "1234".equals(pw)) {
		out.print("<h2>로그인 성공</h2>") ;
	} else {
		String script = 
				"<script type='text/javascript'>" 
				+ "alert('id/pw를 확인해주세요') ;"
				+ "history.go(-1) ;" + "</script>" ;
		out.print(script) ;
	}
%>


</body>
</html>