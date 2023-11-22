<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>

<!-- header 외부파일 인클루드 -->
<%@ include file="common/header.jsp" %>

<!-- 도서목록을 출력 -->
도서목록을 출력
<form name="bookForm">
pageNo : <input type="text" name="pageNo" value="${ pageDto.cri.pageNo }">
<table class="table table-hover">
	<tr>
		<th scope="col">번호</th>
		<th scope="col">제목</th>
		<th scope="col">저자</th>
	</tr>
	<c:forEach items="${ list }" var="book">
		<tr>
			<td>${ book.no }</td>
			<td>${ book.title }</td>
			<td>${ book.author }</td>
		</tr>
	</c:forEach>
</table>
</form>

<script type="text/javascript">
	function goPage(pageNo) {
		bookForm.pageNo.value = pageNo ;
		bookForm.action = "/bookList" ;
		bookForm.submit() ;
	} 
</script>

<%@ include file="pageNavi.jsp" %>
<!-- footer 외부파일 인클루드 -->
<%@ include file="common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>