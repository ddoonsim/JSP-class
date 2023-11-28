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

<h2>파일 목록</h2>

<table border="1">
	<tr>
		<th>일련번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>카테고리</th>
		<th>원본파일명</th>
		<th>저장된 파일명</th>
		<th>업로드 일자</th>
		<th>다운로드 파일</th>
	</tr>
<c:forEach items="${ list }" var="file">
	<tr>
		<td>${ file.file_no }</td>
		<td>${ file.name }</td>
		<td>${ file.title }</td>
		<td>${ file.cate }</td>
		<td>${ file.ofile }</td>
		<td>${ file.sfile }</td>
		<td>${ file.postdate }</td>
		<td>
			<a href="/10upload/fileDownload.jsp?ofile=${ file.ofile }&sfile=${ file.sfile }">
				파일 다운로드
			</a>
		</td>
	</tr>
</c:forEach>
</table>
<!-- 
	ofile : 원본파일명
	sfile : 새 파일명
 -->

<button id="uploadBtn">파일 업로드</button>

<script type="text/javascript">
	uploadBtn.addEventListener('click', function() {
		location.href="/10upload/fileUpload.jsp" ;
	});
</script>
</body>
</html>