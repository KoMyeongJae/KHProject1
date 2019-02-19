<%@page import="QABbs.QABbsDto"%>
<%@page import="java.util.List"%>
<%@page import="QABbs.QABbsDao"%>
<%@page import="QABbs.iQABbsDao"%>
<%@page import="User.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public String arrow(int depth){
	String rs = "<img src='./images/arrow.png' width='20px' height='20px'/>";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";	// 여백
	
	String ts = ""; 
	
	for(int i = 0;i < depth; i++){
		ts += nbsp;
	}
	
	return depth==0?"":ts + rs;
}

%>
<%
List<QABbsDto> list = (List<QABbsDto>)request.getAttribute("3Q_list"); 
Object ologin = session.getAttribute("login");
UserDto user = null;
if(ologin == null){
	%>
	<script type="text/javascript">
	alert("로그인 해 주십시오");
	location.href = "Login.jsp";
	</script>	
	<%
	return;
}

user = (UserDto)ologin;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String searchWord = request.getParameter("searchWord");
String choice = request.getParameter("choice");

System.out.println("searchWord = " + searchWord);
System.out.println("choice = " + choice);

if(choice == null || choice.equals("")){
	choice = "sel";
}

// 검색어를 지정하지 않고 choice가 넘어 왔을 경우
if(choice.equals("sel")){
	searchWord = "";
}

if(searchWord == null){
	searchWord = "";
	choice = "sel";
}
iQABbsDao dao = QABbsDao.getInstance();
/* List<QABbsDto> list = dao.getQABbsSearchList(searchWord,choice); */
%>

<h2>환영합니다 <%=user.getId() %>님 반갑습니다</h2>
 
 
 <h1>Q&A 게시판</h1>
 
 <div align="center">

<table border="1">
<col width="70"><col width="500"><col width="150">

<tr>
	<th>번호</th><th>제목</th><th>작성자</th>
</tr>

<%
if(list == null || list.size() == 0){
	%>	
	<tr>
		<td colspan="3">작성된 글이 없습니다</td>	
	</tr>	
	<%
}else{
	for(int i = 0;i < list.size(); i++){
		QABbsDto qbs = list.get(i);
	%>
	
		<tr>
			<th><%=i + 1 %></th>	
			<td class="title">
				<%=arrow(qbs.getDepth()) %>
				<%if(qbs.getDel() == 1){ %>
					이 글은 작성자에 의해서 삭제되었습니다.
				<%}else{ %>
					<a href="QaDetailCtlr.java?seq=<%=qbs.getSeq() %>">
						<%=qbs.getTitle() %>
					</a>
				<%} %>
			</td>
			<td align="center"><%=qbs.getId() %></td>
		</tr>
	<%
	}
}
%>

</table> 

</div>

<!-- search -->
<div align="center">

<select id="choice">
<option value="sel">선택</option>
<option value="title">제목</option>
<option value="writer">작성자</option>
<option value="content">내용</option>
</select>

<input type="text" id="search" value="">
<button name="search" onclick="searchBbs()">검색</button>
</div>

<hr>
<a href="3Q_write.jsp">글쓰기</a>

<script type="text/javascript">
function searchBbs() {
	
	var choice = document.getElementById("choice").value;
	var word = $("#search").val();
//	alert("choice = " + choice);
//	alert("word = " + word);

	if(word == ""){
		alert("choice = " + choice);
		document.getElementById("choice").value = 'sel';
	}
	
	location.href = "3Q_list.jsp?searchWord=" + word + "&choice=" + choice;
	
}


</script>
 
 
</body>
</html>