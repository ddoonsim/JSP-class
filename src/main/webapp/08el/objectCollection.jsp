<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.momo.dto.Person"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	// 리스트 생성
	List<Object> aList = new ArrayList<>() ;
	aList.add("문자열") ;
	aList.add(new Person("momo", 25)) ;
	
	// 페이지 영역에 리스트 저장
	// ‼️el표현언어를 사용하기 위해서 내장 객체에 값이 저장되어 있어야함!!!
	pageContext.setAttribute("aList", aList) ;
%>

<h3>List 컬렉션</h3>
<!-- 영역을 지정하지 않아도 작은 영역부터 탐색해서 있으면 데이터 가져옴 -->
<!-- 객체의 주소값이 출력(toString()메서드의 호출결과) 
		-> toString()을 재정의한 경우, 해당 메서드의 실행 결과 출력-->
<br>${ aList }        
<br>${ aList[0] }     
<br>${ aList[1].name }
<br>${ aList[1].age } 
<!-- 존재하지 않는(null) 데이터 -->
<br>없어도 오류가 발생하지 않는다 ====> ${ aList[2].age }


<br><hr>
<h3>Map 컬렉션</h3>

<%
	Map<String, String> map = new HashMap<>() ;
	// key, value
	map.put("한글", "모모") ;
	map.put("Eng", "momo") ;
	
	pageContext.setAttribute("map", map) ;
%>

<ul>
	<li>
		한글
		<p>${ map['한글'] }</p>
		<p>${ map["한글"] }</p>
		<p>\${ map.한글 }</p><!-- 한글은 .을 찍어서 접근 ❌ 
							\${} : 주석처리
							-->
		<p><%= map.get("한글") %></p>
	</li>
	<li>
		영어
		<p>${ map['Eng'] }</p>
		<p>${ map["Eng"] }</p>
		<p>${ map.Eng }</p>
		<p><%= map.get("Eng") %></p>
	</li>
</ul>

</body>
</html>