<%@page import="User.UserDto"%>
<%@page import="FestiCalendar.FestiCalendarDto"%>
<%@page import="FestiCalendar.FestiCalendarDao"%>
<%@page import="FestiCalendar.iFestiCalendarDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Object ologin = session.getAttribute("login");
UserDto user = null;
if(ologin == null){	// session 정보가 사라진 상태
	%>
	<script type="text/javascript">
	alert("로그인해주세요");
	location.href = "1_0Start.jsp";
	</script>
	<%
	return;
}
user = (UserDto)ologin;

String name = user.getName();
%>
<%
response.setContentType("text/html; charset=utf-8");
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>축제 정보</title>
<style type="text/css">
	input[type="button"],
	input[type="submit"],
	input[type="reset"],
	button,
	.button {
		-moz-transition: all 0.25s ease-in-out;
		-webkit-transition: all 0.25s ease-in-out;
		-ms-transition: all 0.25s ease-in-out;
		transition: all 0.25s ease-in-out;
		-webkit-appearance: none;
		position: relative;
		display: inline-block;
		background: #ed786a;
		color: #fff !important;
		text-transform: uppercase;
		border-radius: 4px;
		border: 0;
		outline: 0;
		font-size: 1em;
		box-shadow: 0.125em 0.175em 0 0 rgba(0, 0, 0, 0.125);
		font-weight: 600;
		text-align: center;
		font-size: 0.85em;
		letter-spacing: 2px;
		padding: 0.85em 2.75em 0.85em 2.75em;
	}
</style>
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
<tr align="right">
	<td colspan="3">
		<form action="FestiZzimCtlr" method="get">
	    	<input type="hidden" name="command" value="zzim">
	    	<input type="hidden" name="seq" value="<%=dto.getSeq()%>">
	    	<input type="hidden" name="id" value="<%=user.getId() %>">
	    	<input type="submit" value="찜하기">
	    </form>
	</td>
</tr>
<tr >
	<td colspan="3" style="padding-top: 2em;">
	<%=dto.getContent() %>
	</td>
</tr>

</table>
</body>
</html>