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
    .off {
    	display: none;
    }
</style> 

<title>Insert title here</title>
</head>
<body>

<h2>쿠키를 이용한 팝업창 제어</h2>

<!-- 
	1. 닫기 버튼을 클릭하면 popupAction.jsp 파일 호출
		- 팝업 닫힘 쿠키를 생성
	2. 팝업닫힘 쿠키가 생성이 되어 있다면, 더 이상 팝업 창을 보여주지 않도록 처리
 -->
 
<% 
	String off = "" ; 
	// 쿠키값 읽어오기
	String popupClose = CookieManager.readCookie(request, "popupClose") ;
	if(popupClose.equals("Y")) {
		off = "off" ;
	}
%>
 
 <form action="popupAction.jsp" name="popupForm">

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
	// 닫기 버튼을 누르면
	closeBtn.onclick = function() {
		
		// 체크박스에 체크가 되어 있으면
		if(inactiveToday.checked) {
			// 서버에 페이지 요청
			popupForm.submit() ;
		}
		// 팝업 창 닫기
		popup.style.display = "none" ;
	}
</script>

</body>
</html>