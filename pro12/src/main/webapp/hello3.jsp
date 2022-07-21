<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String name = "이순신";
	public String getName(){return name;}
%>    
<% String age = request.getParameter("age"); %>
    
<style>
	h1{
	color : blue;
	
	}
	h2{
	color : red;
	}
	h3{ 
	color : green;
	}
	
	h4{
	color  : orange;
	}
</style>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현식 연습</title>
</head>
<body>
	<h1>안녕하세요 <%=name %></h1>
	<h2>나이는 <%=age %></h2>
	<h3>키는 <%=180 %></h3>
	<h4>나이+10은 <%=Integer.parseInt(age)+10 %>살입니다!!!!!</h4>
</body>
</html>