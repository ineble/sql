<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int score = Integer.parseInt(request.getParameter("score"));
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점수 출력장</title>
</head>
<body>
	<h1>시험점수 <%=score %>점</h1>
	<% 
	if(score>=90){ 
	%>
	<h1 style="color:red">A학점입니다.</h1>
	<%
	}else if(score>=80 && score<90){
	%>
	<h1 style="color:blue">B학점입니다.</h1>
	<%
	}else if(score>=70 && score<80){
	%>
	<h1 style="color:green">C학점입니다.</h1>
	<% 
	}else if(score>=60 && score<70){
	%>
	<h1 style="color:yellow">D학점입니다.</h1>
	<%
	}else{
	%>
	<h1>F학점입니다.</h1>
	<%
	}
	%>
	<br>
	<a href="/pro12/scoreTest.html">시험점수입력</a>
</body>
</html>