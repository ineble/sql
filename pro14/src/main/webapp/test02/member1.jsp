<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%
	request.setCharacterEncoding("utf-8"); 
	String id = (String)request.getAttribute("id");
	String pwd = (String)request.getAttribute("pwd");
	String name = (String)session.getAttribute("name");
	String email = (String)application.getAttribute("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center">
	<tr align="center" bgcolor="#99ccff">
	<td width="20%"><b>아이디</b></td>
	<td width="20%"><b>비밀번호</b></td>
	<td width="20%"><b>이름</b></td>
	<td width="20%"><b>이메일</b></td>
	</tr>
	<tr align="center">
	<td width="20%"><%=id %></td>
	<td width="20%"><%=pwd %></td>
	<td width="20%"><%=name %></td>
	<td width="20%"><%=email %></td>
	</tr>
	<tr align="center">
	<td width="20%">${id}</td>
	<td width="20%">${pwd}</td>
	<td width="20%">${name}</td>
	<td width="20%">${email}</td>
	</tr>
	</table>
</body>
</html>