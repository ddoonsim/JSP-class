<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style type="text/css">
	body {
		padding: 10% ;
		padding-left: 20% ;
		padding-right: 20% ;
	}
</style>
</head>
<body>

<h2>🔍도서 상세 정보</h2>
<br><br>

<h3>${ view.title }</h3>
<hr>
<p>저자 : ${ view.author }</p>
<p>대여 가능 여부 : ${ view.rentYnStr }</p>
<hr>

<button type="button" class="btn btn-sm btn-outline-dark" id="goList">목록</button>
<script type="text/javascript">
	goList.addEventListener('click', function() {
		history.back() ;
	});
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>