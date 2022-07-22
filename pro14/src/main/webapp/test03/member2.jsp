<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,sec01.ex01.*" 
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<%@
	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="membersList" class="java.util.ArrayList" />
<jsp:useBean id="membersMap" class="java.util.HashMap" />
<%
	//해쉬맵은 순서가 없음 중복된 key도 없음
	membersMap.put("id","park2");
	membersMap.put("pwd", "4321");
	membersMap.put("name", "박지성");	
	membersMap.put("email", "park@test.com");
	// bean형태로 만듬
	MemberBean m1 = new MemberBean("son","1234","손흥민","son@test.com");
	MemberBean m2 = new MemberBean("ki","4321","기성용","ki@test.com");
	// 리스트에 객체를 넣음
	membersList.add(m1);
	// 리스트에 객체를 넣음
	membersList.add(m2);
	// 해쉬맵에 list형태를 집어넣음
	membersMap.put("membersList",membersList);
%>
<c:set var="membersList" value="${membersMap.membersList}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 출력창</title>
<style type="text/css">
	h2 {
	margin-left : 48%;
	}
</style>
</head>
<body>
	<h2><strong>실행결과</strong> </h2>
	<table align="center" border="1">
		<tr align="center" bgcolor="lightblue">
			<td width="15%">아이디</td>
			<td width="15%" >비밀번호</td>
			<td width="15%">이름</td>
			<td width="15%">이메일</td>
		</tr>
		<tr align="center"  >
			<td width="15%">${membersMap.id}</td>
			<td width="15%">${membersMap.pwd}</td>
			<td width="15%">${membersMap.name}</td>
			<td width="15%">${membersMap.email}</td>
		</tr>
		<tr align="center">
			<td width="15%">${membersList[0].id}</td>
			<td width="15%">${membersList[0].pwd}</td>
			<td width="15%">${membersList[0].name}</td>
			<td width="15%">${membersList[0].email}</td>
		</tr>
		<tr align="center">
			<td width="15%">${membersList[1].id}</td>
			<td width="15%">${membersList[1].pwd}</td>
			<td width="15%">${membersList[1].name}</td>
			<td width="15%">${membersList[1].email}</td>
		</tr>
	</table>
</body>
</html>