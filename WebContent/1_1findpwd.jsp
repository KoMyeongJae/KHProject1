<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>TRIPLAN</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes">
	<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
	<link rel="stylesheet" href="css/style1.css">
</head>

<body>
<div class="cont">
	<div align="center">
		<div id="wrap">
			<form action="UserAddCtlr" name="userinput" onsubmit="return checkIt()" method="post">
				<input type="hidden" name="command" value="addAf">
				<div id="body">
						<table width=300 height="350">
							<colgroup>
								<col width="40%"><col width="*">
							</colgroup>
							<tr>
								<th colspan="2" class="subTitle">ID check</th>
							</tr>
							<tr>
								<th>NAME</th>
								<td><input type="text" id="name" name="name" maxlength="10" placeholder="홍길동"></td>
							</tr>
							<tr>
								<th>E-Mail</th>
								<td>
									<input type="text" id="email" name="email" maxlength="30" placeholder="ex)abcd@gmail.com">
								</td>
							</tr>
							<tr>
								<th>PHONE</th>
								<td><input type="text" id="phone" name="phone" maxlength="20" placeholder="ex)01012345678"></td>
							</tr>
							<tr>
								<th colspan="2" class="subTitle">Pwd check</th>
							</tr>
							
							<tr>
								<th>User ID</th>
								<td>
									<input type="text" id="id" name="id" maxlength="12" placeholder="아이디를 입력해주세요~">

								</td>
							</tr>
							
							<tr>
								<th>NAME</th>
								<td><input type="text" id="name2" name="name" maxlength="10" placeholder="데이비드"></td>
							</tr>
							<tr>
								<th>E-Mail</th>
								<td>
									<input type="text" id="email2" name="email" maxlength="30" placeholder="ex)abcd@gmail.com">
								</td>
							</tr>
							
							<tr>
							<td>
							
							</td>
							<td>
							<input type="button" id="iddd" value="id Check">
							<input type="button" id="pwdd" value="pw Check">
							</td>
							
							</tr>
						</table>
				</div>
				<p style="font-size: 15px; color:#8A084B;"id="idable"></p>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function name() {
	$("#iddd").click(function () {
		 $.ajax({
			url:"1_1findinfo.jsp",
			type:'get',
			data:"name="+$("#name").val()+"&phone="+$("#phone").val()+
					"&email="+$("#email").val()+"&cho=id",
			success:function(data, status, xhr){
			//	alert(data.trim());
				$("#idable").text(data);
			},
			error:function(xhr, status, error){
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			complete:function(xhr, statussss){
				
			}
		});

	});
	
	$("#pwdd").click(function () {
		 $.ajax({
			url:"1_1findinfo.jsp",
			type:'get',
			data:"&id="+$("#id").val()+"&name="+$("#name2").val()
					+"&email="+$("#email2").val()+"&cho=pwd",
			success:function(data, status, xhr){
			//	alert(data.trim());
				$("#idable").text(data);
			},
			error:function(xhr, status, error){
				alert("입력하신 정보가 올바르지 않습니다");
			},
			complete:function(xhr, statussss){
				
			}
		});

	});
});
/**/
</script>
</body>
</html>