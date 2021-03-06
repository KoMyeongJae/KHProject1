<%@page import="java.util.Calendar"%>
<%@page import="FestiCalendar.FestiCalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="FestiCalendar.FestiCalendarDao"%>
<%@page import="FestiCalendar.iFestiCalendarDao"%>
<%@page import="User.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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

String name = user.getName();
%>
<%!
public String arrow(int depth){
	String rs = "<img src='./images/arrow.png' width='20px' height='20px'/>";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";	// 여백
	
	String ts = ""; 
	
	for(int i = 0;i < depth; i++){
		ts += nbsp;
	}
	
	return depth==0?"":ts + rs;
}

%>

<!DOCTYPE HTML>
<html>
<head>
	<title>MainPage</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link rel="stylesheet" href="assets/css/main.css">
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
								<h3>여행 자료</h3>
									<div align="center">
									<%-- multipart : byte, String 다 받아주는 방식 --%> 
									<%-- 파일보낼땐 String byte 둘다 보내기때문에 보내지지 않는다. --%>
									<form action="ReferAddCtlr" name="frm" method="post" enctype="multipart/form-data">
									
									<input type="hidden" name="command" value="addAf">
									
									<table class="specalt" style="margin-bottom: 0em;">
									<col width="15%"><col width="85%">
									<tr>
										<th>제목</th>
										<td style="padding-bottom: 0.5em;">
											<input type="text" id="title" name="title" placeholder="14자 내외로 입력해 주십시오" style="background: white; border: 1px solid; border-color: lightgray;">
										</td>
									</tr>
									<tr>
										<th>파일업로드</th>
										<td>
											<%-- 이건 request.get ~ 으로 받아낼 수 없다. --%>
											<input type="file" id="file" name="fileload" style="width: 400px">
										</td>
									</tr>
									<tr>
										<td colspan="2" style="padding-bottom: 0.5em;">
											<textarea rows="20" id="con" name="content" style="resize: none; background-color: white; border: 1px solid; border-color: lightgray;"></textarea>
										</td>
									</tr>
									</table>
									<div align="right">
										<button type="button" onclick="location.href='2_R_list.jsp'">목록</button>
										<input type="hidden" name="id" value="<%=user.getId() %>">
										<button type="button" onclick="doWrite()">올리기</button>
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
													<a href="UserDetailCtlr?id=<%=user.getId() %>"><font size="2">내 정보 보기</font></a>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="1_4Logout.jsp"><font size="2">로그아웃</font></a>
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
														<span class="date">뭘 또 뿌려줄까나</span>
														<h3><a href="#">Whatever you want</a></h3>
													</header>
													<p>Tell me what you want to add here.</p>
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
							<form method="post" action="1_5Request.jsp">
								<div class="row gtr-50">
									<div class="col-6 col-12-small">
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
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>

<script type="text/javascript">

function doWrite() {
	
	var frm = document.frm;
//	alert(frm.title.value.length);
	
	var errorMsg = null;
	var objFocus = null;
	
	if ( frm.title.value.length == 0 ){
		errorMsg = "글제목을 입력해 주십시오";
		objFocus = frm.title;
	} else if ( frm.content.value.length == 0 ){
		errorMsg = "내용을 입력해 주십시오";
		objFocus = frm.content;	
	} else if ( frm.file.value.length == 0 ){
		errorMsg = "파일을 지정해 주십시오";
		objFocus = frm.file;	
	} else if ( frm.title.value.length > 14 ){
		errorMsg = "제목길이를 수정해주세요";
		objFocus = frm.file;	
	}
	
	if(errorMsg != null){
		alert(errorMsg);
		objFocus.focus();
		return false;
	}
	alert("입력되었습니다");
	console.log(frm);
	frm.submit();
}


</script>


</body>
</html>
