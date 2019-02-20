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
</head>
<body>

<% 
ReferRoomDto dto = (ReferRoomDto)request.getAttribute("rfr");

String msg = (String)request.getAttribute("msg");
System.out.println(msg);

iReferRoomDao dao = ReferRoomDao.getInstance();
dao.readCount(dto.getSeq());
%>  


<script type="text/javascript">
if(<%=msg %> != null && <%=msg %> != "")
{

	alert(msg);
}
</script>

<table border="1">

<tr><td> 번호 : <%=dto.getSeq() %> // 조회수 : <%=dto.getReadcount() %>
 // 다운로드 수 : <%=dto.getDowncount() %> // 좋아요 : <%=dto.getLikeit() %></td></tr>
<tr><td>작성일 : <%=dto.getWdate() %></td></tr>
<tr><td><b> 작성자 : <%=dto.getId() %></b> 다운로드 : <input type="button" class="btn" name="btnDown" value="파일"
					onclick="location.href='ReferDownCtlr?filename=<%=dto.getFilename() %>&seq=<%=dto.getSeq() %>'"></p></td></tr>
<tr><td> 제목 : <%=dto.getTitle() %></td></tr>
<tr><td><%=dto.getContent() %></td></tr>

</table>

<!-- 로그인 세션 받아와야되는부분 -->
<%
if(dto.getId().equals("idd")){
%>
<button onclick="deletebbs('<%=dto.getSeq() %>')">삭제</button>
<button onclick="updatebbs('<%=dto.getSeq() %>')">수정</button>
<%
}
%>
<button onclick="likeit('<%=dto.getSeq() %>')">이글이 도움이 되었습니다(좋아요)</button>


<a href='ReferListCtlr'>글 목록</a>

<script type="text/javascript">
function deletebbs(seq) {
	alert("삭제되었습니다");	
	location.href = "ReferDeleteCtlr?seq=" + seq;
}
function updatebbs(seq) {
	location.href = "ReferDetailCtlr?seq=" + seq + "&command=update";
}
function likeit(seq) {
	location.href = "ReferLikeCtlr?seq=" + seq + "&id=" + "<%=dto.getId()%>";
}
</script>

</body>
</html>