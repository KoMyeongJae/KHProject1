<%@page import="FestiCalendar.FestiCalendarDto"%>
<%@page import="FestiCalendar.FestiCalendarDao"%>
<%@page import="FestiCalendar.iFestiCalendarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>축제 정보</title>
</head>
<body>
<%

int seq = Integer.parseInt(request.getParameter("seq"));
iFestiCalendarDao dao = FestiCalendarDao.getInstance();
FestiCalendarDto dto = dao.detailFestList(seq);
%>
<h3>축제 일정</h3>
<table>
<col width="20%"><col width="20%"><col width="60%">
<tr>
	<td colspan="3" style="padding: 1em 0em 1em 0em;">
		<font color="black" size="10">
			&nbsp;&nbsp;&nbsp;<%=dto.getTitle() %>
		</font>
	</td>
</tr>
<tr style="border-bottom: double; border-bottom-color: lightgray;">
	<td>시작날 : <%=dto.getsrdate() %></td>
	<%if(dto.geterdate() != null){ %>
	<td>마지막날 : <%=dto.geterdate() %></td>
	<%}else{ %>
	<td>&nbsp;</td>
	<%} %>
	<td align="right">URL http://localhost:8090/KHProject1/1_8FestiDetail.jsp?seq=<%=dto.getSeq() %></td>
</tr>
<tr >
	<td colspan="3" style="padding-top: 2em;">
	<%=dto.getContent() %>
	</td>
</tr>

</table>
</body>
</html>