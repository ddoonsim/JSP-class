<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	window.onload = function() {
		submitBtn.addEventListener('click', function() {
			// 콘솔에 로그를 찍을 때 ,로 연결하면 객체 정보 확인 가능
			// 스크립트는 이벤트에 의해서 동작되는 경우가 많다.
			console.log('event', event) ;
			// 폼 내부에 버튼이 하나만 있을 때는 이 버튼은 서브밋 버튼이됨
			// 서브밋 버튼에는 폼을 전송하는 기본이벤트가 정의되어 있음
			// 유효성검사를 진행하기 위해서는 기본이벤트를 제거하는 작업이 필요!!
			event.preventDefault() ;    // 기본이벤트를 제거하는 함수
			// 유효성검사
			let res = validateForm(testForm) ;
			if(res) {
				// 폼 전송
				testForm.submit() ;
			}
		});
	}
	
	// 유효성검사(validation check)
	// form 요소를 매개변수로 받아서 form의 요소의 값을 체크
	// 함수 정의 
	// function 함수이름(매개변수) {}
	// form : 변수 이름
	function validateForm(form) {
		// 유효성검사 결과 testForm을 submit
		// 체크로직을 모두 통과했다면 서버에 요청, 체크로직을 통과하지 못하면 메세지 표시
		if(form.kor.value == '') {
			alert('국어점수를 입력하세요.') ;
			form.kor.focus() ;
			return false ;
		}
		if(form.eng.value == '') {
			alert('영어점수를 입력하세요.') ;
			form.eng.focus() ;
			return false ;
		}
		if(form.math.value == '') {
			alert('수학점수를 입력하세요.') ;
			form.math.focus() ;
			return false ;
		}
		return true ;
	}
</script>


<hr>
<h2>국, 영, 수 점수를 입력하면 평균을 내어 학점을 출력</h2>
<p>>=90 : A | >= 80 : B | >= 70 : C | >= 60 : D</p>

<!-- form에 action을 주지 않은경우, 동일한 페이지를 다시 요청합니다. -->
<form name="testForm">
	이름 : <input type="text" name="name" value="momo"><br>
	국어 : <input type="text" name="kor" value="98"><br>
	영어 : <input type="text" name="eng" value="82"><br>
	수학 : <input type="text" name="math" value="76"><br>
	<button type="submit" id="submitBtn">학점 구하기</button>
</form>
<hr>
<c:if test="${ not empty param.kor
				and not empty param.eng 
				and not empty param.math }">
<h3>입력 받은 값</h3>
<p>
이름 : ${ param.name }<br>
국어점수 : ${ param.kor }점<br>
영어점수 : ${ param.eng }점<br>
수학점수 : ${ param.math }점<br>
합계 : ${ param.kor + param.eng + param.math }<br>
<c:set var="avg" value="${ (param.kor + param.eng + param.math)/3 }"/>
평균 점수는 ${ avg } 점입니다. <br>
${ param.name }님의 학점은 
<c:choose>
	<c:when test="${ avg >= 90 }">A</c:when>
	<c:when test="${ avg >= 80 }">B</c:when>
	<c:when test="${ avg >= 70 }">C</c:when>
	<c:when test="${ avg >= 60 }">D</c:when>
	<c:otherwise>F</c:otherwise>
</c:choose>
입니다.
</p>
</c:if>

<!-- ------------------------------------------------------------------- -->
<form name="testForm1">
	국어 : <input type="text" name="kor"><br>
	영어 : <input type="text" name="eng" value="82"><br>
	수학 : <input type="text" name="math" value="76"><br>
	<button onclick="return validateForm(testForm1);">전송</button>
</form>

<hr>
<form name="testForm2" onsubmit="return validateForm(testForm2);">
	국어 : <input type="text" name="kor"><br>
	영어 : <input type="text" name="eng" value="82"><br>
	수학 : <input type="text" name="math" value="76"><br>
	<button>전송</button>
</form>

</body>
</html>