<%@page import="java.io.Console"%>
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
</style> 

<title>Insert title here</title>
</head>
<body>

<h2>쿠키를 이용한 팝업창 제어 ver 1.0</h2>

<!-- script 화면(요소)의 동적인 제어 -->
<script>
	// window객체의 onload이벤트가 발생 하면 실행
	// html요소가 모두 생성된 상태에서 실행
	window.onload = function() {
		
		
		// 버튼에 이벤트 등록
		closeBtn.onclick = function() {


			// 체크박스에 체크되어 있으면 쿠키를 생성하는 페이지 호출
			if(document.querySelector('#inactiveToday').checked) {
				// alert('체크박스가 선택되었습니다.') ;
				console.log('체크박스가 선택되었습니다.') ;
				
				// 서버에 요청 방법
				// 1. href : queryString을 이용해서 파라메터를 전달
				// 2. form submit : form 안에 요소들을 가지고 이동 | 파라메터로 전달
				popupForm.submit() ;
				
			} else {
				console.log('체크박스가 선택되었습니다.') ;
			}
			
			alert('닫기 버튼이 클릭되었습니다.') ;
			popup.style.display = 'none' ;
			
		}
	}
</script>


<!-- 
	1. 닫기 버튼을 클릭하면 cookiePopupAction.jsp 파일 호출
		- 팝업 닫힘 쿠키를 생성
	2. 팝업닫힘 쿠키가 생성이 되어 있다면, 더 이상 팝업 창을 보여주지 않도록 처리
 -->
 
 <form action="cookiePopupAction.jsp" name="popupForm">
 
		
		<%  // 자바 코드 시작
			String popupClose = CookieManager.readCookie(request, "popupClose") ;
			// 쿠키에 저장된 popClose의 값이 Y가 아닐 때만 화면에 팝업을 생성
			if(!"Y".equals(popupClose)) {
				
			// 자바 코드 빠져나가기
		%>
		
	<div id="popup" >
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
	            <input type="checkbox" id="inactiveToday" name="inactiveToday" checked="checked" value="Y" /> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" /> 
	        
        </div>
    </div> 
    
    	<%  // 자바 코드 재시작
			}
			// 자바 코드 end
		%>
		
</form>

</body>
</html>