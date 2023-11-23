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

<!-- 메뉴, 로그인 정보 -->
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
  	<a class="navbar-brand" href="#">
  		<img src="https://cdn-icons-png.flaticon.com/512/2232/2232688.png" alt="Bootstrap" width="30" height="30">
    BOOKS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">BookList</a>
        </li>
      <c:if test="${ not empty sessionScope.id }">
        <li class="nav-item">
          <a class="nav-link navbar-brand" href="/logOut">🎃Logout</a>
        </li>
      </c:if>
      <c:if test="${ empty sessionScope.id }">
        <li class="nav-item">
          <a class="nav-link navbar-brand" href="/lib/loginForm.jsp">🆔Login</a>
        </li>
      </c:if>
      </ul>
    </div>
  </div>
</nav>

<hr>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>


</body>
</html>