<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes">
  <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="cont">
  <div class="demo">
    <div class="login">
      <div class="login__check"></div>
      <div class="login__form">
      
      <form action="UserLoginCtlr">
	        <div class="login__row">
	          <svg class="login__icon name svg-icon" viewBox="0 0 20 20">
	            <path d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
	          </svg>
	          <input type="text" name="id" placeholder="Username" class="login__input name">
	        </div>
	        
	        <div class="login__row">
	          <svg class="login__icon pass svg-icon" viewBox="0 0 20 20">
	            <path d="M0,20 20,20 20,8 0,8z M10,13 10,16z M4,8 a6,8 0 0,1 12,0" />
	          </svg>
	          <input type="password" name="pwd" placeholder="Password" class="login__input pass">
	        </div>
	        
	        <input type="submit" value="Sign in" class="login__submit">
	  </form>
	        <p class="login__signup">Don't have an account? &nbsp;<a href="UserAddCtlr?command=add">Sign up</a></p>
	        
      </div>
    </div>
  </div>
</div>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script  src="js/index.js"></script>

</body>
</html>