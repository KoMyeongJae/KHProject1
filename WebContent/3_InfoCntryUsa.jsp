<%@page import="U_W.U_W_L_MAX"%>
<%@page import="U_W.U_W_L_MIN"%>
<%@page import="U_W.U_W_N_MAX"%>
<%@page import="U_W.U_W_N_MIN"%>
<%@page import="U_W.U_W_H_MAX"%>
<%@page import="U_W.U_W_H_MIN"%>
<%@page import="U_W.U_W_L_mm"%>
<%@page import="U_W.U_W_H_mm"%>
<%@page import="U_W.U_W_N_mm"%>
<%@page import="U_W.U_Wether"%>
<%@page import="Exchange.U_manager"%>
<%@page import="Exchange.U_Exchange"%>
<%@page import="User.UserDto"%>

<%@page import="java.util.List"%>
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
<%
List<U_Exchange> list = U_manager.getExchanges();

String jsonEx = "";

for(Exchange.U_Exchange jex : list){
   jsonEx +=  jex.getSpt();
}


jsonEx += "";

System.out.println(jsonEx);

request.setAttribute("jsonEx", jsonEx); 

%>
<%
String Hwt = U_W_H_mm.getWeather();
String HwtMin = U_W_H_MIN.getWeather();
String HwtMax = U_W_H_MAX.getWeather();

String Nwt = U_W_N_mm.getWeather();
String NwtMin = U_W_N_MIN.getWeather();
String NwtMax =U_W_N_MAX.getWeather();

String Lwt = U_W_L_mm.getWeather();
String LwtMin = U_W_L_MIN.getWeather();
String LwtMax = U_W_L_MAX.getWeather();
%>
<!DOCTYPE HTML>
<html>
<head>
	<title>MainPage</title>
	<meta charset="utf-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- main CSS -->
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link rel="stylesheet" href="assets/css/main.css">
	<!-- chart css -->
   <script src="https://code.highcharts.com/highcharts.js"></script>
	<!-- infoCntry CSS -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<!-- Bootstrap core CSS -->
	<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom fonts for this template -->
	<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	
	<!-- Plugin CSS -->
	<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
	
	<!-- Custom styles for this template -->
	<link href="css/freelancer.min.css" rel="stylesheet">
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
									<a href="3_InfoCntryUsa.jsp" style="color: black;">미국</a>
										<ul>
											<li><a href="#" style="color: black;">뉴욕</a></li>
											<li><a href="#" style="color: black;">하와이</a></li>
											<li><a href="#" style="color: black;">LA</a></li>
										</ul>
								</li>
								<li>
									<a href="3_InfoCntryJapan.jsp" style="color: black;">일본</a>
										<ul>
											<li><a href="#" style="color: black;">도쿄</a></li>
											<li><a href="#" style="color: black;">오사카</a></li>
											<li><a href="#" style="color: black;">후쿠오카</a></li>
										</ul>
								</li>
								<li>
									<a href=3_InfoCntryVietnam.jsp style="color: black;">베트남</a>
										<ul>
											<li><a href="#" style="color: black;">하노이</a></li>
											<li><a href="#" style="color: black;">다낭</a></li>
											<li><a href="#" style="color: black;">호치민</a></li>
										</ul>
								</li>
								<li>
									<a href="3_InfoCntryRussia.jsp" style="color: black;">러시아</a>
									<ul>
										<li><a href="#" style="color: black;">모스크바</a></li>
										<li><a href="#" style="color: black;">상트페테르부르크</a></li>
										<li><a href="#" style="color: black;">블라디보스톡</a></li>
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
						<div id="content" class="col-8 col-12-medium" style="max-width: 100%;">
							
							<!-- Post -->
							
							<article class="box post">
								<div class="center">
								  <!-- Navigation -->
								   <nav class="navbar navbar-expand-lg bg-secondary fixed-top text-uppercase" id="mainNav" style="display: none;">
								    <div class="container">
								      <a class="navbar-brand js-scroll-trigger" href="#page-top">U.S.A</a>
								      <button class="navbar-toggler navbar-toggler-right text-uppercase bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
								        Menu
								        <i class="fas fa-bars"></i>
								      </button>
								      <div class="collapse navbar-collapse" id="navbarResponsive">
								        <ul class="navbar-nav ml-auto">
								          <li class="nav-item mx-0 mx-lg-1">
								            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#portfolio">CITY</a>
								          </li>
								          <li class="nav-item mx-0 mx-lg-1">
								            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#about">EXCHANGE</a>
								          </li>
								          <li class="nav-item mx-0 mx-lg-1">
								            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#contact">WEATHER</a>
								          </li>
								        </ul>
								      </div>
								    </div>
								  </nav>  
								
								  <!-- Header -->
								  <header class=" bg-img text-black text-center" >
								    <div class="container">
								      <img class="img-fluid mb-5 d-block mx-auto" src="img/usa.jpg" style="margin-bottom: 0em !important;">
								      <font size="15" color="darkgray"><strong>U . S . A</strong></font>
								      <h3 class="font-weight-light mb-0" style="font-family: sans-serif;">The Country of Stars</h3>
								    </div>
								  </header>
								
								  <!-- Portfolio Grid Section -->
								  <section class="portfolio" id="portfolio">
								    <div class="container">
								      <h2 class="text-center text-uppercase text-secondary mb-0" style="text-shadow:gray; color: lightblue !important;">CITY</h2>
								      <div class="row" style="margin-bottom: 1em;">
								        <div class="col-md-6 col-lg-4 text-center">
								          <a class="portfolio-item d-block mx-auto" href="#portfolio-modal-1" style="margin-bottom: 0.5em;">
								            <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
								              <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
								                <i class="fas fa-search-plus fa-3x"></i>
								              </div>
								            </div>
								            <img class="img-fluid" src="img/newyork/newyork.jpg" alt="">
								          </a>
								          	<font size="6" color="lightgray" style="font-family: fantasy;">NEWYORK</font>
								        </div>
								        <div class="col-md-6 col-lg-4 text-center">
								          <a class="portfolio-item d-block mx-auto" href="#portfolio-modal-2" style="margin-bottom: 0.5em;">
								            <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
								              <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
								                <i class="fas fa-search-plus fa-3x"></i>
								              </div>
								            </div>
								            <img class="img-fluid" src="img/LA/la.jpg" alt="">
								          </a>
								          <font size="6" color="lightgray" style="font-family: fantasy;">LA</font>
								        </div>
								        <div class="col-md-6 col-lg-4 text-center">
								          <a class="portfolio-item d-block mx-auto" href="#portfolio-modal-3" style="margin-bottom: 0.5em;">
								            <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
								              <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
								                <i class="fas fa-search-plus fa-3x"></i>
								              </div>
								            </div>
								            <img class="img-fluid" src="img/hawai/hawai.jpg" alt="">
								          </a>
								          <font size="6" color="lightgray" style="font-family: fantasy;">HAWAII</font>
								        </div>
								      </div>
								    </div>
								  </section>
								  
								  
								
								  <!-- About Section -->
								  <section class="bg-primary text-white mb-0" id="about" style="background-color: white !important;">
								    <div class="container" style="background-color: white;">
								      <h2 class="text-center text-uppercase" ><font color="lightblue">Exchange</font></h2>
								      <div class="text-center" style="text-align: center;">
								        <div class="col-lg-4 ml-auto" style="margin-left: 16em !important;"> 
								          <p class="lead text-uppercase text-lightgray text-center">
								          	<font color="gray" style="text-align: center;">
								          	1$ = <%=request.getAttribute("jsonEx") %> 원
								          	</font>
								          </p>
								        </div> 
								      </div>
								    </div>
								  </section>
								
								  <!-- Contact Section -->
								  <section id="contact">
								    <div class="container">
								      <h2 class="text-center text-uppercase text-secondary mb-0">
								      <font color="lightblue">WEATHER</font>
								      </h2>
								      <div class="row">
								        <div class="col-lg-8 mx-auto">
								             <h3 class="text-center text-uppercase text-black" >
								             	<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto">
			                                       <input hidden="" id="NWea" value="<%=Nwt%>">
			                                       <input hidden="" id="LWea" value="<%=Lwt%>">  
			                                       <input hidden="" id="HWea" value="<%=Hwt%>">
			                                       <input hidden="" id="NWeaMin" value="<%=NwtMin%>">
			                                       <input hidden="" id="LWeaMin" value="<%=LwtMin%>">
			                                       <input hidden="" id="HweaMin" value="<%=HwtMin%>">
			                                       <input hidden="" id="NWeaMax" value="<%=NwtMax%>">
			                                       <input hidden="" id="LWeaMax" value="<%=LwtMax%>">
			                                       <input hidden="" id="HweaMax" value="<%=HwtMax%>">      
		                                       </div>
								             
								             </h3>
								        </div>
								      </div>
								    </div>
								  </section>
								
								
								  <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
								  <div class="scroll-to-top d-lg-none position-fixed ">
								    <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
								      <i class="fa fa-chevron-up"></i>
								    </a>
								  </div>
								
								  <!-- Portfolio Modals -->
								
								  <!-- Portfolio Modal 1 -->
		                          <div class="portfolio-modal mfp-hide" id="portfolio-modal-1">
		                            <div class="portfolio-modal-dialog bg-white">
		                              <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
		                                <i class="fa fa-3x fa-times"></i>
		                              </a>
		                              <div class="container text-center">
		                                <div class="row">
		                                  <div class="col-lg-8 mx-auto">
		                                    <h2 class="text-secondary text-uppercase mb-0">NEWYORK</h2>
		                                    <hr class="star-dark mb-5">
		                                    <hr>
		                                    <h3 class="text-secondary text-uppercase mb-0">타임스퀘어 광장</h3>
		                                    <img class="img-fluid mb-5" src="img/newyork/newyork1.jpg" alt="">
		                                    <p class="mb-5">미국 뉴욕 미드타운 맨해튼에 있는 유명한 상업적 교차로로, 웨스트 42번가와 웨스트 7번가가 합쳐져 만난 세븐스 에비뉴(Seventh Avenue)와 브로드웨이가 교차하는 일대를 말한다. <br>타임 스퀘어는 브로드웨이의 극장가가 환하게 빛나는 중심지이고, 세계에서 가장 붐비는 보행자용 교차로 중 한 곳이며, 세계 엔터테인먼트 산업의 중심지 로 "세계의 교차로", "우주의 중심", "불야성의 거리" 라는 별명으로도 잘 알려져 있다.<br> Travel + Leisure의 2011년 10월 조사에 따르면 세계의 관광객들이 가장 많이 방문한 명소로, 타임 스퀘어는 매년 3,900만 명 이상의 관광객이 온다고한다.<br> 타임 스퀘어는 매일 약 300만 명 이상의 사람들이 지나가는데, 대부분 관광객이거나 뉴욕 지역에서 업무를 보는 사람들이다.</p>
		                                     <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6044.279178532812!2d-73.98935742342144!3d40.7589544673073!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25855b8fb3083%3A0xa0f9aef176042a5c!2z66-46rWtIOuJtOyalSDsi5zslrTthLAg65SU7Iqk7Yq466a_!5e0!3m2!1sko!2skr!4v1552004775153" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		                                     <hr>
		                                     <h3 class="text-secondary text-uppercase mb-0">엠파이어 스테이트 빌딩</h3>
		                                    <img class="img-fluid mb-5" src="img/newyork/newyork2.jpg" alt="">
		                                    <p class="mb-5">미국 뉴욕주 뉴욕 시 맨해튼 섬 5번가와 34블록의 모퉁이에 있는, 1931년에 지어진 울워스 고딕 양식의 건물이다.<br> 지상 102층에 높이는 381m이며 1953년에 설치된 안테나 탑을 포함할 경우 443m이다.<br> 86층의 콘크리트건물 위의 16층짜리 철탑은 본래 비행선의 계류탑을 목적으로 만들어졌으나 바람이 심해 비행선 정박이 위험하다는 이유로 거의 사용되지 않았으며 현재는 전망대와 방송용 안테나만이 위치해있다. <br>또한 영화 킹콩에서 킹콩이 안테나 탑에서 벌이는 장면으로도 유명하다. <br>엠파이어 스테이트 빌딩에는 73개의 엘리베이터가 있으며 모두 합친 길이는 무려 11km나 된다. <br>또한 102층까지 1,860개의 계단이 있으며 6,500개의 창문이 있다. 건물에는 약 940개의 회사와 약 20,000명의 사람들이 일하고 있다.<br> 세계 무역 센터가 지어지기 전에는 세계에서 가장 높은 건물이었다.<br> 9.11 테러로 세계 무역 센터가 붕괴되고 나서는 다시 뉴욕시에서 가장 높은 건물이 되었다.<br> 이 빌딩을 정점(頂點)으로 하는 마천루군은 20세기 전반(前半) 뉴욕의 비즈니스 기능의 집중을 단적으로 대변해 주는 상징이다.</p>
		                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3022.6127817794277!2d-73.98795218463391!3d40.74854517932792!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c259a9aeb1c6b5%3A0x35b1cfbc89a6097f!2z7Jeg7YyM7J207Ja0IOyKpO2FjOydtO2KuCDruYzrlKkgTmV3IFlvcmssIE5ZIDEwMDAxIOuvuOq1rQ!5e0!3m2!1sko!2skr!4v1552004791411" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>                                    
		                                    <hr>
		                                    <h3 class="text-secondary text-uppercase mb-0">자유의 여신상</h3>
		                                    <img class="img-fluid mb-5" src="img/newyork/newyork3.jpg" alt="">
		                                    <p class="mb-5">자유의 여신상이라는 이름으로 더 잘 알려져 있는 세계를 밝히는 자유는 프랑스가 19세기 말에 미국의 독립 100주년을 축하하기 위해 제작한 구리 조각상으로 미국 뉴욕주 뉴욕의 리버티 섬에 있다.<br>미국과 프랑스 국민들 간의 친목을 기념하고, 미국의 독립 100주년을 기념하기 위해 프랑스 국민들의 모금 운동으로 증정되었으며, 1886년에 완공되었다.<br> 미국의 자유와 민주주의의 상징이자 19세기 이후 끊이지 않고 세계 각지에서 유입된 이민자에게 신천지의 상징이 되기도 했다.<br> 1984년에는 유네스코 세계문화유산에 등록되었다.</p>
		                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3025.306387423316!2d-74.04668908463576!3d40.68924937933435!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25090129c363d%3A0x40c6a5770d25022b!2z7Iqk7YWM7LiEIOyYpOu4jCDrpqzrsoTti7Ag6rWt6rCA6riw64WQ66y8!5e0!3m2!1sko!2skr!4v1552004813406" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		                                    <hr>
		                                    <h3 class="text-secondary text-uppercase mb-0">센트럴 파크</h3>
		                                    <img class="img-fluid mb-5" src="img/newyork/newyork4.jpg" alt="">
		                                    <p class="mb-5">미국 뉴욕주 뉴욕 맨해튼에 있는 도시 중심부의 공원이다. <br>해마다 2,500만 명의 관광객이 이곳을 찾으며 미국 전역을 통틀어 가장 많은 사람이 찾는 공원으로 꼽힌다. <br>뿐만 아니라 영화나 TV 프로그램에 등장하는 공원의 모습은 전 세계적으로 센트럴 파크를 유명 장소가 되는 데 일조하였다.<br> 공원 전체의 관할은 개인 비영리단체인 센트럴 파크 관리위(the Central Park Conservancy)에서 담당하며 뉴욕시와 함께 관리한다.</p>
		                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3021.052284850754!2d-73.96754378463282!3d40.78286467932421!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c2589a018531e3%3A0xb9df1f7387a94119!2z7IS87Yq465-0IO2MjO2BrA!5e0!3m2!1sko!2skr!4v1552004839597" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		                                    <hr>
		                                    <h3 class="text-secondary text-uppercase mb-0">메트로폴리탄 미술관</h3>
		                                    <img class="img-fluid mb-5" src="img/newyork/newyork5.jpg" alt="">
		                                    <p class="mb-5">메트로폴리탄 미술 박물관은 미국 뉴욕주 뉴욕 맨해튼 어퍼 이스트 사이드에 있는 세계적인 미술관이다.<br>1866년에 파리에서 미국 독립기념일을 축하하기 위해 모인 미국인들의 회합에서 설립이 제안되어, 1870년에 소규모로 개관하였다.<br> 1880년에 지금의 자리로 이전하였으며, 기금을 통한 구입과 기증 등으로 소장 미술품은 급증하게 되었다.<br> 지금은 회화와 조각, 사진, 공예품 등 300여만 점이 소장되어 있다.</p>
		                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d12084.209203353712!2d-73.97410986349018!3d40.78286432783461!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25896f660c26f%3A0x3b2fa4f4b6c6a1fa!2sThe+Metropolitan+Museum+of+Art!5e0!3m2!1sko!2skr!4v1552004933975" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		                                    <hr>
		                                    <h3 class="text-secondary text-uppercase mb-0">브루클린 교</h3>
		                                    <img class="img-fluid mb-5" src="img/newyork/newyork6.jpg" alt="">
		                                    <p class="mb-5">1869년 착공하여 1883년 완공하였으며 당시 총 길이 5,989피트(약 1.8km)의 다리로 완공 당시 세계에서 가장 긴 현수교임과 동시에 가장 높은 곳은 1,595피트로 뉴욕 시에서 가장 높은 건축물이었다.<br> 또한 최초로 철 케이블을 사용하여 19세기의 중요한 기계 공학 업적 중 하나로 꼽힌다.<br> 현재 뉴욕의 매우 중요한 교통로이자 관광지, 건축물 중 하나. 원래 뉴욕에선 안 중요한 걸 찾는 게 더 힘들겠지만 현수교이며, 미국에서 가장 오래된 다리이기도 하다.</p>
		                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3024.5544491638875!2d-73.99816223463516!3d40.70580937933266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25a2343ce7b2b%3A0x2526ddba7abd465c!2z67iM66Oo7YG066awIOq1kA!5e0!3m2!1sko!2skr!4v1552004951895" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		                                    <hr>
		                                    <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#">
		                                      <i class="fa fa-close"></i>
		                                      Close</a>
		                                  </div>
		                                </div>
		                              </div>
		                            </div>
		                          </div>
		                        
		                          <!-- Portfolio Modal 2 -->
		                          <div class="portfolio-modal mfp-hide" id="portfolio-modal-2">
		                            <div class="portfolio-modal-dialog bg-white">
		                              <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
		                                <i class="fa fa-3x fa-times"></i>
		                              </a>
		                              <div class="container text-center">
		                                <div class="row">
		                                  <div class="col-lg-8 mx-auto">
		                                    <h2 class="text-secondary text-uppercase mb-0">LA</h2>
		                                    <hr class="star-dark mb-5">
		                                    <hr>
		                                    <h3 class="text-secondary text-uppercase mb-0">할리우드 사인</h3>
		                                    <img class="img-fluid mb-5" src="img/LA/la1.jpg" alt="">
		                                    <p class="mb-5"> 할리우드 사인(Hollywood Sign)은 미국 캘리포니아주 로스앤젤레스의 산타모니카 산맥(Santa Monica Mountains)의 리 산(Mount Lee) 일각에 있는 할리우드힐스 지역에 설치된 유명한 랜드마크이다. <br>이 사인은 1923년 야외 광고로 설치되었다.</p>
		                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3302.481506157901!2d-118.3238652348265!3d34.13402133058382!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2bf0a45505a7d%3A0xabb7acc626709843!2z7ZWg66as7Jqw65Oc7IKs7J24!5e0!3m2!1sko!2skr!4v1552004969694" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		                                    <hr>
		                                    <h3 class="text-secondary text-uppercase mb-0">할리우드 워크 오브 페임</h3>
		                                    <img class="img-fluid mb-5" src="img/LA/la2.jpg" alt="">
		                                    <p class="mb-5"> 할리우드 명예의 거리(Hollywood Walk of Fame)는 미국 캘리포니아주 할리우드에 있는 유명한 보도이다.<br> 할리우드 대로부터 바인 스트리트까지 이어진다.<br> 엔터테인먼트 업계에서 활약한 인물의 이름이 새겨진 2,000개 이상의 별 모양의 플레이트가 묻어져 있으며, 유명한 관광지가 되고 있다.<br> 매년 별의 수는 증가하고 있으며, 추가하는 행사에는 본인도 참여한다.<br>1959년 할리우드 상공회의소에 의해 설립되었다. <br>처음 반년 만에 1,500개 이상의 별이 입성하였으며, 1994년에 2,000개를 넘어섰다. <br>현재는 매년 6월에, 영화, 텔레비전, 음악, 라디오, 연극 5개 분야에서 활약한 인물을 대상으로 20명 정도의 후보가 일반 투표에 의해 선정된다.</p>
		                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3303.7451305209916!2d-118.33586518482736!3d34.10166908059245!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2bf3b59bb205f%3A0x85775770084cf53e!2z7ZWg66as7Jqw65OcIOybjO2BrCDsmKTruIwg7Y6Y7J6E!5e0!3m2!1sko!2skr!4v1552004984199" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		                                    <hr>
		                                    <h3 class="text-secondary text-uppercase mb-0">유니버셜 스튜디오 할리우드</h3>
		                                    <img class="img-fluid mb-5" src="img/LA/la3.jpg" alt="">
		                                    <p class="mb-5"> 미국 캘리포니아주 로스엔젤레스에 위치한 테마파크.<br> 1964년 7월 15일에 개장하였으며 170만 평방미터의 면적을 자랑하는 세계 최대의 영화 및 TV 촬영 스튜디오이자 테마파크로 세계에서 두 번째로 오래된 유니버설 스튜디오 산하의 대표적인 테마파크이다.<br>유니버설 스튜디오의 인기 작품들을 어트랙션등으로 구현해 놓은 것이 이 테마파크의 특징.<br>유니버설 스튜디오 자체가 캘리포니아에 있는 만큼, 실제 영화 촬영이나 유니버설 스튜디오의 모회사인 NBC 에서 촬영할 때 썼던 세트장을 관람할 수 있게 해 놓았다. <br>롤러코스터 위주의 테마파크가 아닌, 4D라이드와 같이 영화의 장면을 느낄 수 있게 만들어 놓은 것이 특징이다.<br> 롤러코스터를 즐기고 싶다면 근처에 있는 식스 플래그 매직 마운틴을 가는것이 더 낫다. </p>
		                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3302.3214696922446!2d-118.35556698482638!3d34.138116780582756!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2be4f253238cf%3A0xd3dd5027799c9a71!2z7Jyg64uI67KE7ISk7Iqk7Yqc65SU7Jik7ZWg66as7Jqw65Oc!5e0!3m2!1sko!2skr!4v1552005001527" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		                                    <hr>
		                                    <h3 class="text-secondary text-uppercase mb-0">그리피스 공원</h3>
		                                    <img class="img-fluid mb-5" src="img/LA/la4.jpg" alt="">
		                                    <p class="mb-5"> 국 캘리포니아 주 로스앤젤레스의 로스 펠리스 위치한 시립공원이다.<br> 1896년에 개장하였으며 총 면적은 17 km²이다.<br> 샌 디에고(San Diego)의 미션트레일보호구역(Mission Trails Preserve)에 이어 캘리포니아 주에서 두 번째로 면적이 넓은 공원이며, 미국의 대도시에 위치한 도심공원 중에서는 규모가 가장 크다.<br> 공원 내에 그리피스 천문대(Griffith Observatory)와 로스앤젤레스 동물원(Los Angeles Zoo), 그릭 시어터(Greek Theater) 등이 위치한다.<br> 승마, 골프, 테니스 등을 즐길 수 있는 스포츠 시설이 있으며, 산책로와 자전거 도로가 있어 로스앤젤레스 주민의 도심 여가 시설로 이용되고 있다. </p>
		                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3302.38252504061!2d-118.29638868482647!3d34.13655438058311!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2c08d21749ff7%3A0x4731b4ee89bae4aa!2z6re466as7ZS87IqkIOqzteybkA!5e0!3m2!1sko!2skr!4v1552005020897" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		                                    <hr>
		                                    <h3 class="text-secondary text-uppercase mb-0">TCL 차이나 시어터</h3>
		                                    <img class="img-fluid mb-5" src="img/LA/la5.jpg" alt="">
		                                    <p class="mb-5"> 영화를 관람하는 사람보다 극장 앞에서 좋아하는 배우의 손도장에 맞춰 사진을 찍는 사람들이 더 많은 곳.<br> 돌비 극장과 더불어 할리우드를 대표하는 건물이기도 하다.<br> 최신 영화를 가장 먼저 상영하기도 하며, 영화 행사가 종종 열리기 때문에 운이 좋으면 할리우드 배우도 만날 수 있다.<br> 홈페이지에서 미리 배우들의 손도장 위치를 찾을 수 있으니 참고하자. <br>처음 명칭은 맨즈 차이니즈 극장이었으나, TCL 차이니즈 극장으로 명칭이 변경 되었다.</p>
		                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3303.7313095766526!2d-118.34315988482733!3d34.10202308059239!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80dcd7da01c280c3%3A0xf73982db60c65ffb!2zVENMIOywqOydtOuLiOymiCDsi5zslrTthLA!5e0!3m2!1sko!2skr!4v1552005040069" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		                                    <hr>
		                                    <h3 class="text-secondary text-uppercase mb-0">산타모니카 해변</h3>
		                                    <img class="img-fluid mb-5" src="img/LA/la6.jpg" alt="">
		                                    <p class="mb-5"> 미국 캘리포니아 로스앤젤레스 카운티 서부에 위치한 해안 휴양 도시다.<br> 태평양을 면하고 있으며, 산타 모니카 만에 들어서 있다.<br> 웨스트 LA와 Mar Vista가 동쪽에, 그리고 Venice가 남쪽에 위치한다.<br>로스앤젤레스 카운티에 속해있으며 로스앤젤레스 시에 둘러싸여 있지만, 베벌리힐스나 컬버 시티와 같이 로스앤젤레스 시와는 별개의 시이다.<br> 그래서 이 쪽으로 우편을 보낼때 도시 이름을 로스엔젤레스 대신에 산타 모니카라고 표기한다.<br>도시 이름은 서방 교회의 4대 교회학자 가운데 한 사람인 히포의 아우구스티누스의 어머니 성 모니카의 이름을 따서 지어진게 유래.<br> 의외로 '산타 모나카'라고 알고 있는 사람들이 많다. </p>
		                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d13229.40783392955!2d-118.50638326660498!3d34.00917558988087!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80c2a4d753e7d5f1%3A0x1730c10394bec38!2z7IOM7YOA66qo64uI7Lm0IOu5hOy5mA!5e0!3m2!1sko!2skr!4v1552005056528" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		                                    <hr>
		                                    <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#">
		                                      <i class="fa fa-close"></i>
		                                      Close</a>
		                                  </div>
		                                </div>
		                              </div>
		                            </div>
		                          </div>
		                        
		                          <!-- Portfolio Modal 3 -->
		                          <div class="portfolio-modal mfp-hide" id="portfolio-modal-3">
		                            <div class="portfolio-modal-dialog bg-white">
		                              <a class="close-button d-none d-md-block portfolio-modal-dismiss" href="#">
		                                <i class="fa fa-3x fa-times"></i>
		                              </a>
		                              <div class="container text-center">
		                                <div class="row">
		                                  <div class="col-lg-8 mx-auto">
		                                    <h2 class="text-secondary text-uppercase mb-0">HAWAII</h2>
		                                    <hr class="star-dark mb-5">
		                                    <hr>
		                                    <h3 class="text-secondary text-uppercase mb-0">호놀룰루</h3>
		                                    <img class="img-fluid mb-5" src="img/hawai/hawai1.jpg" alt="">
		                                    <p class="mb-5">하와이 왕국의 초대 국왕 카메하메하 1세가 호놀룰루에서 1803년부터 1811년까지 살았다.<br> 1845년에 하와이 왕국의 정식 수도가 되었으며, 1900년에 하와이가 미국 영토가 되었을 때 수도로 남아있었다.<br> 1907년에 하와이 시와 군청이 설립되었고, 1959년 하와이가 미국의 50번째 주로 승격되었을 때 주도가 되었다.<br>관광 산업은 호놀룰루 수입의 주요 근원이다. <br>매년 약 100만명의 관광객이 호놀룰루를 방문하고 있으며, 대다수의 관광객이 와이키키 해변 지역에 머무르고 있다. <br>호놀룰루의 방문객들은 아름다운 경치와 놀이 시설, 온화한 기후를 만족한다.</p>
		                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d118930.2250059676!2d-157.86911351877114!3d21.32801929605101!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x7c00183b8cc3464d%3A0x4b28f55ff3a7976c!2z66-46rWtIO2VmOyZgOydtCDtmLjrhoDro7Dro6g!5e0!3m2!1sko!2skr!4v1552005074260" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		                                    <hr>
		                                    <h3 class="text-secondary text-uppercase mb-0">다이아몬드헤드</h3>
		                                    <img class="img-fluid mb-5" src="img/hawai/hawai2.jpg" alt="">
		                                    <p class="mb-5">하와이 하이킹의 대표주자이자 화산분화구였던 이곳은 정상에서 와이키키와 호놀룰루시 전경을 한 눈에 볼 수 있는 인기 관광지이다.<br>다이아몬드 헤드산이라 불린 이유는 항해하다 들어오면 산이 반짝거리는 것처럼 보이기 때문이다.<br>꼭대기에 올라가기까지 약 40분정도 소요되며, 험하지 않기 때문에 누구나 오를 수 있어 인기가 좋다.<br> 편한 차림과 운동화, 틈틈히 마실 물은 필수, 하와이에 왔다면 한번쯤 반드시 다이아몬드 헤드를 정복해보자!</p>
		                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d118930.2250059676!2d-157.86911351877114!3d21.32801929605101!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x7c0072619ae2ab3f%3A0xf7fe4029c4a94f59!2z64uk7J207JWE66qs65Oc7Zek65OcIOyCsA!5e0!3m2!1sko!2skr!4v1552005088886" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		                                    <hr>
		                                    <h3 class="text-secondary text-uppercase mb-0">하와이 화산 국립공원</h3>
		                                    <img class="img-fluid mb-5" src="img/hawai/hawai3.jpg" alt="">
		                                    <p class="mb-5">미국 하와이 제도의 하와이 섬에 있는 킬라우에아 산, 순상화산인 마우나로아 산에 있는 국립공원으로, 주로 킬라우에아 산이 많이 차지한다.<br> 킬라우에아 산은 정상에 박물관이 있고, 용암을 직접 볼 수 있도록 해주고, 사람들이 용암을 분출하는 모습이나 용암이 바다로 흘러들어가는 것을 볼 수 있게 해준다.<br> 마우나로아 산은 등산하여 정상에 있는 칼데라를 보여준다. <br>킬라우에아 산과 마우나로아 산은 서로 붙어있기 때문에 마우나로아 산도 해당된다.<br> 이 둘중에 킬라우에아 산은 세계 최대의 활화산이라고 한다. <br>정상에 지름 6km의 거대한 칼데라가 있고, 그 안에 있는 대형 화구인 할레마우마우 분화구를 직접 관찰할 수 있다.</p>
		                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d481970.61303037475!2d-155.7159244907361!3d19.308640701183904!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x795161b6c0b9c9b1%3A0x3e5b7b263c84ae26!2sHawai%CA%BBi+Volcanoes+National+Park!5e0!3m2!1sko!2skr!4v1552005132891" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		                                    <hr>
		                                    <h3 class="text-secondary text-uppercase mb-0">진주만</h3>
		                                    <img class="img-fluid mb-5" src="img/hawai/hawai4.jpg" alt="">
		                                    <p class="mb-5">진주만은 미국 하와이주 오아후 섬,<br> 호놀룰루의 서쪽에 위치한 만으로, 미국의 태평양함대 사령부가 여기에 있다.<br> 미국 정부는 1887년에 이곳에서 선박을 위한 수리 및 석탄 공급소를<br> 유지보수할 예외적인 이용권을 취득하였다.<br> 1941년 12월 7일 일본제국의 진주만 공격은 미국이 제2차 세계 대전에 참전하는 즉각적인 이유가 되었다.</p>
		                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d59454.23021667964!2d-158.01183502618042!3d21.354857770465276!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x7c006569de4312db%3A0xd77a90edb572a52d!2z7Y6EIO2VrQ!5e0!3m2!1sko!2skr!4v1552005154072" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		                                    <hr>
		                                    <h3 class="text-secondary text-uppercase mb-0">와이메아 캐년 주립공원</h3>
		                                    <img class="img-fluid mb-5" src="img/hawai/hawai5.jpg" alt="">
		                                    <p class="mb-5">"태평양의 그랜드 캐니언"이라고 불리는 카우아이 웨스트 사이드의 캐니언 애리조나의 사촌만큼 크거나 오래되지는 않지만, 하와이에서 이만큼 놀라운 지형을 감상할 수 있는 곳은 없다.<br> 길이 22km, 넓이 1.6km, 깊이 1km 이상의 이 캐니언은 와이메아 캐니언 전망대에서 그 험준한 바위산과 깊은 골짜기, 돌출된 언덕을 파노라마로 만나볼 수 있다.<br>주요 도로인 와이메아 캐니언 드라이브는 아랫쪽 전망대와 주요 와이메아 캐니언 전망대로 이어져, 카우아이의 극적인 내륙의 광경을 감상할 수 있다. <br>이 길은 산으로 이어져 코케에 국립공원에서 끝난다. 초보자와 상급자 산악인의 마음에 모두 쏙 드는 산길이 많이 있다.</p>
		                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d29574.58870554694!2d-159.6932306232564!3d22.094553167558264!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x7c06555527af99f9%3A0x9f5bd265abc54f33!2z7JmA7J2066mU7JWEIOy6kOuFhCDso7zrpr3qs7Xsm5A!5e0!3m2!1sko!2skr!4v1552005173923" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		                                    <hr>
		                                    <h3 class="text-secondary text-uppercase mb-0">마우나케아 산</h3>
		                                    <img class="img-fluid mb-5" src="img/hawai/hawai6.jpg" alt="">
		                                    <p class="mb-5">마우나케아 산(Mauna Kea)은 하와이 북동부에 위치한 휴화산으로서, 하와이 제도의 최고봉이다.<br>높이는 4,205m이며, 해저 부분을 포함한 전체 높이는 10,203m에 달한다.<br> 이 높이는 에베레스트 산을 훌쩍 뛰어넘는 높이다.<br> 물론 현재 산 높이에 대한 기준은 해발고도를 기준으로 하기에 세계 최고봉은 에베레스트가 맞다.<br>세계 각국에서 이곳에 천문대를 운영하고 있다.</p>
		                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15013.827742503658!2d-155.47684837153207!3d19.82060993664009!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x7953bd819bc89e11%3A0xf9159b9c95991c20!2z66eI7Jqw64KY7LyA7JWEIOyCsA!5e0!3m2!1sko!2skr!4v1552005191983" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
		                                    <hr>
		                                    <a class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss" href="#">
		                                      <i class="fa fa-close"></i>
		                                      Close</a>
								          </div>
								        </div>
								      </div>
								    </div>
								  </div>
         						</div>
							</article>
						</div>
					</div>

					<!-- Sidebar -->
						<div id="sidebar" class="col-4 col-12-medium" style="flex: auto;">
						
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
													<a href="UserDetailCtlr?id=<%=user.getId() %>"><font size="2" color="black">내 정보 보기</font></a>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="1_4Logout.jsp"><font size="2" color="black">로그아웃</font></a>
												</article>
										</li>
										<li>
											<!-- Excerpt -->
												<article class="box excerpt">
													<header>
														<span class="date">환율 차트 뿌려주자</span>
														<h4><a href="#">Exchange rate</a></h4>
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

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

<!-- Contact Form JavaScript -->
<script src="js/jqBootstrapValidation.js"></script>
<script src="js/contact_me.js"></script>

<!-- Custom scripts for this template -->
<script src="js/freelancer.min.js"></script>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>

<script type="text/javascript">
function openSkyS() {
	window.open("https://www.skyscanner.co.kr/?ksh_id=_k_Cj0KCQiAtvPjBRDPARIsAJfZz0rlc5Nr_PqnGIkjyDBuew7pBjJnRwxq4Yx8UZIYwTSf03dZyXW3YZkaAq_fEALw_wcB_k_&associateID=SEM_GGT_00065_00021&utm_source=google&utm_medium=cpc&utm_campaign=KR-Travel-Search-Brand-Exact&utm_term=%EC%8A%A4%EC%B9%B4%EC%9D%B4%EC%8A%A4%EC%BA%90%EB%84%88&kpid=google_438310576_23048128696_331009635267_aud-326758276298:kwd-51820162295_c_&gclid=Cj0KCQiAtvPjBRDPARIsAJfZz0rlc5Nr_PqnGIkjyDBuew7pBjJnRwxq4Yx8UZIYwTSf03dZyXW3YZkaAq_fEALw_wcB")
}
</script>

<script type="text/javascript">
var NY_to = document.getElementById("NWea").value;
var NY_toMin = document.getElementById("NWeaMin").value;
var NY_toMax = document.getElementById("NWeaMax").value;
NY_to = Number(NY_to);
NY_toMin = Number(NY_toMin);
NY_toMax = Number(NY_toMax);

var LA_to =document.getElementById("LWea").value;
var LA_toMin = document.getElementById("LWeaMin").value;
var LA_toMax = document.getElementById("LWeaMax").value;
LA_to = Number(LA_to);
LA_toMin = Number(LA_toMin);
LA_toMax = Number(LA_toMax);

var HWI_to =document.getElementById("HWea").value;
var HWI_toMin = document.getElementById("HweaMin").value;
var HWI_toMax = document.getElementById("HweaMax").value;
HWI_to = Number(HWI_to);
HWI_toMin = Number(HWI_toMin);
HWI_toMax = Number(HWI_toMax);

Highcharts.chart('container', {
    chart: {
        type: 'line'
    },
    title: {
        text: '미국의 날씨'
    },
    subtitle: {
        text: 'Triplan'
    },
    xAxis: {
        categories: ['최저 기온','현재 기온','최고 기온']
    },
    yAxis: {
        title: {
            text: 'Temperature (°C)'
        }
    },
    plotOptions: {
        line: {
            dataLabels: {
                enabled: true
            },
            enableMouseTracking: false
        }
    },
    series: [{
        name: 'Newyork',
        data: [NY_toMin, NY_to, NY_toMax]
    }, {
        name: 'L.A',
        data: [LA_toMin, LA_to, LA_toMax]
    },{
       name:'Hawai',
        data:[HWI_toMin, HWI_to, HWI_toMax]
    }]
});
</script>


</body>
</html>
