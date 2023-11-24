<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.area1 {
		/*border: 1px solid ;*/
		width: 500px ;
		height: 500px ;
		overflow: scroll;
	}
</style>
</head>
<body>

<script type="text/javascript">
	window.onload = function() {
		btn1.addEventListener('click', function() {
			// 생성자를 이용한 정규표현식 객체 생성
			// 매개값 : 패턴문자열(정규표현식)을 지정
			let regExp = new RegExp('script') ;
			console.log(regExp, typeof(regExp), regExp instanceof RegExp) ;
			
			// 리터럴을 이용한 정규표현식 객체 생성
			// 패턴 양쪽에 /로 작성(시작 기호, 종료 기호)
			let regExp1 = /script/ ;
			console.log(regExp1, typeof(regExp1), regExp1 instanceof RegExp) ;
			
			/*
	        RegExp 객체에서 제공하는 메소드
	            객체.test(문자열) : 문자열에 정규식 패턴을 만족하는 값이 있으면 true, 없으면 false를 리턴한다.
	            객체.exec(문자열) : 문자열에 정규식 패턴을 만족하는 값이 있으면 처음 매치된 문자열 리턴한다.
            */ 
			
            let str1 = "javascript jquery ajax" ;
            let str2 = "java jquery ajax" ;
			
			area1.innerHTML = "regExp.test(str1) : " + regExp.test(str1) + "<br>" 
			+ "regExp.test(str2) : " + regExp.test(str2) + "<br>" 
			+ "regExp.exec(str1) : " + regExp.exec(str1) + "<br>" 
			+ "regExp.exec(str2) : " + regExp.exec(str2) + "<br>" ;
            
			// [예시]전화번호 : 숫자3-숫자4-숫자4
			// 	   이메일 : 영문대소자||기호 @ 영문자.영문자
			/* 
				숫자 : \d
				+ : 1개 이상
				$ : 정규표현식 끝을 의미
			*/
			let num = /\d+/ ;   // 숫자가 1개 이상이면 true
			area1.innerHTML += "num.test('0123aa') : " + num.test('0123aa') + "<br>" ;
			
			let num1 = /\d+$/ ; // 숫자만 허용!(문자가 있으면 false) 
			area1.innerHTML += "num1.test('0123aa') : " + num1.test('0123aa') + "<br>" ;
			
			/*
				전화번호 체크
				숫자3개-숫자4개-숫자4개
				문자열{반복횟수} -> x{3} : xxx
				=> \d{3}-\d{4}-\d{4}
			*/
			let phone = /\d{3}-\d{4}-\d{4}/ ;
			console.log('phone1 : ', phone.test('000-0000-0000')) ;
			console.log('phone2 : ', phone.test('000')) ;
			console.log('phone3 : ', phone.test('aaa-aaaa-aaaa')) ;
			
			/*
			^ : 시작
			$ : 종료
			\w : 알파벳 문자와 숫자
			\.- : ., -
		*/
		let pattern = /^[\w._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/ ;
		// [영대소문자, 숫자, 기호]한 번 이상 @ [영대소문자, 숫자, ., -]한 번 이상 . 영어대소문자 2번 이상
		console.log('email', pattern.test('ddoonsim.@naver.com')) ;
		console.log('email2', pattern.test('ddoonsim@naver.com')) ;
		console.log('email3', pattern.test('ddoonsim.naver.com')) ;
			
			/* 박스 안에 출력하기
			area1.innerHTML = "" 
							+ " <table border='1'>    " 
							+ " 	<tr>              " 
							+ " 		<td>test1</td>" 
							+ " 		<td>test2</td>" 
							+ " 		<td>test3</td>" 
							+ " 	</tr>             " 
							+ " </table>              " ;*/
			
		});
	}
</script>
<!-- 
<table>
	<tr>
		<td>test1</td>
		<td>test2</td>
		<td>test3</td>
	</tr>
</table> -->

<h1>정규표현식</h1>
<p>
	정규 표현식(Regular Expresison)이란, <br>
        특정 규칙을 가진 문자열을 검색하거나 치환할 때 사용하는 형식 언어이다. <br><br>

        정규 표식을 이용하면 입력된 문자열에 대해 특정 조건 검색이나 치환 시
        복잡한 조건을 제시할 필요 없이 간단하게 처리가 가능하다.
</p>

<h2>1. 정규 표현식 객체 생성</h2>
    <p>
        정규 표현식 객체를 생성하기 위해서는 정규 표현식 리터럴과 RegExp 생성자 함수를 사용한다. <br>
        리터럴을 사용하는 것이 일반적이다. (/패턴/플래그)
    </p> 
    
    <button id="btn1">실행</button>
    <div id="area1" class="area1"></div>

</body>
</html>