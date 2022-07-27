<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="result.jsp" method="post" >
	<input type="hidden" name="param1" value="1.png" /> <br>
	<input type="hidden" name="param2" value="2.png" /> <br>
	<input type="submit" value="이미지 다운로드">
	</form>
</body>
</html>