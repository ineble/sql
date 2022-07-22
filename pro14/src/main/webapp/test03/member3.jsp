<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="id" value="hong" scope="page" />
<c:set var="pwd" value="1234" scope="page" />
<c:set var="name" value="${'홍길동'}" scope="page" />
<c:set var="age" value="${22}" scope="page" />
<c:set var="height" value="${177}" scope="page" />
<c:remove var="age"/>
<c:remove var="height"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table align="center" border="1">
		<tr align="center" bgcolor="lightgreen">
		<td width="15%">아이디</td>
		<td width="15%">비밀번호</td>
		<td width="15%">이름</td>
		<td width="15%">나이</td>
		<td width="15%">키</td>
		</tr>
		<tr align="center">
		<td width="15%">${id}</td>
		<td width="15%">${pwd}</td>
		<td width="15%">${name}</td>
		<td width="15%">${age}</td>
		<td width="15%">${height}</td>
		</tr>
	</table>
</body>
</html>