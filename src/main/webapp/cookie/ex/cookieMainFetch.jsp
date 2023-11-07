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
    .none {
    	display: none ;
    }
</style> 

<title>Insert title here</title>
</head>
<body>

<h2>쿠키 - 팝업 연습</h2>

<%
	String none = "none" ;
	String str = "안녕하세요" ;
%>

<script type="text/javascript">
	//alert("none") ;
	//alert("<%= none %>") ;
	//alert('<%= "none" %>') ;
	
	//alert("<%= str %>") ;
	
	// id는 페이지 당 하나이기 때문에 아이디만 써서 요소 선택하는 것은 비추천
	// ex) popup. --> X
	/*	<추천하는 방식>
		document.querySelector('선택자') ;
		<선택자 종류>
		.클래스
		#아이디
		태그명
	*/
	// querySelector : 요소 하나만 선택
	// querySelectorAll : 모든 요소 선택 -> nodeList 타입으로 반환
									// 인덱스[n]으로 같은 이름의 특정 요소를 선택 가능
	window.onload = function() {
<%
	String display = "none" ;
	String cookieValue = CookieManager.readCookie(request, "popupClose") ;

	// popupClose 쿠키값이 없으면
	if(!cookieValue.equals("Y"))  {
		display = "block" ;
	}
%>
		document.querySelector('#popup').style.display='<%= display %>' ;
	
		// 닫기 버튼을 클릭하면 form을 전송
		closeBtn.onclick = function() {
			// 체크박스에 체크가 되어 있으면
			if(inactiveToday.checked) {
				// 서버에 페이지를 요청하는 2가지 방법[비동기 통신]
				// popupForm.submit() ;   <-- 페이지 전체가 새 html페이지로 전환됨(일부만은 불가능)
				
				// fetch : 데이터(JSON 형식의 문자열 형태)만 전달 --> 한 페이지 내의 일부만 전환하고 싶을 때
				fetch('cookieAction.jsp') ;
				console.log('fetch를 이용하여 서버에 cookieAction.jsp페이지를 요청') ;
			} 
			// 팝업창 닫기
			document.querySelector('#popup').style.display='none' ;
		}
	}
</script>


	<!-- 
		<%=none %> : 변수 선언 후에 사용
		태그에 속성을 정의할 때, 작은따옴표 또는 큰따옴표로 감싸주는 것 -> 해당 속성의 값의 범위를 정의하는 것
		
		class 속성에 값을 여러 개 값을 정의할 수 있다!
		class = "none1 none2" -> 공백으로 속성을 구분 가능  
	 -->
<form action="cookieAction.jsp" name="popupForm">
	<div id="popup" class="none">
        <h2 align="center">공지사항 팝업입니다.</h2>
        <div align="right">
	            <input type="checkbox" id="inactiveToday" name="inactiveToday" checked="checked" value="Y" /> 
	            하루 동안 열지 않음
	            <input type="button" value="닫기" id="closeBtn" /> 
        </div>
    </div> 
</form>    


</body>
</html>