<%@page import="com.sun.jdi.Value"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<c:set var="id" value="hong" scope="page" />
	<c:set var="pwd" value="1234" scope="page" />
	<c:set var="name" value="홍길동" scope="page" />
	<c:set var="email" value="hong@test.com" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
	.color>td{
	background-color: lightblue; 
	}
	</style>
</head>
<body>
	<table align="center" border="1">
		<tr align="center" bgcolor="#99ccff"> 
		<td width="7%"><b>아이디</b></td>
		<td width="7%"><b>비밀번호</b></td>
		<td width="7%"><b>이름</b></td>
		<td width="7%"><b>키</b></td>
		</tr>
		<tr align="center" class="color">
		<td>${id}</td>
		<td>${pwd}</td>
		<td>${name}</td>
		<td>${email}</td>
		</tr>
		<tr align="center" class="color">
		<td>${param.id}</td>border="1"
		<td>${param.pwd}</td>
		<td>${param.name}</td>
		<td>${param.email}</td>
		</tr>
	</table>
	
</body>
</html>