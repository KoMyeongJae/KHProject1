<%@page import="PerCalendar.PerCalendarDao"%>
<%@page import="PerCalendar.iPerCalendarDao"%>
<%@page import="User.UserDto"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="PerCalendar.PerCalendarDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
//nvl 
public boolean nvl(String msg){
	return msg == null || msg.trim().equals("")?true:false;
}
//날짜 클릭시 리스트 출력하는 함수
public String callist(int year, int month, int day){
	String s = "";
	s += String.format("<a href='%s?year=%d&month=%d&day=%d'>",
			                     "PerCListCtlr",year,month,day);
	s += String.format("%2d",day);
	s += "</a>";
	
	return s;
}
//할일 작성하는 함수
public String showPen(int year, int month, int day){
	String s = "";
	
	String image = "<img src='./images/write-letter.png'>";
	
	s = String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>", 
			           "4_pc_write.jsp", year, month, day, image);
	
	return s;
}
//1~ 9  -> 01~09
public String two(String msg){
	return msg.trim().length()<2?"0"+msg:msg.trim();
}
//할일 제목길이조정
public String dot3(String msg){
	String s = "";
	if(msg.length() >= 6){
		s = msg.substring(0,6);
		s += "...";
	}else{
		s = msg.trim();
	}
	return s;
}
public String makeTable(int year, int month, int day, List<PerCalendarDto> list){
	String s = "";
	// int형을 String으로 변환한뒤 two함수를 통해서 2자리로 만들어준다.
	String dates = (year + "") + two(month + "") + two(day + "");	// 20190211
	
	s += "<table>";
	s += "<col width='70'>";
	
	for(PerCalendarDto dto : list){	
		
		
		if(dto.getRstartdate().substring(0, 8).equals(dates)){
			
			s += "<tr bgcolor='#FFFFA2'>";
			s += "<td>";
			
			s += "<a href='PerCDetailCtlr?seq=" + dto.getSeq() + "'>";
			s +="<img src='./images/check1.png'>";
			s += "<font style='font-size:13px; color:black'>"; 
			s += dot3(dto.getTitle());
			s += "</font>";
			s += "</a>";
			
			s += "</td>";
			s += "</tr>";		
		}else if(dto.getRenddate().substring(0, 8).equals(dates)){
			s += "<tr bgcolor='#FFFFA2'>";
			s += "<td>";
			
			s += "<a href='PerCDetailCtlr?seq=" + dto.getSeq() + "'>";
			s +="<img src='./images/check2.png'>";
			s += "<font style='font-size:13px; color:black'>"; 
			s += dot3(dto.getTitle());
			s += "</font>";
			s += "</a>";
			
			s += "</td>";
			s += "</tr>";
		}
		
	}
	s += "</table>";
	
	return s;
}
%>
<%
//로인그인한 정보 취득
Object ologin = session.getAttribute("login");
UserDto user = null;
if(ologin == null){
%>
  <script type="text/javascript">
     alert("로그인 해 주십시오");
     location.href = "1_0Start.jsp";
  </script>
<%
  return;
}
user = (UserDto)ologin;
%>
<%
Calendar cal = Calendar.getInstance();
cal.set(Calendar.DATE,1);

String syear = request.getParameter("year");
String smonth = request.getParameter("month");

//현재 년도
int year = cal.get(Calendar.YEAR);
if(nvl(syear) == false){
	year = Integer.parseInt(syear);
}
//현재 월
int month = cal.get(Calendar.MONTH) + 1 ;
if(nvl(smonth) == false){
	month = Integer.parseInt(smonth);
}

if(month < 1){ 
	month = 12;
	year--;
}if(month > 12){
	month = 1;
	year++;
}
//리스트 불러오기
iPerCalendarDao dao = PerCalendarDao.getInstance();
List<PerCalendarDto> list = dao.getPerCaledatList(user.getId(), year+two(month+""));
//달력 날짜 세팅
cal.set(year, month-1, 1);
int dayOfweek = cal.get(Calendar.DAY_OF_WEEK);

String pp = String.format("<a href='%s?year=%d&month=%d'>" + 
        "<img src='images/left-arrow.png'></a>",
         "4_pc_calendar.jsp", year-1, month);
//------<  이동(전월)
String p = String.format("<a href='%s?year=%d&month=%d'>" +
       "<img src='images/left-arrow.png'></a>",
       "4_pc_calendar.jsp",year,month-1);
//------>  이동(전월)
String n = String.format("<a href='%s?year=%d&month=%d'>" +
       "<img src='images/right-arrow.png'></a>", 
       "4_pc_calendar.jsp",year, month+1);
//------>> 이동(내년)
String nn = String.format("<a href='%s?year=%d&month=%d'>" + 
        "<img src='images/right-arrow.png'></a>", 
        "4_pc_calendar.jsp", year+1, month);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link rel="stylesheet" href="assets/css/main.css">
	
<title>개인 일정</title>
</head>
<body>
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
						<li><a class="icon fa-cog" href="#"><span>개인 일정</span></a></li>
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
					<h3>개인 일정</h3>
					<table class="type03">
					<col width="14.285%"><col width="14.285%"><col width="14.285%"><col width="14.285%">
					<col width="14.285%"><col width="14.285%"><col width="14.285%">
					<!-- --------년,월 넘기는 부분 -->
					<tr height="50">
					  <td colspan="7" align="center">
					    <%=pp %>&nbsp;<%=p %>
					    <font color="black" style="font-size: 30px">
					      <%=String.format("%d년&nbsp;&nbsp;%2d월",year, month) %>
					    </font>
					    <%=n %>&nbsp;<%=nn %>
					  </td>
					</tr>
					<tr class="weekdays" style="border: 1px solid; border-color: lightgray;">
						<th  style="background-color: #FAE0D4; text-align: center;">Sunday</th>
						<th  style="background-color: #FAE0D4; text-align: center;">Monday</th>
						<th  style="background-color: #FAE0D4; text-align: center;">Tuesday</th>
						<th  style="background-color: #FAE0D4; text-align: center;">Wednesday</th>
						<th  style="background-color: #FAE0D4; text-align: center">Thursday</th>
						<th  style="background-color: #FAE0D4; text-align: center;">Friday</th>
						<th  style="background-color: #FAE0D4; text-align: center;">Saturday</th>
					</tr>
					<!-- 달력부분에 위쪽 공백(1일이 수요일이라면 일월화는 공백처리)  -->
					<tr height="150" align="left" valign="top">
					<%
					for(int i = 1; i < dayOfweek; i++){
					//dayOfWeek은 1일에 대한 요일표현한다. 만약에 수요일(4)이라면 일요일,월요일,화요일은 공백처리
					%>
					   <td style="border: 1px solid; border-color: lightgray;">&nbsp;</td>
					<%
					}
					
					//------달력 부분에 날짜 입력 (만들어놓은 함수이용-테이블)
					//그 달의 마지막날짜까지 가져온다.
					int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
					//------달력 좌측 상단에 날짜 출력 부분
					for(int i = 1 ; i <= lastDay ; i++){
					%>
					  <td style="padding-top: 0.5em; border: 1px solid; border-color: lightgray;">
					      <!-- 1.날짜 표시 -->
					    &nbsp;<%=callist(year, month, i) %>&nbsp;
					      <!-- 2.일정 기록할 펜표시 -->
					    <%=showPen(year, month, i) %>
					      <!-- 3.일정테이블 출력(불러온리스트출력)-->
					    <%=makeTable(year, month, i, list) %>
					</td>	
						<%
						if((i + dayOfweek - 1) % 7 == 0 && i != lastDay){
							%>
							</tr>
					<!-- tr 태그가 필요하다면 더추가 31까지 출력한다면 28일이 토요일이라면29,30,31담기위한 tr태그 -->		
							<tr height="150" align="left" valign="top">		
							<%
						}
						
					}
					
					//--------- 밑칸 공백
					for(int i = 0;i < (7 - (dayOfweek + lastDay - 1) % 7) % 7; i++){
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
											<font size="3">안녕하세요       <%=user.getName() %>님</font><br><br>
											<!-- 가입일 넣을까? => DB 건드려야되요 -->
											<a href="#"><font size="2">내 정보 보기</font></a>
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
										<textarea name="message" placeholder="Message"></textarea>
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
<hr>
</body>
</html>