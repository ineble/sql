<%@page import="com.sun.jdi.Value"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m" class="sec01.ex01.MemberBean" />
<jsp:setProperty property="*" name="m"/>
<html>

<head>
<meta charset="UTF-8">
<title>회원 정보 출력창</title>
	<style type="text/css">
	.color>td{
	background-color: lightblue; 
	}
	
</style>
</head>
<body>
	<table align="center" border="1">
	<tr align="center" bgcolor="lightgreen"> 
		<td width="7%"><b>아이디</b></td>
		<td width="7%"><b>비밀번호</b></td>
		<td width="7%"><b>이름</b></td>
		<td width="7%"><b>이메일</b></td>
		</tr>
		<tr align="center" bgcolor="#99ccff"> 
		<td width="20%"><%=m.getId() %></td>
		<td width="20%"><%=m.getPwd() %></td>
		<td width="20%"><%=m.getName() %></td>
		<td width="20%"><%=m.getEmail() %></td>
		</tr>
		<tr align="center" class="color">
		<td>${m.id}</td>
		<td>${m.pwd}</td>
		<td>${m.name}</td>
		<td>${m.email}</td>
		</tr>
		
	</table>
	
</body>
</html>