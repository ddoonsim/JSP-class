<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>폼값 전송하기</h2>
<form>
	이름 : <input type="text"><br>
	성별 : <input type="radio" name="sex" value="male">남자 
			<input type="radio" name="sex" value="female">여자<br>
	학력 : <select>
			<option value="ele">초딩</option>
			<option value="mid">중딩</option>
			<option value="high">고딩</option>
			<option value="univ">대딩</option>
		 </select><br>
	관심 사항 : 
		<input type="checkbox" value="pol">정치
		<input type="checkbox" value="eco">경제
		<input type="checkbox" value="ent">연예
		<input type="checkbox" value="work">운동<br>
	<button type="submit">전송하기</button>
</form>

</body>
</html>