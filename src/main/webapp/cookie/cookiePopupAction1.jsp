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
<h2>팝업용 쿠키를 생성하는 페이지</h2>

<%
	// 팝업닫기용(popupClose, Y) 쿠키 생성
	if("Y".equals(request.getParameter("inactiveToday"))) {
		CookieManager.makeCookie(response, "popupClose", "Y", 3600) ;
	}
	
	// main페이지로 전환
	response.sendRedirect("cookiePopupMain1.jsp") ;
%>
</body>
</html>