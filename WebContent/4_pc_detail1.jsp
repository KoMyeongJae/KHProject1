<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="PerCalendar.PerCalendarDto"%>
<%@page import="User.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
//날짜 화면 표시용 함수
public String toDates(String mdate){
	SimpleDateFormat dd = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	String s = mdate.substring(0, 4) + "-"  +//yyyy
			   mdate.substring(4, 6) +  "-" + //mm
			   mdate.substring(6, 8);
	
	Date d = Date.valueOf(s);
	
	return dd.format(d);
}
%>
<%
UserDto user = (UserDto)session.getAttribute("login");
PerCalendarDto dto = (PerCalendarDto)request.getAttribute("detail");

DecimalFormat df = new DecimalFormat("00");
Calendar currentCalendar = Calendar.getInstance();

//현재 날짜 구하기
String strYear = Integer.toString(currentCalendar.get(Calendar.YEAR));
String strMonth = df.format(currentCalendar.get(Calendar.MONTH) + 1);
String strDay = df.format(currentCalendar.get(Calendar.DATE));
String strDate = strYear + strMonth + strDay;

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>detail</title>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link rel="stylesheet" href="assets/css/main.css">
  
  <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css'>

      <link rel="stylesheet" href="css/style41.css">

  
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
					<h3>개인 일정</h3>
					  <div class='left'>
					  <div class='left_inner41'>
					    
					    <h1>The trip of discovery is not in seeking new landscapes but in having new eyes.</h1>
					    
					    <a class='download' href='PerCUpdateCtlr?command=update&seq=<%=dto.getSeq() %>' target='_self'>
					      <i class="icon ion-social-codepen-outline"></i> <span>수정</span>
					    </a>
					    <a class='follow' href='PerCDeleteCtlr?seq=<%=dto.getSeq() %>' target='_self'>
					      <i class="icon ion-social-codepen-outline"></i> <span>삭제</span>
					    </a>
					  </div>
					</div>
					<div class='right'>
					  <div class='app41'>
					    <div class='app_inner'>
					      <input checked='' id='tab-1' name='buttons' type='radio'>
					      <label for='tab-1'>
					        <div class='app_inner__tab'>
					          <h2>
					            <i class='icon ion-android-alarm-clock'></i>
					           User
					          </h2>
					          <div class='tab_left'>
					            <i class='big icon ion-android-color-palette'></i>
					            <div class='tab_left__image'>
					              <i class='icon ion-android-color-palette'></i>
					            </div>
					          </div>
					          <div class='tab_right'>
					            <h3><%=toDates(strDate) %></h3>
					           
					            <h3 id="timebox"></h3>
					            
					            <h3>아이디 : <%=dto.getId() %></h3>
					            
					          </div>
					        </div>
					      </label>
					      <input false='' id='tab-2' name='buttons' type='radio'>
					      <label for='tab-2'>
					        <div class='app_inner__tab'>
					          <h2>
					            <i class='icon ion-android-alarm-clock'></i>
					          Title
					          </h2>
					          <div class='tab_left'>
					            <i class='big icon ion-music-note'></i>
					            <div class='tab_left__image'>
					              <i class='icon ion-music-note'></i>
					            </div>
					          </div>
					          <div class='tab_right'>
					            <h3><%=dto.getTitle() %></h3>
					             <button>Check your trip!</button>       
					          </div>
					        </div>
					      </label>
					      <input false='' id='tab-3' name='buttons' type='radio'>
					      <label for='tab-3'>
					        <div class='app_inner__tab'>
					          <h2>
					            <i class='icon ion-android-alarm-clock'></i>
					            Date
					          </h2>
					          <div class='tab_left'>
					            <i class='big icon ion-android-microphone'></i>
					            <div class='tab_left__image'>
					              <i class='icon ion-android-microphone'></i>
					            </div>
					          </div>
					          <div class='tab_right'>
					            <h3>시작 : <%=dto.getRstartdate() %></h3>
					            <h3>종료 : <%=dto.getRenddate() %></h3>
					            
					            <button type="button" id="myDayCount" onclick="DayCount()">D-Day Check!</button>
					          </div>
					        </div>
					      </label>
					      <input false='' id='tab-4' name='buttons' type='radio'>
					      <label for='tab-4'>
					        <div class='app_inner__tab'>
					          <h2>
					            <i class='icon ion-android-alarm-clock'></i>
					            Content
					          </h2>
					          <div class='tab_left'>
					            <i class='big icon ion-android-bar'></i>
					            <div class='tab_left__image'>
					              <i class='icon ion-android-bar'></i>
					            </div>
					          </div>
					          <div class='tab_right'>
					            
					            <h3><%=dto.getContent() %></h3>
					        
					            
					          </div>
					        </div>
					      </label>
					    </div>
					  </div>
					</div>
					 
					<script src='http://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js'></script>
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
											<a href="UserDetailCtlr?id=<%=user.getId() %>"><font size="2">내 정보 보기</font></a>
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
<hr> 


<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>

<script type="text/javascript">
function nowTime() {
	var now = new Date();
	var h = now.getHours();
	var m = now.getMinutes();
	var s = now.getSeconds();
	
	if(h<10){
		h = "0" + h;
	}
	if(m<10){
		m = "0" + m;
	}
	if(s<10){
		s = "0" + s;
	}
	document.getElementById("timebox").innerHTML="Time : "+ h+":"+m+":"+s;

};

setInterval('nowTime()',1000);
nowTime();
</script>

<script type="text/javascript">
function DayCount() {
	var rstartday = "<%=dto.getRstartdate()%>";
	var rmonth = rstartday.substr(4,2);
    var rday = rstartday.substr(6,2);
//    alert("rmonth = " + rmonth+" "+rday);
    
    var now = new Date();
    var dday = new Date();
    
    dday.setMonth(rmonth-1);
    dday.setDate(rday);
    
    var d = dday.getTime()- now.getTime();
    
     if(d<0){
    	alert("지난 일정입니다!");
    }else if(d>=0){
    	
    	var dd = d / (24*60*60*1000);
    	dd = Math.ceil(dd);
    	alert("D-Day : "+dd+" !");
    } 
};
</script>

<script type="text/javascript">
function openSkyS() {
	window.open("https://www.skyscanner.co.kr/?ksh_id=_k_Cj0KCQiAtvPjBRDPARIsAJfZz0rlc5Nr_PqnGIkjyDBuew7pBjJnRwxq4Yx8UZIYwTSf03dZyXW3YZkaAq_fEALw_wcB_k_&associateID=SEM_GGT_00065_00021&utm_source=google&utm_medium=cpc&utm_campaign=KR-Travel-Search-Brand-Exact&utm_term=%EC%8A%A4%EC%B9%B4%EC%9D%B4%EC%8A%A4%EC%BA%90%EB%84%88&kpid=google_438310576_23048128696_331009635267_aud-326758276298:kwd-51820162295_c_&gclid=Cj0KCQiAtvPjBRDPARIsAJfZz0rlc5Nr_PqnGIkjyDBuew7pBjJnRwxq4Yx8UZIYwTSf03dZyXW3YZkaAq_fEALw_wcB")
}
</script>

</body>
</html>