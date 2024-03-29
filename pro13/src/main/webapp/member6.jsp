<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="sec01.ex01.*,java.util.*"
    %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="m" class="sec01.ex01.MemberBean" scope="page" />
<jsp:setProperty property="*" name="m"/>
<%
	MemberDAO memberDAO = new MemberDAO();
	memberDAO.addMember(m);
	List memberList = memberDAO.listMembers();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록창</title>
</head>
<body>
	<table align="center" width="100%">
		<tr align="center" bgcolor="#99ccff">
			<td width="7%">아이디</td>
			<td width="7%">비밀번호</td>
			<td width="7%">이름</td>
			<td width="7%">이메일</td>
			<td width="7%">가입일</td>
		</tr>
	
	<% if(memberList.size()==0) {%>
		<tr>
		<td colspan="5">
		<p align="center"><b><span style="font-size: 9pt">등록된 회원이 없습니다.</span></b></p>
		</td>
		</tr>
	<%} else{
		for(int i = 0; i < memberList.size(); i ++){
			MemberBean bean = (MemberBean) memberList.get(i);
		%>

		<tr align="center" bgcolor="#99ccff">
			<td width="7%">$<%=bean.getId() %></td>
			<td width="7%">$<%=bean.getId() %></td>
			<td width="7%">$<%=bean.getId() %></td>
			<td width="7%">$<%=bean.getId() %></td>
			<td width="7%">$<%=bean.getId() %></td>
		</tr>
	<%
		} 
	} 
	%>
	</table>
</body>
</html>