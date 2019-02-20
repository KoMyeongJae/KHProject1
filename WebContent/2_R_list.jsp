<%@page import="java.util.List"%>
<%@page import="ReferRoom.ReferRoomDto"%>
<%@page import="ReferRoom.ReferRoomDao"%>
<%@page import="ReferRoom.iReferRoomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>

<% 
List<ReferRoomDto> list = (List<ReferRoomDto>)request.getAttribute("referlist");
%>   
<h2>자료실</h2>

<div align="center">

<form action="ReferSearchCtlr" method="post" name="frm">

<table>
<tr>
<td>
<select name="choice">
<option value="multi">제목+작성자+내용</option>
<option value="title">제목</option>
<option value="writer">작성자</option>
<option value="content">내용</option>
</select>
</td>
<td><input type="text" name="search" placeholder="검색어를 입력하세요"></td>
<td><button type="button" onclick="doSearch()">검색</button></td>
</tr>
</table>
</form>

<table border="1">
<col width="50"><col width="100"><col width="400"><col width="50">
<col width="50"><col width="50"><col width="100">

<tr bgcolor="#00ff00" align="center">
	<td>번호</td>
	<td>작성자</td>
	<td>제목</td>
	<td>다운로드</td>
	<td>조회수</td>
	<td>다운로드수</td>
	<td>작성일</td>
	<td>좋아요</td>
</tr>
<% 
if(list.size() == 0){
	%>	
	<tr bgcolor="#f6f6f6">
		<td colspan="8" align="center">자료가 존재하지 않습니다</td>
	</tr>
	<%
}
else{
	for(int i = 0; i < list.size(); i++){
		ReferRoomDto rfr = list.get(i);
		String bgcolor = "";
		if(i % 2 == 0){
			bgcolor= "white";
		}else{
			bgcolor= "white";
		}
		
		if(rfr.getDel() == 1){
			int a = 0;
			a++;
			
			if(a == list.size()){%>
				<tr bgcolor="#f6f6f6">
				<td colspan="8" align="center">자료가 존재하지 않습니다</td>
				</tr>
				<%
			}
		}
		else{
		%>
		<tr bgcolor="<%=bgcolor%>" align="center" height="5">
			<td><%=i+1 %></td>
			<td><%=rfr.getId() %></td>
			<td align="left">
				<a href="ReferDetailCtlr?seq=<%=rfr.getSeq() %>">
					<%=rfr.getTitle() %>
				</a>
			</td>
			<td>
			<!-- 서블렛을 사용. -->
				<input type="button" class="btn" name="btnDown" value="파일"
					onclick="location.href='ReferDownCtlr?filename=<%=rfr.getFilename() %>&seq=<%=rfr.getSeq() %>'">
			</td>
			<td><%=rfr.getReadcount() %></td>
			<td><%=rfr.getDowncount() %></td>
			<td><%=rfr.getWdate() %></td>
			<td><%=rfr.getLikeit() %></td>
		</tr>
		<%
		}
	}
}
%>
</table>

</div>

<a href="2_R_add.jsp">자료 올리기</a>


<script type="text/javascript">
$(function () {
	$(".btn").click(function () {
		alert("다운로드 합니다");
	});
	
});

function doSearch() {
	var frm = document.frm;
	
	var errorMsg = null;
	var objFocus = null;
	
	if ( frm.search.value.length == 0 ){
		errorMsg = "검색어를 입력해 주십시오";
		objFocus = frm.search;
	}  
	
	if(errorMsg != null){
		alert(errorMsg);
		objFocus.focus();
		return false;
	}
	
	frm.submit();
}
</script>









</body>
</html>