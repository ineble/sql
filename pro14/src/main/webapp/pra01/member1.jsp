<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,sec01.ex01.*"
    isELIgnored="false"
    %>
    
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("utf-8"); 
%>

<jsp:useBean id="m1" class="sec01.ex01.MemberBean" />
<jsp:setProperty name="m1" property="*" />
<jsp:useBean id="memberList" class="java.util.ArrayList" />
<% memberList.add(m1); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1 align="center" >
	<tr align="center" bgcolor="#99ccff">
	<td width="20%"><b>아이디</b></td>
	<td width="20%"><b>비밀번호</b></td>
	<td width="20%"><b>이름</b></td>
	<td width="20%"><b>이메일</b></td>
	</tr>
	<tr align="center" >
	<td width="20%">${memberList[0].id}</td>
	<td width="20%">${memberList[0].pwd}</td>
	<td width="20%">${memberList[0].name}</td>
	<td width="20%">${memberList[0].email}</td>
	</tr>
	</table>
	
</body>
</html>