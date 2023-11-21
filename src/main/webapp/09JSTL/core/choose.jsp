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
			event.preventDefault() ;
			// 유효성검사
			let res = validateForm(testForm) ;
			if(res) {
				// 폼 전송
				testForm.submit() ;
			}
		});
	}
	
	// 유효성검사(validation check)
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