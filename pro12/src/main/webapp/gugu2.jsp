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
	
	
	<% for(int i = dan-2; i <=dan; i++) {%>
	<tr align="center" bgcolor="#aabb66">
	<td colspan="2"><%=i %>단 출력 </td>
	</tr>
	<%
	for(int j =1; j < 10 ; j ++){
	%>
	
	<%if(i % 2 == 0){%>
	 <tr align="center" bgcolor="#ccddff">
	 <td width='400'><%= i %> * <%= j %>
	 <td width='400'><%= i * j %>
	 </tr>
	 
	 <%}else{%>
	 <tr align="center" bgcolor="eeffee">
	 <td width='400'><%= i %> * <%= j %>
	 <td width='400'><%= i * j %>
	 </tr>
	 
	<% } 
	}
	%>
	
	
	
	<%
	}
	%>
	</table>
</body>
</html>