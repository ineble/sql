<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	li{
		list-style: none;
	}
	span{
		color : blue;
		font-weight: bold;
		font-size: 15px;
	}
	
</style>
</head>
<body>
	<ul class="list_type">
		<li>
			<span style="margin-left:12%">이미지</span>
			<span style="margin-left:30%">이미지 이름</span>
			<span style="margin-left:30%">선택하기</span>
		</li>
		<%for(int i =0; i<10; i ++){%>
		<li>
			<a href="#" style="margin-left:12%">
				<img alt="" src="image/Racoons.PNG" height="90" width="90">
			</a>
			<a href="#" style="margin-left:27%" >
				<strong>이미지 이름: 듀크<%=i %></strong>
			</a>
			<a href="#" style="margin-left:30%">
				<input name='chk<%=i %>' type="checkbox" />
			</a>
		</li>
		<hr>
		<%} %>
	</ul>

	
</body>
</html>