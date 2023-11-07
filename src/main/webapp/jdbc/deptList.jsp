<%@page import="java.util.List"%>
<%@page import="com.momo.dao.DeptDao"%>
<%@page import="com.momo.dto.DeptDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	table, tr, td, th {
		width : 350px ;
		text-align: center ;
		border: 1px solid ;
		border-collapse: collapse; 
	}
</style>
<title>Insert title here</title>
</head>
<body>

<h2>부서 정보 리스트</h2>

<%
	DeptDao dao = new DeptDao(application) ;
	List<DeptDto> list = dao.getList() ;
	dao.close() ;
%>
<table>
	<tr>
		<th>부서번호</th>
		<th>부서명</th>
		<th>부서 위치 정보</th>
	</tr>
<%	
	for(DeptDto dept : list) {
%>
	<tr>
		<td><%= dept.getDept_id() %></td>
		<td><%= dept.getDept_title() %></td>
		<td><%= dept.getLocal_name() %></td>
	</tr>
<%
	}
%>
</table>
</body>
</html>