<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 메세지 출력 후 다른 페이지를 요청하거나 뒤로가기 -->
<script>
	// 서버로부터 전달받은 메세지를 출력
	let msg = '${ msg }' ;
	if(msg != '') {
		alert(msg) ;
	}
	// 서버로부터 전달받은 url로 이동
	// 단, url이 없다면 뒤로가기
	let url = '${ url }' ;
	
	if (url != '') {
		// url로 이동
		location.href = url ;
	} else {
		// 뒤로가기
		history.back() ;
	}
</script>

</body>
</html>