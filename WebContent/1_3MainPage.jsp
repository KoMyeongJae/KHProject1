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

String msg = request.getParameter("msg");
if(msg != null || msg == ""){
	%>
	<script type="text/javascript">
	alert("소중한 의견 감사합니다");
	</script>
	<%
}
%>
<%!
// nvl 함수
public boolean nvl(String msg){	// 요런걸 유틸리티 함수라고 해
	return msg == null || msg.trim().equals("")?true:false;
}
// 날짜 클릭하면 그 날의 일정이 모두 보이게 하는 callist.jsp로 이동시키는 함수
public String callist(int year, int month, int day){
	String s = "";
	
	s += String.format("<a href='%s?year=%d&month=%d&day=%d'>",
						"FestiListCtlr", year, month, day);
	
	s += String.format("%2d", day);
	s += "</a>";
	
	return s;
}

// 1 ~ 9 -> 20190101 되야지 201911 로 되면 안되는거야 [ -> 01, 02, 03 으로 만들기]
public String two(String msg){
	return msg.trim().length() < 2 ? "0"+msg : msg.trim();
}
//제목이 너무 길면 ... 처리하기 [ ex. 회의 약속이... ]
public String dot3(String msg){
	String s = "";
	if(msg.length() >= 6){
		s = msg.substring(0, 6);
		s += "...";
	}else{
		s = msg.trim();
	}
	return s;
}
// 각 날짜별로 테이블을 생성하는 함수
public String makeTable(int year, int month, int day, List<FestiCalendarDto> list){
	
	String s = "";
	String dates = (year + "") + two(month + "") + two(day + "");	// 20190201 이런 형태로 만들어주는 작업
	
	s += "<table>";
	s += "<col width='98'>";
	
	for(FestiCalendarDto dto : list){
		if(dto.getsrdate().substring(0, 8).equals(dates)){	// 시간까지 같이 넘어오니까 day 까지만 뽑아주는 부분이야
			s += "<tr bgcolor='lightblue'>";
			s += "<td>";
			
			// 이 부분이 연결부분인데, window.open 쓸거야
			s += "<a href='javascript:openDetail("+dto.getSeq()+")'ss>";
			s += "<font style='font-size:6; color:black'>'";
			
			s += dto.getTitle();
			
			s += "</font>";
			
			s += "</td>";
			s += "</tr>";
		}
	}
	s += "</table>";
	
	return s;
}


%>
<%
// 오늘 날짜 얻어오기
Calendar cal = Calendar.getInstance();

cal.set(Calendar.DATE, 1);	// 1일

String syear = request.getParameter("year");
String smonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
if(nvl(syear) == false){	// 넘어온 parameter 가 있다는거야
	year = Integer.parseInt(syear);
}

int month = cal.get(Calendar.MONTH) + 1;	// month 는 0 ~ 11
if(nvl(smonth) == false){
	month = Integer.parseInt(smonth);
}

// 이부분 이해하고 넘어가자
if(month < 1){
	month = 12;
	year--;
}
if(month > 12){
	month = 1;
	year++;
}

cal.set(year, month - 1, 1);	// 연 월 일 을 Setting

// 요일 구하기
int dayOfweek = cal.get(Calendar.DAY_OF_WEEK);	// 1(일) ~ 7(토)

// <<	전 연도 이동
String pp = String.format("<a href='%s?year=%d&month=%d'>" + "<img src='images/left-arrow.png'></a>",
							"1_3MainPage.jsp", year-1, month);
// <	전 달 이동
String p = String.format("<a href='%s?year=%d&month=%d'>" + "<img src='images/left-arrow.png'></a>",
							"1_3MainPage.jsp", year, month-1);
// >	다음 달 이동
String n = String.format("<a href='%s?year=%d&month=%d'>" + "<img src='images/right-arrow.png'></a>",
							"1_3MainPage.jsp", year, month+1);
// >>	다음 연도 이동
String nn = String.format("<a href='%s?year=%d&month=%d'>" + "<img src='images/right-arrow.png'></a>",
							"1_3MainPage.jsp", year+1, month);

iFestiCalendarDao dao = FestiCalendarDao.getInstance();
List<FestiCalendarDto> list = dao.getFestList(year + two(month + ""));
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
				<h1 id="logo"><a href="#">TRIPLAN</a></h1>
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
		<section id="main" style="background-image: url('images/aa.jpg');">
			<div class="container" >
				<div class="row" style="background-color: white !important;">
				
					<!-- Content banner 제외 부분에 본인코드 부분 작성하면 됩니다 -->
					<div class="content_m">
						<div id="content" class="col-8 col-12-medium">
						
							<!-- Post -->
							
								<article class="box post">
								<h3>축제 및 행사 일정</h3>
									<table>
									<col width="14.285%"><col width="14.285%"><col width="14.285%"><col width="14.285%">
									<col width="14.285%"><col width="14.285%"><col width="14.285%">
									<tr height="50">
										<td colspan="7" align="center">
											<%=pp %>&nbsp;<%=p %>
											<font color="black" style="font-size: 30px">
												<%=String.format("%d년&nbsp;&nbsp;%d월", year, month) %>
															<!-- 앞에 %d 에는 year, 뒤에 %d 에는 month 를 넣는거야 -->
											</font>
											<%=n %>&nbsp;<%=nn %>
										</td>
									</tr>
									<tr style="border: 1px solid; border-color: lightgray; padding-top: 1em;">
										<th  style="background-color: #E0F8F7; text-align: center;">Sunday</th>
										<th  style="background-color: #E0F8F7; text-align: center;">Monday</th>
										<th  style="background-color: #E0F8F7; text-align: center;">Tuesday</th>
										<th  style="background-color: #E0F8F7; text-align: center;">Wednesday</th>
										<th  style="background-color: #E0F8F7; text-align: center">Thursday</th>
										<th  style="background-color: #E0F8F7; text-align: center;">Friday</th>
										<th  style="background-color: #E0F8F7; text-align: center;">Saturday</th>
									</tr>
									<tr height="150" align="left" valign="top">
										<% // 위쪽 빈칸
										for(int i = 1; i < dayOfweek; i++){
										%>
											<td style="border: 1px solid; border-color: lightgray;">&nbsp;</td>
											<%
										}
										
										// 날짜
										int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
										for(int i = 1; i <= lastDay; i++){
											%>
											<td style="padding-top: 0.5em; border: 1px solid; border-color: lightgray;">
												<%=callist(year, month, i) %>
												<%=makeTable(year, month, i, list) %>
											</td>
											<%
											if((i + dayOfweek - 1)%7 == 0 && i != lastDay){
												%>
												</tr>
												<tr height="150" align="left" valign="top">
												<%
											}
										}
										
										// 밑칸
										for(int i = 0; i < (7 - (dayOfweek + lastDay - 1) % 7) % 7; i++){
											%>
											<td style="border: 1px solid; border-color: lightgray;">&nbsp;</td>
											<%
										}
										%>
										</tr>
									</table>
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
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>

<script type="text/javascript">
function openDetail(seq) {
	window.open("1_8FestiDetail.jsp?seq="+seq, "Festival", "width=750, height=550, scrollbars=yes, resizable=no, left=100, top=30");
}
function openSkyS() {
	window.open("https://www.skyscanner.co.kr/?ksh_id=_k_Cj0KCQiAtvPjBRDPARIsAJfZz0rlc5Nr_PqnGIkjyDBuew7pBjJnRwxq4Yx8UZIYwTSf03dZyXW3YZkaAq_fEALw_wcB_k_&associateID=SEM_GGT_00065_00021&utm_source=google&utm_medium=cpc&utm_campaign=KR-Travel-Search-Brand-Exact&utm_term=%EC%8A%A4%EC%B9%B4%EC%9D%B4%EC%8A%A4%EC%BA%90%EB%84%88&kpid=google_438310576_23048128696_331009635267_aud-326758276298:kwd-51820162295_c_&gclid=Cj0KCQiAtvPjBRDPARIsAJfZz0rlc5Nr_PqnGIkjyDBuew7pBjJnRwxq4Yx8UZIYwTSf03dZyXW3YZkaAq_fEALw_wcB")
}
</script>



</body>
</html>
