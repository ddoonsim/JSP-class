<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>게시글 작성</h2>

<table>
	<tr>
		<td>제목</td>
		<td><input type="text"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea style="width: 90%; height: 100px"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center"></td>
		<button type="submit" id="okBtn">작성</button>
		<button type="reset">초기화</button>
		<button type="button">목록보기</button>
	</tr>
</table>

<script type="text/javascript">
	okBtn.addEventListener('click', ()=>{
		location.href='/write' ;
	}
</script>

</body>
</html>