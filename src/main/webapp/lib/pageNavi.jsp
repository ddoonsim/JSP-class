<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>

<!-- 페이지 네비게이터 -->


<nav aria-label="...">
  <ul class="pagination">
  	<!-- 이전 페이지로 이동 버튼 시작 -->
    <li class="page-item ${ pageDto.prev ? '' : 'disable' }">
      <a class="page-link" onclick="goPage(${ pageDto.startNo - 1 })">Previous</a>
    </li>
    <!-- 이전 페이지로 이동 버튼 끝 -->
    
    <c:forEach begin="${ pageDto.startNo }" end="${ pageDto.endNo }" var="i">
    <li class="page-item">
    	<a class="page-link ${ pageDto.cri.pageNo = i ? 'active' : '' }" href="#">i</a>
    </li>
    </c:forEach>
    
    <!-- 다음 페이지로 이동 버튼 시작 -->
    <li class="page-item ${ pageDto.next ? '' : 'disable' }">
      <a class="page-link" onclick="goPage(${ pageDto.endNo + 1 })">Next</a>
    </li>
    <!-- 다음 페이지로 이동 버튼 시작 -->
  </ul>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>