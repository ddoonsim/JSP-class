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
<h2>쿠키가 생성되었습니다.</h2>

<%
	// 쿠키 생성
	if("Y".equals(request.getParameter("inactiveToday"))) {
		CookieManager.makeCookie(response, "popupClose", "Y", 3600) ;
	}

	// main 페이지로 페이지 전환
	response.sendRedirect("popupMain.jsp") ;
%>
</body>
</html>