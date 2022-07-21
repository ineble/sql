<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int dan = Integer.parseInt(request.getParameter("dan"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width='800'>
	<tr align="center" bgcolor="#FFFF66">
	<td colspan="2"><%=dan %>단 출력 </td>
	</tr>
	
	<% for(int j = 1; j <=dan; j++) {%>
	<%
	for(int i =1; i < 10 ; i ++){
	%>
	
	<%if(i % 2 == 0){%>
	 <tr align="center" bgcolor="#ccccff">
	 <td width='400'><%= j %> * <%= i %>
	 <td width='400'><%= i * j %>
	 </tr>
	 
	 <%}else{%>
	 <tr align="center" bgcolor="ccbbaa">
	 <td width='400'><%= j %> * <%= i %>
	 <td width='400'><%= i * j %>
	 </tr>
	 
	<% }%> 
	<%
	} 
	%>
	<% } %>
	</table>
</body>
</html>