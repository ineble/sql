<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	안녕하세요 뱁새입니다!
	<br>
	<jsp:include page="bird_image.jsp" flush="true">
		<jsp:param value="라쿤" name="name"/>
		<jsp:param name="imgName" value="Racoons.PNG"/>
	</jsp:include>
	
</body>
</html>