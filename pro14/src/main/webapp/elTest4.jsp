<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여러 가지 산술 연산자</title>
</head>
<body>
	<h1>여러가지 비교 연산자</h1>
	<h1>
	\${10==10} && (20==20) : ${10==10} && ${20==20} <br>
	\${10==10} and (20==20) : ${10==10} and ${20==20} <br><br>
	\${10==10} || (20!=30) : ${10==10} || ${20!=30} <br>
	\${10!=10} or (20!=20) : ${10!=10} or ${20!=20} <br><br>
	\${!(20==10) : ${!(20==10)} <br>
	\${not(20==10) : ${not(20==10)} <br><br>
	\${!(20!=10) : ${!(20!=10)} <br>
	\${not(20!=10) : ${not(20!=10)} <br><br>
	송인재 : ${33 eq 29 ? '인재형이군요' : '뻥치지마요'}  
	</h1>
</body>
</html>