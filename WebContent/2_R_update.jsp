
<%@page import="ReferRoom.ReferRoomDto"%>
<%@page import="ReferRoom.ReferRoomDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// 연결을 아직 하지 않았으므로 임의 기본아이디로 접근하겟다.


ReferRoomDto dto = (ReferRoomDto)request.getAttribute("rfr");
%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 
	주의점 : 1. 같은 파일명으로 사용시 주의 필요! (다른사용자의 같은파일이름이 있다면 파일이 덮어쓰기 된다.)
				해결) 파일명을 DATE() 클래스를 이용하여 시간으로 파일을 저장하고 불러내고, 
			 		 다운로드시에 저장된 파일명을 호출하여 가져온다.
		  
		   2. 한글파일명은 문자가 깨짐
		   
		  		ex) bbslist.jsp -> 1232123213.jsp   upload
		  		
		  		DB의 column에서 취득 후					download
		  		1232123213.jsp  -> bbslist.jsp
 --%>
 
<h2>자료 올리기</h2>

<div align="center">
<%-- multipart : byte, String 다 받아주는 방식 --%> 
<%-- 파일보낼땐 String byte 둘다 보내기때문에 보내지지 않는다. --%>
<form action="ReferUpdateCtlr" name="frm" method="POST" enctype="multipart/form-data">
<input type="hidden" name="command" value="updateAf">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>"> 
<table border="1" bgcolor="white">
<col width="200"><col width="500">

<tr>
	<td>아이디</td>
	<%-- 
	<td><%=user.getId() %>
		<input type="hidden" name="id" value="<%=user.getId() %>">
	</td>
	 --%>
	
	 <td>아이디1
		<input type="hidden" name="id" value="아이디1">
	</td>
	 
</tr>

<tr>
	<td>제목</td>
	<td>
		<input type="text" id="title" name="title" size="50" value=<%=dto.getTitle() %>>
	</td>
</tr>

<tr>
	<td>파일업로드</td>
	<td>
		<%-- 이건 request.get ~ 으로 받아낼 수 없다. --%>
		<input type="file" id="file" name="fileload" style="width: 400px">
	</td>
</tr>

<tr>
	<td>내용</td>
	<td>
		<textarea rows="20" id="con" cols="50" name="content"><%=dto.getContent() %></textarea>
	</td>
</tr>

<tr align="center">
	<td colspan="2">
		<button type="button" onclick="doUpdate()">올리기</button>
	</td>
</tr>

</table>

</form>
</div>
 
<script type="text/javascript">

function doUpdate() {
	
	var frm = document.frm;
	
	var errorMsg = null;
	var objFocus = null;
	
	if ( frm.title.value.length == 0 ){
		errorMsg = "글제목을 입력해 주십시오";
		objFocus = frm.title;
	} else if ( frm.content.value.length == 0 ){
		errorMsg = "내용을 입력해 주십시오";
		objFocus = frm.content;	
	} else if ( frm.file.value.length == 0 ){
		errorMsg = "파일을 지정해 주십시오";
		objFocus = frm.file;	
	}
	
	if(errorMsg != null){
		alert(errorMsg);
		objFocus.focus();
		return false;
	}
	console.log(frm);
	frm.submit();
}


</script>
 
 
</body>
</html>

