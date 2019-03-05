<%@page import="QABbs.QABbsDto"%>
<%@page import="QABbs.QABbsDao"%>
<%@page import="QABbs.iQABbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

iQABbsDao dao = QABbsDao.getInstance();

boolean count = (boolean)session.getAttribute("count");


if(count == true){
%>
	<script type="text/javascript">
	alert("댓글 입력 성공!");
	location.href = "3_QA_list.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert("댓글을 입력하지 못했습니다. 다시 입력해 주십시오");
	location.href = "3_QA_list.jsp";
	</script>
<%
}
%>


</body>
</html>