<%@page import="com.momo.utils.CookieManager"%>
<%@page import="com.momo.el.MyElClass"%>
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
	MyElClass myClass = new MyElClass() ;

	request.setAttribute("myClass", myClass) ;
%>

<h3>객체를 영역에 저장 후 메서드 호출하기</h3>
<p>el 표현언어에서 사용하기 위해서는 내장객체의 영역에 저장되어 있어야 한다!!</p>
<br>123456-1234567 : ${ myClass.getGender("123456-1234567") }
<br>123456-2234567 : ${ myClass.getGender("123456-2234567") }
<br>123456-3234567 : ${ myClass.getGender("123456-3234567") }
<br>123456-4234567 : ${ myClass.getGender("123456-4234567") }
<br>123456-5234567 : ${ myClass.getGender("123456-5234567") }

<!-- getter 메서드를 이용해서 값을 출력하므로 메서드가 없다면 오류 발생 -->
<br>gender : ${ myClass.gender }

<br><hr>
<h3>정적메서드 호출하기</h3>

<%
	request.setAttribute("response", response) ;
%>
response : ${ response }
<br>cookieManager : ${ CookieManager.makeCookie(response, "myCookie", "el사용", 100) }


<br><hr>
<h3>메서드 호출하기</h3>

${ "123-123".replace("-", "") }

</body>
</html>