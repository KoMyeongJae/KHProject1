<%@page import="User.UserDto"%>
<%@page import="QABbs.QABbsDto"%>
<%@page import="QABbs.QABbsDao"%>
<%@page import="QABbs.iQABbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

iQABbsDao dao = QABbsDao.getInstance();
QABbsDto qbbs = dao.getQbs(seq);

%>
<%
Object ologin = session.getAttribute("login");
UserDto user = null;
user = (UserDto)ologin;
%>
<div class="center">

<form action="QaUpdateCtlr" method="get">
<input type="hidden" name="seq" value="<%=seq %>">
			
<table border="1">
<col width="200"><col width="500"> 

<tr>
	<td>아이디</td>
	<td>
		<input type="text" name="id" readonly="readonly" size="50" 
			value="<%=user.getId() %>"> 		
	</td>	
</tr>
<tr>
	<td>제목</td>
	<td>
		<input type="text" name="title" size="50" value="<%=qbbs.getTitle() %>">		
	</td>
</tr>
<tr>
	<td>내용</td>
	<td>
		<textarea rows="10" cols="50" name="content"><%=qbbs.getContent() %></textarea>		
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="글수정">
	</td>
</tr>

</table>

</form>

</div>

<a href="3_QA_list.jsp">글목록</a>

</body>
</html>