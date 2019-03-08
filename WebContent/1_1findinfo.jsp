<%@page import="User.UserDao"%>
<%@page import="User.iUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String cho = request.getParameter("cho");
String id = request.getParameter("id");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
String email = request.getParameter("email");

System.out.println("=========== Pt Checking ===========");
System.out.println("cho = " + cho);
System.out.println("id = " + id);
System.out.println("name = " + name);
System.out.println("phone = " + phone);
System.out.println("email = " + email);

iUserDao dao = UserDao.getInstance();

String msg = "";

String userid="";
String userpw="";


if(cho.equals("id")){
	
	userid = dao.check_id(name, phone, email);
		
	if(userid == null){
	
		msg = "존재하지 않는 아이디 입니다.";
	}
	else{
			
		msg = "고객님의 아이디는 " + userid + " 입니다.";
	}
		
}
else{
		
	userpw = dao.check_pw(id, name, email);
		
	if(userpw == null){
	
		msg = "정보를 잘못입력하셨습니다.";
	}
	else{
			
		msg = "고객님의 비밀번호는 " + userpw + " 입니다.";
	}
}



out.println(msg);

%>