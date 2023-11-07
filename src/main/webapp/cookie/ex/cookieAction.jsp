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

<!-- 팝업용 쿠키를 생성 후 cookieMain 페이지로 전환 -->
<h2>쿠키 생성 페이지</h2>

<%
	// 쿠키 생성 메서드
	// 서버에서는 응답객체에 쿠키를 추가해주면 브라우저가 확인 후 쿠키에 저장
	CookieManager.makeCookie(response, "popupClose", "Y", 3600) ;

	// cookieMain 페이지로 전환
	response.sendRedirect("cookieMain.jsp") ;
	// request.getRequestDispatcher("cookieMain.jsp").forward(request, response) ;
%>

</body>
</html>