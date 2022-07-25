<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="id" value="hong" scope="page" />
<c:set var="hp" value="010-2134-4569" scope="page" />
<c:set var="gender" value="남" scope="page" />
<c:set var="height" value="182" scope="page" />
<c:set var="age" value="${22}" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center">
		<tr align="center" bgcolor="lightred">
		<td width="15%">이름</td>
		<td width="15%">전화번호</td>
		<td width="15%">성별</td>
		<td width="15%">키</td>
		<td width="15%">나이</td>
		</tr>
		<tr>
		<td width="15%">${id}</td>
		<td width="15%">${hp}</td>
		<td width="15%">${gender}</td>
		<td width="15%">${height}</td>
		<td width="15%">${age}</td>
		</tr>
	</table>
</body>
</html>