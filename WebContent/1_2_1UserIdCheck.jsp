<%@page import="User.UserDao"%>
<%@page import="User.iUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String id = request.getParameter("id");

iUserDao dao = UserDao.getInstance();
boolean TF = dao.getId_User(id);
String msg = "";
if(TF == true){
	msg = "사용할 수 없는 ID 입니다";
}
else{
	msg = "사용할 수 있는 ID 입니다";
}
out.println(msg);

// 아이디 비밀번호 잃어버렸을때 찾는곳 + (휴대폰 인증)

%>
