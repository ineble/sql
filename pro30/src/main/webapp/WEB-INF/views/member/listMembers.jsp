<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, java.io.*"
    isELIgnored="false"
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지섭 - 회원 정보 출력창</title>
<style type="text/css">
	.cls1{
	font-size: 40px;
	text-align: center;
	}
	
	.cls2{
	text-align: center;
	}
</style>

</head>
<body>
	<h3>회원검색</h3>
	<form action="${contextPath}/member/searchMember.do">
	이름 : <input type="text" name="name" /> 
	이메일 : <input type="email" name="email" />
	<select>
    <option>이름</option>
    <option>이메일</option>
    <option>이름 &이메일</option>
	</select>
	<input type="submit" value="검색">
	</form>
	<table align="center" width="100%" border="1">
		<tr align="center" bgcolor="lightgreen" >
			<td width="7%">아이디</td>
			<td width="7%">비밀번호</td>
			<td width="7%">이름</td>
			<td width="7%">이메일</td>
			<td width="7%">가입일</td>
			<td width="10%">수정</td>
			<td width="10%">삭제</td>
		</tr>
	
	<c:choose>
	<c:when test="${memberList == null}">
		<tr align="center" >
			<td colspan="7" width="7%">
			<b>등록된 회원이 없습니다.</b>
			</td>
		</tr>
	</c:when>
	<c:when test="${!empty memberList}">
		<c:forEach var="mem" items="${memberList }">
		<tr align="center" >
			<td width="7%">${mem.id }</td>
			<td width="7%">${mem.pwd }</td>
			<td width="7%">${mem.name }</td>
			<td width="7%">${mem.email }</td>
			<td width="7%">${mem.joinDate }</td>
			<td width="10%"><a href="${contextPath}/member/modMember.do?id=${mem.id}">수정하기</a></td>
			<td width="10%"><a href="${contextPath}/member/removeMember.do?id=${mem.id}">삭제하기</a></td>
		</tr>
		</c:forEach>
	</c:when>
	</c:choose>
	</table>
	
	<a href="${contextPath}/member/memberForm.do">
	<h1 style="text-align: center">회원가입</h1>
	</a>
	

</body>
</html>