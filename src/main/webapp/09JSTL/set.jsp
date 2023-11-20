<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.momo.dto.Person"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Core 태그 : 변수선언, 조건문, 반복문 등을 대체하는 태그 제공 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- set : 변수선언 (=setAttribute())와 동일한 기능 
	var : 변수명 선언
	value : 값
	scope : 저장 영역 - 기본값은 page
-->
<c:set var="directVar" value="100" scope="request"/>
<c:set var="elVar" value="${ directVar mod 5 }"/>
<c:set var="dateVar" value="<%= new Date() %>"/>
<c:set var="betweenVar">값</c:set>

<h2>el을 이용해서 변수 출력</h2>

<ul>
	<li>${ directVar }</li>
	<li>${ elVar }</li>
	<li>${ dateVar }</li>
	<li>${ betweenVar }</li>
</ul>

<hr>
<h2>자바빈즈 생성1 -생성자를 이용</h2>

<c:set var="person" value='<%= new Person("GD", 25) %>'/>
<ul>
	<li>이름 : ${ person.name }</li>
	<li>나이 : ${ person.age }</li>
</ul>

<hr>
<h2>자바빈즈 생성2 - 생성 후 값을 변경</h2>

<c:set var="person2" value='<%= new Person("대성", 30) %>'/>
<p>변경 전</p>
<ul>
	<li>${ person2 }</li>
	<li>${ person2.name }</li>
	<li>${ person2.age }</li>
</ul>

<!-- 자바빈즈 생성 후 값을 변경
	target : 자바빈즈 변수명
	property : 자바빈즈 속성명(멤버변수명)
	value : 값 지정
 -->
 <c:set target="${ person2 }" property="name" value="빅뱅"/>
 <c:set target="${ person2 }" property="age" value="20"/>
<p>변경 후</p>
<ul>
	<li>${ person2 }</li>
	<li>${ person2.name }</li>
	<li>${ person2.age }</li>
</ul>

<hr>
<h2>List 컬렉션 이용하기</h2>
<%
	// 리스트 생성
	ArrayList<Person> list = new ArrayList<>() ;
	list.add(new Person("세븐틴", 17)) ;
	list.add(new Person("청하", 28)) ;
%>

<c:set var="list" value="<%= list %>"></c:set>
<ul>
	<li>${ list[0].name }</li>
	<li>${ list[0].age }</li>
</ul>
<ul>
	<li>${ list[1].name }</li>
	<li>${ list[1].age }</li>
</ul>

<hr>
<hr>
<h2>forEach 태그 사용하여 반복문 출력</h2>
<!-- 리스트를 출력하기 위해서 반복문 사용 -->
<c:forEach var="person" items="<%= list %>">
	이름 : ${ person.name }<br>
	나이 : ${ person.age }<br>
</c:forEach>

<hr>
<h2>Map 컬렉션 이용하기</h2>
<%
	// Map 컬렉션의 장점😊
	// 다른 타입의 여러 가지 값을 저장하기가 용이
	// ajax, petch를 이용할 경우 -> 데이터만 전달 -> 스크립트에서 데이터를 파싱하여 화면을 다시 그려주어야 함!!
	
	Map<String, Person> map = new HashMap<>() ;
	map.put("person1", new Person("사람1", 27)) ;
	map.put("person2", new Person("사람2", 20)) ;
%>

<!-- map은 변수로 선언만 하고 영역에 저장하지 않았기 때문에 el문법으로 사용❌ -->
<c:set var="map" value="<%= map %>"/>
<ul>
	<li>${ map.person1.name }</li>
	<li>${ map.person1.age }</li>
</ul>
<ul>
	<li>${ map.person2.name }</li>
	<li>${ map.person2.age }</li>
</ul>

</body>
</html>