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
int seq = Integer.parseInt(sseq);

iQABbsDao dao = QABbsDao.getInstance();
QABbsDto qbbs = dao.getQbs(seq);

request.setAttribute("_qbbs", qbbs);
%>
<h1>질문</h1>

<table border="2">
<col width="200"><col width="500">

<tr>
	<td>작성자</td>
	<td>${_qbbs.id }</td>
</tr>
<tr>
	<td>제목</td>
	<td>${_qbbs.title }</td>
</tr>
<tr>
	<td>작성일</td>
	<td>${_qbbs.wdate }</td>
</tr>
<tr>
	<td>조회수</td>
	<td><%=qbbs.getReadcount() %></td>
</tr>
<tr>
	<td>내용</td>
	<td>
		<textarea rows="10" cols="50"><%=qbbs.getContent() %></textarea>
	</td>
</tr>
</table>

<br>
<hr>
<br>

<h1>답글</h1>

<form action="3_QA_answerAf.jsp" method="post">
<input type="hidden" name="seq" value="<%=qbbs.getSeq() %>">
<table border="1">
<col width="200"><col width="500">

<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" readonly="readonly" size="50" 
			value="QQ">
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
		<input type="submit" value="댓글 등록">
	</td>
</tr>
</table>
</form>



</body>
</html>