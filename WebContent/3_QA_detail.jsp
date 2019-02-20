<%@page import="QABbs.QABbsDao"%>
<%@page import="QABbs.iQABbsDao"%>
<%@page import="QABbs.QABbsDto"%>
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
<h1>글 상세보기</h1>
<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

iQABbsDao dao = QABbsDao.getInstance();

dao.readcount(seq);

QABbsDto qbbs = dao.getQbs(seq);
%>
<%
UserDto user = (UserDto)session.getAttribute("login");
%>
<div class="center">

<table border="2">
<col width="200"><col width="500">

<tr>
	<td>작성자</td>
	<td>
		<%=qbbs.getId() %>
	</td>
</tr>

<tr>
	<td>제목</td>
	<td>
		<%=qbbs.getTitle() %>
	</td>
</tr>
<tr>
	<td>작성일</td>
	<td>
		<%=qbbs.getWdate() %>
	</td>
</tr>
<tr>
	<td>조회수</td>
	<td>
		<%=qbbs.getReadcount() %>
	</td>
</tr>
<tr>
	<td>정보</td>
	<td>
		<%=qbbs.getRef() %>-<%=qbbs.getStep() %>-<%=qbbs.getDepth() %>
	</td>
</tr>
<tr>
	<td>내용</td>
<td>
<textarea rows="10" cols="50" 
name="content"><%=qbbs.getContent() %>	
</textarea>
	</td>
</tr>
</table>

<form action="3_QA_answer.jsp" method="post">
<input type="hidden" name="seq" value="<%=qbbs.getSeq() %>">
<input type="submit" value="댓글">
</form>


<%
if(qbbs.getId().equals(qbbs.getId())){
%>
<button onclick="deletebbs('<%=qbbs.getSeq() %>')">삭제</button>
<button onclick="updatebbs('<%=qbbs.getSeq() %>')">수정</button>
<%
}
%>

</div>

<a href='3_QA_list.jsp'>글 목록</a>

<script type="text/javascript">
function deletebbs(seq) {
	
	location.href = "QaDeleteCtlr?seq=" + seq;
}
function updatebbs(seq) {
		
	location.href = "3_QA_update.jsp?seq=" + seq;
}
</script>
</body>
</html>