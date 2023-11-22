<%@page import="com.momo.dto.Criteria"%>
<%@page import="com.momo.dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 부트스트랩 CSS 가져와서 사용 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style type="text/css">
	body {
		margin: 100px ;
	}
	nav {
		padding: 20px ;
	}
</style>
</head>
<body>

<%
	PageDto pageDto = null ;
	// Controller에서 request영역에 저장한 pageDto를 화면에서 사용할 수 있도록 변수에 저장
	if(request.getAttribute("pageDto") != null && 
			!"".equals(request.getAttribute("pageDto"))) {
		pageDto = (PageDto)request.getAttribute("pageDto") ;
	} else {
		pageDto = new PageDto(0, new Criteria()) ;
	}
%>

<!-- 페이지네이션 -->
<nav aria-label="...">
  <ul class="pagination justify-content-center">
  	<!-- 앞으로 가기 버튼 disabled : 클릭 비활성화 -->
    <li class="page-item <%= pageDto.isPrev() ? "" : "disabled" %>">
    <!-- href="..." 링크로 이동할 경우, 검색어가 유지되지 않음
    	검색어를 유지하기 위해 searchForm을 전송하는 goPage 함수 생성
    	링크를 함수호출로 변경 onClick이벤트가 발생하면 goPage()함수를 호출
    	-> 함수의 파라미터로 페이지번호를 넣어주어야 함 -->
      <a class="page-link"
      onclick="goPage(<%= pageDto.getStartNo()-1 %>)"> >Previous</a>
    </li>
    <!-- 앞으로가기 버튼 끝 -->
    
    <%
    	for(int i = pageDto.getStartNo(); i <= pageDto.getEndNo(); i++) {
    	
    %>
		    <li class="page-item <%= pageDto.getCri().getPageNo() == i ? "active" : "" %>">
		    	<a class="page-link" 
		    	onclick="goPage(<%= i %>)"><%= i %></a>
		    </li>
    
    <% } %>
    
    <!-- 뒤로가기 버튼 시작 -->
    <li class="page-item <%= pageDto.isNext() ? "" : "disabled" %>">
      <a class="page-link" 
      onclick="goPage(<%= pageDto.getEndNo()+1 %>)">Next</a>
    </li>
    <!-- 뒤로가기 버튼 끝 -->
  </ul>
</nav>

<!-- 부트스트랩 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>