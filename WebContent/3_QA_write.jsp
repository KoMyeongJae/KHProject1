<%@page import="User.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>글쓰기</h1>
<%
Object ologin = session.getAttribute("login");
UserDto user = (UserDto)ologin;
%>


<div class="center">

<form action="QaAddCtlr" method="get">
<input type="hidden" name="command" value="addAf">

<table border="1" class="specalt">
<col width="200"><col width="500"> 

<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" readonly="readonly" size="50" 
			value="<%=user.getId() %>">
	</td>
</tr>	
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="50">		
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="50" name="content"></textarea>		
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="질문 등록하기">
	</td>
</tr>

</table>

</form>

</div>

<a href="3_QA_list.jsp">글목록</a>

</body>
</html>