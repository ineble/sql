<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var=id scope="page" value="song" />
<c:set var=name scope="page" value="songjiseop" />
<c:set var=age scope="page" value="29" />
<c:set var=height scope="page" value="182" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center">
	<tr align="center" bgcolor="lightblue">
	<td width="15%">아이디</td>
	<td width="15%">이름</td>
	<td width="15%">나이</td>
	<td width="15%">키</td>
	</tr>
	<tr align="center">
	<td width="15%">${id}</td>
	<td width="15%">${name}</td>
	<td width="15%">${age}</td>
	<td width="15%">${height}</td>
	</tr>
	</table>
</body>
</html>