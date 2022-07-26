<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty param.userID}">
	로그인 창으로 이동해주세요!
	<a href="login.jsp">로그인창 가기</a>
	</c:if>
	<c:if test="${not empty param.userID}">
	<c:if test="${param.userID == 'admin'}">
	관리자로 로그인 하셨습니다! <br>
	<input type="submit" value="유저 삭제">  
	<input type="submit" value="유저 수정"> <br>
	<a href="login.jsp">로그인창 가기</a>
	</c:if>
	<c:if test="${param.userID != 'admin'}">
	<h1>"${param.userID}" 님 환영합니다!!!</h1>
	</c:if>
	</c:if>
	
</body>
</html>