<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes">
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
  <link rel="stylesheet" href="css/style.css">
  
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script  src="js/index.js"></script>
  <!-- 쿠키 사용 -->
  <script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
  
  <script type="text/javascript">
	function checkIt() {
		if($("#id").val() == ""){
			alert("ID를 입력해주세요.");
			$("#id1").focus();
			return false;
		}
		if($("#pwd").val() == ""){
			alert("패스워드를 입력해주세요.");
			$("#pwd1").focus();
			return false;
		}
	}
	</script>
</head>
<body>

<div class="cont">
  <div class="demo">
    <div class="login">
      <div class="login__check"></div>
      <div class="login__form">
      
      <form action="UserLoginCtlr" onsubmit="return checkIt()" method="post">
	        <div class="login__row">
	          <svg class="login__icon name svg-icon" viewBox="0 0 20 20">
	            <path d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
	          </svg>
	          <input type="text" name="id" id="id" placeholder="Username" class="login__input name">
	        </div>
	        
	        <div class="login__row">
	          <svg class="login__icon pass svg-icon" viewBox="0 0 20 20">
	            <path d="M0,20 20,20 20,8 0,8z M10,13 10,16z M4,8 a6,8 0 0,1 12,0" />
	          </svg>
	          <input type="password" name="pwd" id="pwd" placeholder="Password" class="login__input pass">
	        </div>
	        
        	<input type="checkbox" id="chk_save_id"> <font size="3" color="darkgray">Save ID</font>
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	
        		<font onclick='openDetail()' size="3" color="darkgray">Find Password</font>
        	
	         
	        <input type="submit" value="Sign in" class="login__submit">
	  </form>
	        <p class="login__signup">Don't have an account? &nbsp;<a href="UserAddCtlr?command=add">Sign up</a></p>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
$(document).ready(function () {
	
	var user_id = $.cookie("userid");
	if(user_id != null){
		$("#id").val(user_id);
		$("#chk_save_id").attr("checked", true);
	}
	
	$("#chk_save_id").click(function () {
//		alert("check");
		if($('input:checkbox[id="chk_save_id"]').is(":checked")){
			if($("#id").val() == ""){
				alert("id를 입력해주세요");
				$("#chk_save_id").prop("checked", false);
			}
			else{				
				$.cookie("userid", $("#id").val(), {expires:7, path: '/' });
			}
		}
		else{
			$.removeCookie("userid", {path: '/'});
		}
	});
});

function openDetail() {
	window.open("1_1findpwd.jsp" ,"비밀번호 찾기", 'width=330, height=480, scrolling="no"');
}
</script>

</body>
</html>