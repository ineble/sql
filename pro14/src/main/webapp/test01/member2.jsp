<%@page import="com.sun.jdi.Value"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

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
		<td width="20%"><b>아이디</b></td>
		<td width="20%"><b>비밀번호</b></td>
		<td width="20%"><b>이름</b></td>
		<td width="20%"><b>이메일</b></td>
		<td width="20%"><b>주소</b></td>
		</tr>
		<tr align="center" class="color">
		<td>${param.id}</td>
		<td>${param.pwd}</td>
		<td>${param.name}</td>
		<td>${param.email}</td>
		<td>${requestScope.address}</td>
		</tr>
		
	</table>
	
</body>
</html>