<%@page import="com.momo.dto.EmpDto"%>
<%@page import="com.momo.dao.EmpDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table, tr, th, td {
		width: 400px ;
		text-align: center ;
		border : 1px solid ;
		border-collapse: collapse;
	}
	th {
		background-color: lightgray ;
	}
</style>
</head>
<body>

<h2>Controller를 이용해서 사원목록을 출력해봅시다.</h2>

<table>
	<tr>
		<th>사번</th>
		<th>사원명</th>
		<th>주민등록번호</th>
	</tr>

<%
	// request.getAttribute()의 반환타입 Object 타입이므로
	// 형변환 후에 사용이 가능
	List<EmpDto> list = (List<EmpDto>)request.getAttribute("list") ;

	// 화면에 출력
	for(EmpDto emp : list) {
%>
		<tr>
			<td><%= emp.getEmp_id() %></td>
			<td><%= emp.getEmp_name() %></td>
			<td><%= emp.getEmp_no() %></td>
		</tr>
<%
	}
%>
</table>
</body>
</html>