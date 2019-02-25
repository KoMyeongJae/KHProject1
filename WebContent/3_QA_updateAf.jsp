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

request.getAttribute("seq");
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());
String title = request.getParameter("title");
String content = request.getParameter("content");

iQABbsDao dao = QABbsDao.getInstance();
boolean isS = dao.updateQbs(seq, title, content);
if(isS){
	%>
	<script type="text/javascript">
	alert("글 수정에 성공했습니다");
	location.href = '3_QA_list.jsp';
	</script>
	<%
}else{	
	%>
	<script type="text/javascript">
	alert("글을 수정하지 못했습니다");
	location.href = '3_QA_detail.jsp';
	</script>
	<%
}


%>
</body>
</html>