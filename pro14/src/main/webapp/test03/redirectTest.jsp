<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8");%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:redirect url="/test03/member1.jsp">
	<c:param name="id" value="${'song'}"></c:param>
	<c:param name="pwd" value="${'1234'}" ></c:param>
	<c:param name="name" value="${'송길동'}" ></c:param>
	<c:param name="age" value="${'29'}" ></c:param>
	<c:param name="height" value="${'182'}"></c:param>
	</c:redirect>

	
</body>
</html>