<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지섭-파일업로드 하기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var cnt=1;
	function fn_addFile(){
		$("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />" );
		cnt++;
	}
</script>
</head>
<body>
	<h1>파일 업로드 하기</h1>
	<form action="${contextPath}/upload" enctype="multipart/form-data" method="post">
	<label>아이디:</label>
	<input type="text" name="id"><br>
	<label>이름:</label>
	<input type="text" name="name"><br>
	<input type="button" value="파일추가" onclick="fn_addFile()" / > <br>
	<div id="d_file"></div>
	<input type="submit" value="업로드">
	</form>
</body>
</html>