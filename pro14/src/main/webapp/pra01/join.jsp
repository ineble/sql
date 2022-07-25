<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
	background-color: lightblue; 
	}
	
</style>

</head>
<body>

	<form action="member1.jsp" method="post">
	<table align="center">
	<caption>회원가입창</caption>
	<tr>
    	<td width="110"><p>아이디 : </p></td>
    	<td width="50"><input type="text" name="id"></td>
    </tr>
  	<tr>
    	<td width="110"><p>이름 : </p></td>
    	<td width="50"><input type="text" name="name"></td>
    </tr>	
    <tr>	
    	<td width="110"><p>비밀번호 : </p></td>
    	<td width="50"><input type="password" name="pwd"></td>
  	</tr>
  	<tr>	
    	<td width="110"><p>이메일 : </p></td>
    	<td width="50"><input type="email" name="email"></td>
  	</tr>
  	<tr>	
  		<td width="110"><p>&nbsp;</p></td>
    	<td width="50">
    	<input value="회원가입" type="submit" />
    	<input type="reset" value="취소">
    	</td>
  	</tr>
	</table>
	</form>
</body>
</html>