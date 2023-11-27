<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookList</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>

<!-- header 외부파일 인클루드 -->
<%@ include file="/header.jsp" %>



<!-- ------------------------------------------------------- -->


<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">📚BOOKs</h1>
                    

<p><button type="button" class="btn btn-outline-primary btn-sm" id="regBtn">도서 등록</button></p>

<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
	</div>
	<div class="col-sm-12 col-md-6"></div>
	<div class="card-body">
<!-- 도서 검색 폼 -->
<form class="d-flex mb-4 column-gap-1" name="bookForm">
		<!-- 도서검색 부분 -->
    	<select class="btn btn-outline-secondary btn-sm dropdown-toggle" name="searchField">
    		<option value="title" ${ param.searchField eq 'title' ? 'selected' : '' }>제목</option>
    		<option value="author" ${ param.searchField eq 'author' ? 'selected' : '' }>저자</option>
    	</select>
     	<input class="form-control w-25" type="text" name="searchWord"  
      					value="${ param.searchWord }" placeholder="Search" aria-label="Search" style="width: 200px">
      	<button class="btn btn-sm btn-outline-success" type="submit" name="searchBtn">Search</button>
		<!-- 도서검색 부분 끝 -->
<input type="text" name="pageNo" value="${ pageDto.cri.pageNo }" style="display: none">
<input type="text" name="no" value="" style="display: none">
 
</form>
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>저자</th>
						<th>대여 여부</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>저자</th>
						<th>대여 여부</th>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach items="${ list }" var="book">
						<tr>
							<td>${ book.no }</td>
							<td><a onclick="goDetail(${ book.no })">${ book.title }</a></td>
							<td>${ book.author }</td>
							<td>${ book.rentYnStr }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>


<!-- ------------------------------------------------------- -->




<script type="text/javascript">
	function goPage(pageNo) {
		bookForm.pageNo.value = pageNo ;
		bookForm.action = "/bookList" ;
		bookForm.submit() ;
	} 
	function goDetail(no) {
		bookForm.no.value = no ;
		bookForm.action="/view" ;
		bookForm.submit() ;
	}
	regBtn.addEventListener('click', function() {
		location.href="/lib/reg.jsp" ;
	});
</script>


<!-- 페이지 블럭을 출력하는 방법
	1. 요청 컨트롤러에서 pageDto를 request영역에 저장
	2. pageNavi.jsp를 include
		- 리스트 페이지의 페이지 블럭을 출력하고 싶은 위치에 
	3. searchForm을 생성
		- pageNo 요소가 있어야 함
 -->

<%@ include file="pageNavi.jsp" %>
<!-- footer 외부파일 인클루드 -->
<%@ include file="/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>