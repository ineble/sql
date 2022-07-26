<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 창</h1>
	<form action="result.jsp" method="get">
	아이디 : <input  type="text" name="userID" /><br>
	비밀번호 : <input type="password" name="userPW" /><br>
	<input type="submit" value="로그인" /> &nbsp; <input type="reset" value="실행취소">
	</form>
	<br>
	<a href="join.jsp">회원가입하러가기</a>
</body>
</html>