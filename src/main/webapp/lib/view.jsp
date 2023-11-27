<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

</head>
<body>

<!-- header 외부파일 인클루드 -->
<%@ include file="/header.jsp" %>

<div class="container-fluid">
<!-- Main -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">🔍도서 상세 정보</h6>
	</div>
	<div class="col-sm-12 col-md-6"></div>
		<div class="card-body"></div>
			<div class="col-sm-12 col-md-6 mb-5">
		
			<h3 class="m-0 font-weight-bold text-primary">${ view.title }</h3>
			<hr>
			<p>저자 : ${ view.author }</p>
			<p>대여 가능 여부 : ${ view.rentYnStr }</p>
			<hr>
			
			<button type="button" class="btn btn-sm btn-outline-dark" id="goList">목록</button>
			</div>
	</div>
</div>

<script type="text/javascript">
	goList.addEventListener('click', function() {
		history.back() ;
	});
</script>

<!-- footer 외부파일 인클루드 -->
<%@ include file="/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>