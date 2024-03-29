<%@page import="com.momo.utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
    div#popup {
        position: absolute; top:100px; left:50px; color:yellow;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
    
    .off{
    	display: none ;
    }
</style> 

<title>Insert title here</title>
</head>
<body>

<h2>쿠키를 이용한 팝업창 제어 ver 2.0</h2>


<%
	String popupClose = CookieManager.readCookie(request, "popupClose") ;
	String off = popupClose.equals("Y") ? "off" : "" ;
%>

<!-- 쿠키를 생성하는 페이지 요청 -->
<from action="cookiePopupAction1.jsp"  name="popupForm">
	<div id="popup" class="<%= off %>">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
	            <input type="checkbox" id="inactiveToday" name="inactiveToday" checked="checked" value="Y" /> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" /> 
        </div>
    </div> 
</form>

<!-- 자바스크립트 코드 폼 밑으로 이동 -->
<script type="text/javascript">
	closeBtn.onclick = function() {
		
		if(document.querySelector('#inactiveToday'.checked) {
			popupForm.submit() ;
		}
		popup.style.display = "none" ;
	}
</script>

</body>
</html>