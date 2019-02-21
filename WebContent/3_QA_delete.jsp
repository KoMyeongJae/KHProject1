<%@page import="QABbs.QABbsDao"%>
<%@page import="QABbs.iQABbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link rel="stylesheet" href="assets/css/main.css">
<title>Insert title here</title>
</head>
<body>
<%

request.getAttribute("seq");
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

iQABbsDao dao = QABbsDao.getInstance();
boolean isS = dao.deleteQbs(seq);
if(isS){
	%>
	<script type="text/javascript">
	alert("글 삭제 성공했습니다");
	location.href = '3_QA_list.jsp';
	</script>
	<%
}else{	
	%>
	<script type="text/javascript">
	alert("글을 삭제하지 못했습니다");
	location.href = '3_QA_detail.jsp';
	</script>
	<%
}


%>
</body>
</html>