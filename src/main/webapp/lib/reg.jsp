<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.w-15 {
		width: 15% ;
	}
	.w-20 {
		width: 20%;
	}
</style>
</head>
<body>

<!-- header 외부파일 인클루드 -->
<%@ include file="/header.jsp" %>


<!-- 등록처리 -->
<!-- - 등록페이지를 보여주기 -->
<!-- 	/book/reg.jsp 화면 생성 -->
<!-- 		- 제목, 작가 -->
<!-- 	등록폼 만들기 -->

<!-- - 리스트페이지에 등록 버튼을 생성하고  -->
<!-- 	버튼을 클릭 했을때 등록페이지로 이동 -->

<!-- - header, footer 인클루드  -->
<!--   main에도 틀을 잡아주세요 -->

<!-- - 등록처리 -->
<!-- 요청 : /book/bookRegProcess -->
<!-- 	com.momo.book.controller.BookRegController -->
<!-- 응답 : /book/msgBox.jsp 메세지 출력및 화면이동  -->


<div class="container-fluid">
<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">도서 등록</h6>
	</div>
	<div class="col-sm-12 col-md-6"></div>
	<div class="card-body">

<!-- 도서 등록폼 -->
<form name="bookRegForm">
	<div class="input-group mb-3">
	  <span class="input-group-text" id="basic-addon1">책 제목</span>
	  <input type="text" name="title" class="form-control" placeholder="책 제목을 입력하시오." 
	  		aria-label="Username" aria-describedby="basic-addon1">
	</div>
	<div class="input-group mb-3">
	  <span class="input-group-text" id="basic-addon1">저자</span>
	  <input type="text" name="author" class="form-control" placeholder="저자 이름을 입력하시오."
	  		aria-label="Username" aria-describedby="basic-addon1">
	</div>
	<div class="input-group mb-3">
	  <span class="input-group-text" id="basic-addon1">내용</span>
	  <input type="text" name="content" class="form-control" placeholder="도서의 상세 설명을 입력하시오."
	  		aria-label="Username" aria-describedby="basic-addon1">
	</div>
	<!-- 파일 첨부 -->
	<div class="input-group mb-3">
	  <label class="input-group-text" for="inputGroupFile01">책 표지 이미지</label>
	  <input type="file" class="form-control" id="inputGroupFile01" name="imgFile">
	</div>
	
	<button type="button" class="btn btn-sm btn-outline-primary mb-3" id="regBtn">등록</button>
</form>

<button type="button" class="btn btn-sm btn-outline-dark" id="cancelBtn">취소</button>

</div>
</div>
</div>

<script type="text/javascript">
	regBtn.addEventListener('click', function() {
		bookRegForm.action="/bookRegProcess" ;
		bookRegForm.method="post" ;
		bookRegForm.submit() ;
	})
	cancelBtn.addEventListener('click', function() {
		history.back() ;
	});
</script>

<!-- footer 외부파일 인클루드 -->
<%@ include file="/footer.jsp" %>

</body>
</html>