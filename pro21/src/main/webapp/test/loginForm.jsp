<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${contextPath}/test/result.do" method="post" name="frmLogin">
	<table border="1" width="80%" align="center">
		<tr align="center">
			<td>아이디</td>
			<td>비밀번호</td>
		</tr>
		<tr align="center">
			<td><input type="text" name="userID" size="20" value=""></td>
			<td><input type="password" name="passWD" size="20" value=""></td>
		</tr>
		<tr align="center" >
			<td colspan="2">
				<input type="submit" value="로그인">
				<input type="reset" value="다시입력">
			</td>
		</tr>
		
	</table>
	</form>
</body>
</html>