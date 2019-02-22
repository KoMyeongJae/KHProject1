<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<!-- datepicker 사용 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	
	<!-- CSS 사용 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes">
	<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
	<link rel="stylesheet" href="css/style1.css">
	
	<!-- 주소검색 사용 -->
 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 	
 	<script type="text/javascript">
	function checkIt() {
		var userinput = eval("document.userinput");
		if(!userinput.id.value) {
			alert("ID를 입력하세요");
			return false;
		}
		if(!userinput.pwd.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		if(userinput.pwd.value != userinput.pwd2.value) {
			alert("비밀번호가 달라요");
			return false;
		}
		if(!userinput.name.value) {
			alert("이름을 입력하세요");
			return false;
		}
		if(!userinput.birth.value) {
			alert("생년월일을 입력하세요");
			return false;
		}
		if(!userinput.email.value) {
			alert("이메일을 입력하세요");
			return false;
		}
		if(!userinput.phone.value) {
			alert("전화번호를 입력하세요");
			return false;
		}
		if(!userinput.address.values) {
			alert("주소를 입력하세요");
			return false;
		}
		if($("#detailAddress").val() == ""){
			alert("상세주소를 입력해주세요");
			return false;
		}
	}
	</script>
</head>
<body>

<div class="cont">
	<div align="Center">
		<div id="wrap">
			<form action="UserAddCtlr" name="userinput" onsubmit="return checkIt()" method="post">
				<input type="hidden" name="command" value="addAf">
				<div id="body">
						<table>
							<colgroup>
								<col width="20%"><col width="*">
							</colgroup>
							<tr>
								<th colspan="2" class="subTitle">ID Information</th>
							</tr>
							<tr>
								<th>User ID</th>
								<td>
									<input type="text" id="id" name="id" maxlength="12">
									<input type="button" id="idcheck" value="ID_Check" onclick="idchek()"  class="inputBtn">
									<p id="idable"></p>
								</td>
							</tr>
							<tr>
								<th>Password</th>
								<td>
									<input type="password" name="pwd" id="pwd" maxlength="12" minlength="6" placeholder="6자리 이상 입력">
								</td>
							</tr>
							<tr>
								<th>Retype Password</th>
								<td>
									<input type="password" id="pwd2" name="pwd2" maxlength="12" minlength="6" placeholder="6자리 이상 입력">
								</td>
							</tr>
							<tr>
								<th colspan="2" class="subTitle">Personal Information</th>
							</tr>
							<tr>
								<th>NAME</th>
								<td><input type="text" name="name" maxlength="10"></td>
							</tr>
							<tr>
								<th>BIRTH</th>
								<td>
									<input type="text" id="birth" name="birth" placeholder="ex)1990/12/06 or Select Calendar">
								</td>
							</tr>
							<tr>
								<th>E-Mail</th>
								<td>
									<input type="text" name="email" class="w300" maxlength="30" placeholder="ex)abcd@gmail.com">
								</td>
							</tr>
							<tr>
								<th>PHONE</th>
								<td><input type="text" name="phone" class="w300" maxlength="50" placeholder="ex)01012345678"></td>
							</tr>
							<tr>
								<th>ADDRESS</th>
								<td>
									<input type="hidden" id="postcode" name="addressnot" placeholder="우편번호">
									<input type="text" id="address1" name="address" placeholder="주소">
									<input type="button" onclick="DaumPostcode()" value="Search">
									<span>주소검색을 이용하세요</span>
								</td>
							</tr>
							<tr>
								<th></th>
								<td>
									<input type="text" id="detailAddress" name="address" placeholder="상세주소" size="12">
									<input type="hidden" id="extraAddress" name="addressnot" placeholder="참고항목" size="8">
								</td>
							</tr>
						</table>
				</div>
				<div id="footer">
					<input type="submit" class="inputBtn" value="Register">
					<input type="reset" name="reset" class="inputBtn" value="Retype">
					<input type="button" value="Cancle" class="inputBtn" onclick="javascript:window.location='1_1Login.jsp'">
				</div>
			</form>
		</div>
	</div>
</div>
  
<!-- CSS 사용 -->
<!-- <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script  src="js/index.js"></script> -->
<script type="text/javascript">
$(document).ready(function name() {
	$("#idcheck").click(function () {
		 $.ajax({
			url:"1_2_1UserIdCheck.jsp",
			type:'get',
			data:"id="+$("#id").val(),
			success:function(data, status, xhr){
				alert(data.trim());
				$("#idable").text(data);
			},
			error:function(xhr, status, error){
				alert("Fail");
			},
			complete:function(xhr, statussss){
				
			}
		});

	});
});
/**/
</script>
<script>
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            
            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementById("extraAddress").value = extraAddr;
                
            } else {
                document.getElementById("extraAddress").value = '';
            }
            
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address1").value = addr;
            
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
</script>

<script type="text/javascript">
$(function () {
	$("#birth").datepicker({
		dateFormat:"yy/mm/dd",
		dayNamesMin:["일", "월", "화", "수", "목", "금", "토"],
		monthNames:["1월", "2월", "3월", "4월", "5월", "6월",
					"7월", "8월", "9월", "10월", "11월", "12월"],
		changeMonth: true, 
		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달',
		
		onSelect:function( d ){
			var date = new Date(
					$("#date").datepicker({dataFormat:"yy/mm/dd"}).val());
		}
	});
});
</script>

</body>
</html>