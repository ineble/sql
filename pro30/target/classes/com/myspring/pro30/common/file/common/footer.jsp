<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, java.io.*"
    isELIgnored="false"
%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하단 부분</title>
</head>
<style>
	p{ 
	 font-size: 20px;
	 text-align: center;
	}
</style>
<body>
	<p>e-mail : admin@test.com</p>
	<p>회사주소 : 서울시 강동구</p>
	<p>찾아오는 길 : <a href="#">약도</a></p>
</body>
</html>