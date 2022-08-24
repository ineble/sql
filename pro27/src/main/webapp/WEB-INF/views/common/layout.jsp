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
<title><tiles:insertAttribute name="title" /></title>
<style type="text/css">
	#container{
		width: 100%;
		margin : 0px auto;
		text-align: center;
		border: 0px solid #bcbcbc;	 
	}
	#header{
		width: 100%;
		margin-botton : 5px;
		border: 0px solid #bcbcbc;
	 	background-color: lightblue;
	}
	#sidebar-left{
		width: 15%;
		height : 700px;
		padding :5px;
		margin-right : 5px;
		margin-bottom : 5px;
		float : left;
		background-color : orange;
		border: 0px solid #bcbcbc;
	 	font-size: 10px;
	}
	#content{
		width: 75%;
		padding : 5px;
		margin-right : 5px;
		float : left;
		border: 0px solid #bcbcbc;
	 
	}
	#footer{
		clear : both;
		padding : 5px;
		border:  0px solid #bcbcbc; 
		background-color: lightblue;
	}
</style>

</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header"/>
		</div>
		<div id="sidebar-left">
			<tiles:insertAttribute name="side"/>
		</div>
		<div id="content">
			<tiles:insertAttribute name="body"/>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer"/>
		</div>	
	</div>
</body>
</html>