<%@page import="com.momo.common.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>JDBC 테스트 1</h2>

<%
	// connection 객체 생성
	DBConnection dbcon = new DBConnection() ;
	dbcon.stmt = dbcon.con.createStatement() ;
	dbcon.rs = dbcon.stmt.executeQuery("select sysdate from dual") ;
	
	dbcon.rs.next() ;
	out.print("데이터베이스 시간 : " + dbcon.rs.getString(1)) ;
	
	// 자원 반납 필수
	dbcon.close() ;
	
	out.print("<br>driver : " + application.getInitParameter("driver")) ;
	out.print("<br>url : " + application.getInitParameter("url")) ;
	out.print("<br>id : " + application.getInitParameter("id")) ;
	out.print("<br>pw : " + application.getInitParameter("pw")) ;
%>              

<hr><br>

<h2>JDBC 테스트 2</h2>

<%
	DBConnection dbcon2 = new DBConnection(
							application.getInitParameter("driver"), 
							application.getInitParameter("url"), 
							application.getInitParameter("id"), 
							application.getInitParameter("pw")
							) ;

	dbcon2.close() ;
%>

</body>
</html>