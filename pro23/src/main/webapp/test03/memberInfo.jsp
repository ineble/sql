<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 출력창</title>
</head>
<body>
	<table border="1" width="50%" align="center">
		<tr align="center" bgcolor="lightgreen">
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>이메일</td>
			<td>가입일</td>
		</tr>
		<tr align="center">
		<td>${member.id}</td>
		<td>${member.pwd}</td>
		<td>${member.name}</td>
		<td>${member.email}</td>
		<td>${member.joinDate}</td>
		</tr>
	</table>
</body>
</html>