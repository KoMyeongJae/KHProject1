<%@page import="User.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setContentType("text/html; charset=utf-8");
request.setCharacterEncoding("utf-8");

UserDto dto = (UserDto)request.getAttribute("detail_user");

Object ologin = session.getAttribute("login");
UserDto user = null;
if(ologin == null){	// session 정보가 사라진 상태
	%>
	<script type="text/javascript">
	alert("로그인해주세요");
	location.href = "1_0Start.jsp";
	</script>
	<%
	return;
}
user = (UserDto)ologin;

String id = dto.getId();
String name = dto.getName();
String birth = dto.getBirth();
String email = dto.getEmail();
String phone = dto.getPhone();
String address[] = dto.getAddress();

// 왜 수정이안될까
%>
<!DOCTYPE HTML>
<html>
<head>
	<!-- datepicker 사용 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	
	<title>Update Information</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link rel="stylesheet" href="assets/css/main.css">
	
	<!-- 주소검색 사용 -->
 	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 	
 	<script type="text/javascript">
	function checkIt() {
		var userinput = eval("document.userinput");
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
<body class="homepage is-preload">
	<div id="page-wrapper">
		<!-- Header -->
		<section id="header" style="background: url(images/header6.jpg)no-repeat; background-size: 100% 100%;">
			<div class="container">
				<!-- Logo : Logo 를 누르면 MainPage 로 이동하게 만들기 -->
				<h1 id="logo"><a href="1_3MainPage.jsp">TRIPLAN</a></h1>
				<p><strong><font color="white">TRIP & PLAN : </font></strong>
				<strong><font color="white">Planning Your Trip</font></strong></p>
				
				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a class="icon fa-home" href="#"><span>About Us</span></a></li>
						<li>
							<a href="#" class="icon fa-sitemap"><span>나라 정보</span></a>
							<ul>
								<li>
									<a href="3_InfoCntryUsa.jsp">미국</a>
										<ul>
											<li><a href="#">뉴욕</a></li>
											<li><a href="#">하와이</a></li>
											<li><a href="#">LA</a></li>
										</ul>
								</li>
								<li>
									<a href="3_InfoCntryJapan.jsp">일본</a>
										<ul>
											<li><a href="#">도쿄</a></li>
											<li><a href="#">오사카</a></li>
											<li><a href="#">후쿠오카</a></li>
										</ul>
								</li>
								<li>
									<a href=3_InfoCntryVietnam.jsp>베트남</a>
										<ul>
											<li><a href="#">하노이</a></li>
											<li><a href="#">다낭</a></li>
											<li><a href="#">호치민</a></li>
										</ul>
								</li>
								<li>
									<a href="3_InfoCntryRussia.jsp">러시아</a>
									<ul>
										<li><a href="#">모스크바</a></li>
										<li><a href="#">상트페테르부르크</a></li>
										<li><a href="#">블라디보스톡</a></li>
									</ul>
								</li>
							</ul>
						</li>
						<!-- class="icon fa-bar-chart-o" -->
						<li><a class="icon fa-sitemap" href="1_6PicBbsList.jsp"><span>여행 후기</span></a></li>
						<li><a class="icon fa-retweet" href="2_R_list.jsp"><span>여행 자료</span></a></li>
						<li><a class="icon fa-sitemap" href="3_QA_list.jsp"><span>Q&A</span></a></li>
						<li><a class="icon fa-cog" href="4_pc_calendar.jsp"><span>개인 일정</span></a></li>
					</ul>
				</nav>

			</div>
		</section>
		
		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
				
					<!-- Content banner 제외 부분에 본인코드 부분 작성하면 됩니다 -->
					<div class="content_m">
					<div id="content" class="col-8 col-12-medium">
						
						<!-- Post -->
						<article class="box post">
							<header>
								<h2>내 정보 수정</h2>
							</header>
							<div style="width: 90%">
							<form action="UserUpdate" name="userinput" onsubmit="return checkIt()" method="post">
								<input type="hidden" name="command" value="update_user">
								<table style="border: 1px solid; border-color: lightgray; margin-bottom: 1em;">
										<col width="5%"><col width="15%"><col width="10%">
									<tr style="border-bottom: 1px solid; border-bottom-color: lightgray;">
										<th colspan="3" class="subTitle">* &nbsp;&nbsp;&nbsp;ID Information</th>
									</tr>
									<tr>
										<th>User ID</th>
										<td colspan="2">
											<input type="text" name="id" value="<%=id %>" readonly="readonly" style="width: 50%;">
										</td>
									</tr>
									<tr style="border: 1px solid; border-color: lightgray;">
										<th colspan="3" class="subTitle">* &nbsp;&nbsp;&nbsp;Personal Information</th>
									</tr>
									<tr>
										<th>NAME</th>
										<td colspan="2">
											<input type="text" name="name" value="<%=name %>" maxlength="10" style="width: 50%;">
										</td>
									</tr>
									<tr>
										<th>BIRTH</th>
										<td colspan="2">
											<input type="text" id="birth" name="birth" value="<%=birth %>" style="width: 50%;">
										</td>
									</tr>
									<tr>
										<th>E-Mail</th>
										<td colspan="2">
											<input type="text" name="email" class="w300" maxlength="30" value="<%=email %>" style="width: 50%;">
										</td>
									</tr>
									<tr>
										<th>PHONE</th>
										<td colspan="2">
											<input type="text" name="phone" class="w300" maxlength="50" value="<%=phone %>" style="width: 50%;">
										</td>
									</tr>
									<tr>
										<th>ADDRESS</th>
										<td>
											<input type="hidden" id="postcode" name="addressnot">
											<input type="text" id="address1" name="address" value="<%=address[0] %>">
										</td>
										<td>
											<input type="button" onclick="DaumPostcode()" value="Search">
											<font size="2">주소검색을 이용하세요</font>
										</td>
									</tr>
									<tr>
										<th></th>
										<td colspan="2">
											<input type="text" id="detailAddress" name="address" value="<%=address[1] %>" style="width: 50%;">
											<input type="hidden" id="extraAddress" name="addressnot" placeholder="참고항목">
										</td>
									</tr>
								</table>
								<div align="right">
									<input type="submit" class="inputBtn" value="수정 완료">
				
								</div>
							</form>
							</div>
						</article>
					</div>
					</div>

					<!-- Sidebar -->
					<div id="sidebar" class="col-4 col-12-medium">

						<!-- Excerpts -->
						<section>
							<ul class="divided">
								<li>

									<!-- Excerpt -->
										<article class="box excerpt">
											<header>
												<font size="6" color="gray">My Information</font>
											</header>
											<font size="3">안녕하세요       <%=name %>님</font><br><br>
											<!-- 가입일 넣을까? => DB 건드려야되요 -->
											<a href="UserDetailCtlr?id=<%=id%>"><font size="2">내 정보 보기</font></a>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="1_4Logout.jsp"><font size="2">로그아웃</font></a><br>
											<a href="#"><font size="2">Wish List</font></a>
										</article>
								</li>
								<li>
									<!-- Excerpt -->
										<article class="box excerpt">
											<header>
												<span class="date">환율 차트 뿌려주자</span>
												<h3><a href="#">Exchange rate</a></h3>
											</header>
											<p>You can see the exchange rate here.</p>
										</article>

								</li>
								<li>

									<!-- Excerpt -->
										<article class="box excerpt">
											<header>
												<span class="date">Book your trip now!</span>
												<h3><a href="javascript:openSkyS()">
														<img alt="x" src="images/skyscanner.jpg">
												</a></h3>
											</header>
										</article>

								</li>
							</ul>
						</section>
					</div>
				</div>
			</div>
		</section>
		
		<!-- Footer -->
		<section id="footer">
			<div class="container">
				<header>
					<font size="15" color="lightgray" style="font-family: cursive;">Request or comments? <strong>Get in touch:</strong></font>
				</header>
				<div class="row">
					<div class="col-6 col-12-medium">
						<section>
							<form method="get" action="UserRequestCtlr">
								<div class="row gtr-50">
									<div class="col-6 col-12-small">
										<input type="hidden" name="id" value="<%=user.getId() %>">
										<input name="name" placeholder="Name" type="text" />
									</div>
									<div class="col-6 col-12-small">
										<input name="email" placeholder="Email" type="text" />
									</div>
									<div class="col-12">
										<textarea name="message" placeholder="Message" style="height: 11em; resize: none;"></textarea>
									</div>
									<div class="col-12">
										<input type="submit" value="Send Message" class="form-button-submit button icon fa-envelope">
									</div>
								</div>
							</form>
						</section>
					</div>
					<div class="col-6 col-12-medium">
						<section>
							<p>If you have any requests or comments for us, please do not hesitate to give us your opinions.
							It is a pleasure, not a duty, to work for you. Thank you.</p>
							<div class="row">
								<div class="col-6 col-12-small">
									<ul class="icons">
										<li class="icon fa-home">
											2Floor, 6, Teheran-ro 14-gil<br>
											Gangnam-gu, Seoul<br>
											Republic of Korea
										</li>
										<li class="icon fa-phone">
											(02) 562-2378
										</li>
										<li class="icon fa-envelope">
											komj707@gmail.com
										</li>
									</ul>
								</div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</section>
	</div>
	
<!-- Scripts -->

<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>

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
            
            document.getElementById("detailAddress").value = "";
            
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
<script type="text/javascript">ss
function openSkyS() {
	window.open("https://www.skyscanner.co.kr/?ksh_id=_k_Cj0KCQiAtvPjBRDPARIsAJfZz0rlc5Nr_PqnGIkjyDBuew7pBjJnRwxq4Yx8UZIYwTSf03dZyXW3YZkaAq_fEALw_wcB_k_&associateID=SEM_GGT_00065_00021&utm_source=google&utm_medium=cpc&utm_campaign=KR-Travel-Search-Brand-Exact&utm_term=%EC%8A%A4%EC%B9%B4%EC%9D%B4%EC%8A%A4%EC%BA%90%EB%84%88&kpid=google_438310576_23048128696_331009635267_aud-326758276298:kwd-51820162295_c_&gclid=Cj0KCQiAtvPjBRDPARIsAJfZz0rlc5Nr_PqnGIkjyDBuew7pBjJnRwxq4Yx8UZIYwTSf03dZyXW3YZkaAq_fEALw_wcB")
}
</script>

</body>
</html>
