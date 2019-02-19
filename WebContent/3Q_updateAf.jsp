
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

<h1>글 수정</h1>

<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq.trim());

String title = request.getParameter("title");
String content = request.getParameter("content");


iQABbsDao dao = QABbsDao.getInstance();
boolean isS = dao.updateQbs(seq, title, content);

if(isS){
	%>
	<script type="text/javascript">
	alert("글 삭제 성공했습니다");
	location.href = '3Q_list.jsp';
	</script>
	<%
}else{	
	%>
	<script type="text/javascript">
	alert("글을 삭제하지 못했습니다");
	location.href = '3Q_detail.jsp';
	</script>
	<%
}	
%>

<a href="3Q_list.jsp"></a>

</body>
</html>