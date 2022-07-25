<%@page import="com.sun.jdi.Value"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	String id2 = request.getParameter("id"); 
	String pwd2 = request.getParameter("pwd");
	String name2 = request.getParameter("name");
	String age2 = request.getParameter("age");
	String height2 = request.getParameter("height");
%>

	<c:set var="id" value="hong" scope="page" />
	<c:set var="pwd" value="1234" scope="page" />
	<c:set var="name" value="${'홍길동'}" scope="page" />
	<c:set var="age" value="${22}" scope="page" />
	<c:set var="height" value="${100+82}" scope="page" />
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
		<tr align="center" bgcolor="lightgreen"> 
		<td width="7%"><b>아이디</b></td>
		<td width="7%"><b>비밀번호</b></td>
		<td width="7%"><b>이름</b></td>
		<td width="7%"><b>나이</b></td>
		<td width="7%"><b>키</b></td>
		</tr>
		<tr align="center" class="color">
		<td>${id}</td>
		<td>${pwd}</td>
		<td>${name}</td>
		<td>${age}</td>
		<td>${height}</td>
		</tr>
		<tr align="center" class="color">
		<td><%=id2 %></td>
		<td><%=pwd2 %></td>
		<td><%=name2 %></td>
		<td><%=age2 %></td>
		<td><%=height2 %></td>
		</tr>
		<tr align="center" class="color">
		<td><%=request.getParameter("id") %></td>
		<td><%=request.getParameter("pwd") %></td>
		<td><%=request.getParameter("name") %></td>
		<td><%=request.getParameter("age") %></td>
		<td><%=request.getParameter("height") %></td>
		</tr>
	</table>
	
</body>
</html>