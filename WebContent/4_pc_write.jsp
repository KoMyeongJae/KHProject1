<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="User.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%!
public String toDates(String mdate){
	SimpleDateFormat dd = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	String s = mdate.substring(0, 4) + "-"  +//yyyy
			   mdate.substring(4, 6) +  "-" + //mm
			   mdate.substring(6, 8);
	
	Date d = Date.valueOf(s);
	
	return dd.format(d);
}
public String two(String msg){
	return msg.trim().length()<2?"0"+msg:msg.trim();
}
%>
<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day"); 

String _date = year+two(month)+two(day);

System.out.println(year + "  " + month + "  " + day);
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 쓰기</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link rel="stylesheet" href="assets/css/main.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>



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
					<div align="center">
					<form action="PerCAddCtlr" method="post">
					<table class="type02" style="margin-bottom: 1em;">
					<col width="10%"><col width="90%">
					<tr>
					  <th class="title">Title</th>
					  <td>
					    <input type="text" name="title" style="width: 40%; background-color: white; border: 1px solid; border-color: lightgray;">
					  </td>
					</tr>
					<tr>
					  <th scope="row">Start</th>
					  <td scope="row">
					    <input type="text" id="rstartdate" name="rstartdate" style="width: 40%; background-color: white; border: 1px solid; border-color: lightgray;">
					  </td>
					</tr>
					<tr>
					  <th scope="row">End</th>
					  <td scope="row">
					    <input type="text" id="renddate" name="renddate" style="width: 40%; background-color: white; border: 1px solid; border-color: lightgray;">
					  </td>
					</tr>
					<tr>
					  <td colspan="2" scope="row">
					    <textarea rows="20" name="content" style="resize: none; width: 80%; background-color: white; border: 1px solid; border-color: lightgray;"></textarea>
					  </td>
					</tr>
					</table>
					<div align="right" style="padding-right: 11em;">
						<button type="button" onclick="location.href='4_pc_calendar.jsp'">목록</button>
						<input type="hidden" name="id" value="<%=user.getId()%>">
						<input type="submit" value="일정쓰기">
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
<script type="text/javascript">
$(function () {
	$("#rstartdate").datepicker({
		dateFormat:"yy/mm/dd", //연-월-일 넣기  기본값이 월/일/연도
		dayNamesMin:["일","월","화","수","목","금","토"],
		monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		nextText:'다음 달',
	    prevText:'이전 달',
	    changeMonth: true,
	    changeYear: true,
	    showButtonPanel:true,
	    showAnim:"slide",
	    buttonImage: "/application/db/jquery/images/calendar.gif", 
        onSelect:function(d){
        	var arrDate = d.split("/");
        	$("#rstartdate").val(arrDate[0]+arrDate[1]+arrDate[2]);
           }
        });
	    
});

$(function () {
	$("#renddate").datepicker({
		dateFormat:"yy/mm/dd", //연-월-일 넣기  기본값이 월/일/연도
		dayNamesMin:["일","월","화","수","목","금","토"],
		monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		nextText:'다음 달',
	    prevText:'이전 달',
	    changeMonth: true,
	    changeYear: true,
	    showButtonPanel:true,
	    showAnim:"slide",
	    buttonImage: "/application/db/jquery/images/calendar.gif", 
        onSelect:function(d){
        	var arrDate = d.split("/");
        	$("#renddate").val(arrDate[0]+arrDate[1]+arrDate[2]);
           }
        });
	    
});
</script>
</body>
</html>