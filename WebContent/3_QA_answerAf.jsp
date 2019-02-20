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
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

iQABbsDao dao = QABbsDao.getInstance();

boolean isS = dao.Q_answer(seq, new QABbsDto(id,title,content));
if(isS){
%>
	<script type="text/javascript">
	alert("댓글 입력 성공!");
	location.href = "3_QA_list.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert("댓글 입력하지 못했습니다. 다시 입력해 주십시오");
	location.href = "3_QA_list.jsp";
	</script>
<%
}
%>


</body>
</html>