<%@page import="User.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
</head>
<body>
<%
UserDto dto = (UserDto)request.getAttribute("login");
session.setAttribute("login", dto);
session.setMaxInactiveInterval(3*60*60);


String name = dto.getName();
out.print(name + "님 반갑습니다");


%>
<br>

<a href="QaListCtlr?command=QA_list">QA 게시판 (Test ver)</a>

</body>
</html>