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
String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

iQABbsDao dao = QABbsDao.getInstance();

boolean isS = dao.writeQAB(new QABbsDto(id,title,content));
if(isS){
%>
	<script type="text/javascript">
	alert("글입력 성공!");
	location.href = '3Q_list.jsp';
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert("글입력을 다시 하십시오");
	location.href = '3Q_write.jsp';
	</script>
<%
}
%>

</body>
</html>