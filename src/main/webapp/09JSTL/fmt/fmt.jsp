<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>숫자 포맷 설정</h2>
<!-- 
    formatNumber
    	var 	: 변수명 (변수명을 지정하지 않으면 바로 출력)
    	value 	: 출력할 숫자
    	pattern : 숫자패턴
    	scope 	: 영역
    	
    	type 	: 출력양식을 설정
    		- percent 	: 퍼센트
    		- currency 	: 통화 - ₩ 기호 표시
    		- number 	: 기본값, 일반숫자
    
    	groupingUsed : 구분기호 사용여부
--> 

<c:set var="num" value="12345"/>
<!-- 화면에 출력을 할 때
	문자열의 정렬
	숫자의 정렬 : 오른쪽 정렬, 천단위 콤마 표시    ## 자격증 시험 단골 문제
 -->
콤마 출력 : <fmt:formatNumber value="${ num }"></fmt:formatNumber><br>
콤마 출력 ❌ : <fmt:formatNumber value="${ num }" groupingUsed="false"></fmt:formatNumber>

<!-- 변수에 저장 -->
<fmt:formatNumber value="${ num }" var="saveVar" type="currency"></fmt:formatNumber><br>
변수에 저장된 값을 출력 : ${ saveVar }<br>

타입 지정 : <fmt:formatNumber value="0.3" type="percent"></fmt:formatNumber>


<h2>패턴을 지정해서 숫자를 활용</h2>
<p>
0, # : 자릿수를 의미<br>
0 : 자릿수를 지정했는데 해당 자리에 수가 없으면 0을 출력<br>
# : 자릿수를 지정했는데 해당 자리에 수가 없으면 출력 ❌
</p>
<p>
300<br>
00000 -> 00300 : 자릿수를 맞추고 싶을 때<br>
##### -> 300
</p>


<!-- 출력 형식을 지정하는 것은 매우 중요한 일이지만 보통은 쿼리를 실행하면서 포맷을 지정하여 dto에 담기 때문에 
	jstl 태그를 이용한 출력 형식 지정은 매우 드물게 사용
-->
<c:set var="num1" value="12345.0111"/>

형식 없음 : <fmt:formatNumber value="${ num1 }"/><br>
0,00.00 : <fmt:formatNumber value="${ num1 }" pattern="0,00.0"/><br>
0,000,00.0 : <fmt:formatNumber value="${ num1 }" pattern="0,000,00.0"/><br>
#,###.## : <fmt:formatNumber value="${ num1 }" pattern="#,###.##"/><br>
###,###.0000000 : <fmt:formatNumber value="${ num1 }" pattern="###,###.0000000"/><br>

<fmt:parseNumber value="${ num1 }" integerOnly="true" var="saveVar"/>
정수만 출력 : ${ saveVar }


</body>
</html>