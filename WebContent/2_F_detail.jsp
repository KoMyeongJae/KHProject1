<%@page import="FestiCalendar.FestiCalendarDto"%>
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
FestiCalendarDto cal = (FestiCalendarDto)request.getAttribute("cal");
%>

<div class="center">

<table border="2">
<col width="200"><col width="500">

<tr>
	<td>작성자</td>
	<td>
		<%=cal.getId() %>
	</td>
</tr>
<tr>
	<td>제목</td>
	<td>
		<%=cal.getTitle() %>
	</td>
</tr>
<tr>
	<td>작성일</td>
	<td>
		<%=cal.getWdate() %>
	</td>
</tr>
<tr>
	<td>약속일</td>
	<td>
		<%=cal.getRdate()%>
	</td>
</tr>
<tr>
	<td>내용</td>
<td>
<textarea rows="10" cols="50" 
name="content" readonly="readonly"><%=cal.getContent() %>	
</textarea>
	</td>
</tr>
</table>

<%-- 
작업 보류
<button onclick="deletebbs('<%=cal.getSeq() %>')">삭제</button>
<button onclick="updatebbs('<%=cal.getSeq() %>')">수정</button>
 --%>

</div>

<a href='bbslist.jsp'>글 목록</a>

<script type="text/javascript">
function deletebbs(seq) {
	location.href = "FestiDeleteCtlr?seq=" + seq;
}
function updatebbs(seq) {
	location.href = "calupdate.jsp?seq=" + seq;
}
</script>



</body>
</html>