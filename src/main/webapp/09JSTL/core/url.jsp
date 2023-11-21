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

	<!-- 
    	c:URL
    	지정한 경로와 매개변수를 이용해서 컨텍스트루트를 포함한 URL을 생성 합니다.
    	a태그의 href속성이나 form태그의 action속성에 이용할 수 있습니다.
    	
	    value 	: 경로
	    var 	: 변수명
	    
	    테스트 방법 : 서버에 컨텍스트루트를 지정하고 테스트
     --> 
     
<!-- url이라는 변수에 url 저장 -->
<c:url var="url" value="/09JSTL/include/otherPage.jsp"></c:url>
<a href="${ url }">외부페이지 바로가기 - url 태그 사용</a>


<c:set var="root" value="<%= request.getContextPath() %>"></c:set>
<p>contextPath : <%= request.getContextPath() %></p>
<a href="${ root }/09JSTL/include/otherPage.jsp">외부페이지로 바로가기 - request.getContextPath() 사용</a>

<form action="${ url }">
	<button>전송</button>
</form>

</body>
</html>