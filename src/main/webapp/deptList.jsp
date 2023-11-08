<%@page import="com.momo.dto.DeptDto"%>
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

<h2>부서 목록</h2>
<%
	// jsp를 단독으로 실행할 경우, null이 출력될 수 있다.
	// ∵ 서블릿에서 요청영역에 list를 저장해야 하는데 그 과정이 없었기 때문에
	List<DeptDto> list = (List<DeptDto>)request.getAttribute("list") ;
	out.print(list) ;
%>

</body>
</html>