<%@page import="java.util.List"%>
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
List<FestiCalendarDto> list = (List<FestiCalendarDto>)request.getAttribute("list");
%>

<table border="1">
<tr>
<th>일정명</th><th>작성일</th><th>약속일</th><th>내용</th><th>찜</th>
</tr>
<% 
for(int i = 0; i < list.size(); i++){
%>
<tr>
<td><a href="FestiDetailCtlr?seq=<%=list.get(i).getSeq() %>"><%=list.get(i).getTitle() %></a></td><td><%=list.get(i).getWdate() %></td>
<td><%=list.get(i).getRdate() %></td><td><%=list.get(i).getContent() %></td>
<td><%=list.get(i).getZzim() %></td>
</tr>
<%
}
%>


</table>












</body>
</html>