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
<title>사이드 메뉴</title>
<style type="text/css">
	a{	
	 text-decoration: none;
	 font-size: 20px;
	}
</style>
</head>
<body>
	<h1>사이드 메뉴</h1>
	<a href="#" class="no-underline">회원관리</a> <br>
	<a href="#" class="no-underline">게시판관리</a> <br>
	<a href="#" class="no-underline">상품관리</a> <br>
</body>
</html>