<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes">
	<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
	<link rel="stylesheet" href="css/style1.css">
</head>
<body>

<div class="cont">
	<div align="Center">
		<div id="wrap">
			<form action="inputPro.jsp" name="userinput" onsubmit="return checkIt()" method="post">
				<h1>★회원가입★</h1>
				<div id="body">
						<table>
							<colgroup>
								<col width="20%" />
								<col width="*" />
							</colgroup>
							<tr>
								<th colspan="2" class="subTitle">*아이디 입력</th>
							</tr>
							<tr>
								<th>USER ID</th>
								<td>
									<input type="text" name="id" maxlength="12">
									<input type="button" name="confirm_id" value="ID 중복확인" class="inputBtn" onclick="javascript:openConfirmid(this.form);" /></td>
							</tr>
							<tr>
								<th>Password</th>
								<td><input type="password" name="passwd" maxlength="12" /></td>
							</tr>
							<tr>
								<th>Retype Password</th>
								<td><input type="password" name="passwd2" maxlength="12" /></td>
							</tr>
							<tr>
								<th colspan="2" class="subTitle">*개인정보 입력</th>
							</tr>
							<tr>
								<th>NAME</th>
								<td><input type="text" name="name" maxlength="10" /></td>
							</tr>
							<tr>
								<th>BIRTH</th>
								<td>
									<input type="text" name="jumin1" maxlength="6" /> - 
									<input type="password" name="jumin2" maxlength="7" />
								</td>
							</tr>
							<tr>
								<th>E-Mail</th>
								<td><input type="text" name="email" class="w300" maxlength="30" /></td>
							</tr>
							<tr>
								<th>PHONE</th>
								<td><input type="text" name="blog" class="w300" maxlength="50" /></td>
							</tr>
							<tr>
								<th>ADDRESS</th>
								<td>
									<input type="text" name="zipcode" /> <input type="button" value="우편번호 검색" class="inputBtn" onclick="javascript:zipCheck();" />
									<span>우편번호를 입력하세요.</span>
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>
									<input type="text" name="address" class="w380" >
									<span class=descB>주소를 입력하세요.</span>
								</td>
							</tr>
						</table>
				</div>
				<div id="footer">
					<input type="submit" name="confirm" class="inputBtn" value="등 록" />
					<input type="reset" name="reset" class="inputBtn" value="다시입력" />
					<input type="button" value="취 소" class="inputBtn" onclick="javascript:window.location='main.jsp'" />
				</div>
			</form>
		</div>
	</div>
</div>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script  src="js/index.js"></script>

</body>
</html>