<%@page import="com.momo.utils.JSFunction"%>
<%@page import="com.momo.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	if(request.getParameter("boardNo") != null) {
		String num = request.getParameter("boardNo") ;
		BoardDao dao = new BoardDao() ;
		dao.deleteBoard(num) ;
		//if(dao.deleteBoard(num) != 1) {
		//	JSFunction.alertBack("게시물이 존재하지 않습니다.", out) ;
		//}
		// 정상적으로 삭제처리가 된 경우
		JSFunction.alertLocation("삭제되었습니다.", "/boardList", out) ;
	} else {
		/*
		out.print("<script type='text/javascript'>") ;
		// 메시지 출력 후 이전 페이지로 이동하기
		out.print("alert('게시물이 존재하지 않습니다. 게시물번호를 확인할 수 없습니다.') ;") ;
		// 뒤로가기
		out.print("history.back()") ;
		out.print("</script>") ;
		*/
		
		JSFunction.alertBack("게시물이 존재하지 않습니다. 게시물번호를 확인할 수 없습니다.", out) ;
	}
%>


</body>
</html>