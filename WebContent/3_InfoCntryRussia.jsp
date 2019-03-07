<%@page import="Weather.R_W_S_mm"%>
<%@page import="Weather.R_W_M_mm"%>
<%@page import="Weather.R_W_V_mm"%>
<%@page import="Weather.R_Weather"%>
<%@page import="Exchange.R_manager"%>
<%@page import="Exchange.R_Exchange"%>
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
List<Exchange.R_Exchange> list = R_manager.getExchange();

String jsonEx = "";

for(Exchange.R_Exchange jex : list){
   jsonEx += jex.getR_spt();
}


jsonEx += "";

System.out.println(jsonEx);

request.setAttribute("jsonEx", jsonEx); 

%>
<%
List<R_Weather> list2 = R_W_V_mm.getWeather();
List<R_Weather> list3 = R_W_M_mm.getWeather();
List<R_Weather> list4 = R_W_S_mm.getWeather();

String jsonWt = "";

for(R_Weather Rvwt : list2){
   jsonWt += "블&nbsp;라&nbsp;디&nbsp;보&nbsp;스&nbsp;톡 : "+ Rvwt.getR_spt() + "℃"+"<br>";
}
for(R_Weather Rmwt : list3){
   jsonWt += "모&nbsp;&nbsp;&nbsp;&nbsp;스&nbsp;&nbsp;&nbsp;&nbsp;크&nbsp;&nbsp;&nbsp;&nbsp;바 : "+ Rmwt.getR_spt() + "℃"+"<br>";
}
for(R_Weather Rswt : list4){
   jsonWt += "상트페테르부르크 : "+ Rswt.getR_spt() + "℃";
}

jsonWt += "";

System.out.println(jsonWt);

request.setAttribute("jsonWt", jsonWt);


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
										      <a class="navbar-brand js-scroll-trigger" href="#page-top">RUSSIA</a>
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
										      <img class="img-fluid mb-5 d-block mx-auto" src="img/russia.jpg" style="margin-bottom: 0em !important;">
										      <font size="15" color="darkgray"><strong>RUSSIA</strong></font>
								      			<h3 class="font-weight-light mb-0" style="font-family: sans-serif;">The Country of Snow</h3>
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
										            <img class="img-fluid" src="img/Vladivostok/vlad.jpg" alt="">
										          </a>
										          <font size="6" color="lightgray" style="font-family: fantasy;">VLADIVOSTOK</font>
										        </div>
										        <div class="col-md-6 col-lg-4 text-center">
										          <a class="portfolio-item d-block mx-auto" href="#portfolio-modal-2" style="margin-bottom: 0.5em;">
										            <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
										              <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
										                <i class="fas fa-search-plus fa-3x"></i>
										              </div>
										            </div>
										            <img class="img-fluid" src="img/Moscow/moscow.jpg" alt="">
										          </a>
										          <font size="6" color="lightgray" style="font-family: fantasy;">MOSCOW</font>
										        </div>
										        <div class="col-md-6 col-lg-4 text-center">
										          <a class="portfolio-item d-block mx-auto" href="#portfolio-modal-3" style="margin-bottom: 0.5em;">
										            <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
										              <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
										                <i class="fas fa-search-plus fa-3x"></i>
										              </div>
										            </div>
										            <img class="img-fluid" src="img/Saint/saint.jpg" alt="">
										          </a>
										          <font size="6" color="lightgray" style="font-family: fantasy;">SAINT PETERSBURG</font>
										        </div>
										      </div>
										    </div>
										  </section>
										
										  <!-- About Section -->
										  <section class="bg-primary text-white mb-0" id="about" style="background-color: white !important;">
										    <div class="container" style="background-color: white;">
										      <h2 class="text-center text-uppercase text-white"><font color="lightblue">Exchange</font></h2>
										      <div class="text-center" style="text-align: center;">
								        		<div class="col-lg-4 ml-auto" style="margin-left: 16em !important;"> 
										          <p class="lead text-uppercase text-lightgray text-center">
										          	<font color="gray" style="text-align: center;">
										          	1₽ = <%=request.getAttribute("jsonEx") %> 원
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
										             <h3 class="text-center text-uppercase text-black" ><%=request.getAttribute("jsonWt") %></h3>
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
										            <h2 class="text-secondary text-uppercase mb-0">VLADIVOSTOK</h2>
										            <hr class="star-dark mb-5">
										            <h3 class="text-secondary text-uppercase mb-0">독수리 전망대</h3>
										            <img class="img-fluid mb-5" src="img/Vladivostok/vlad1.jpg" alt="">
										            <p class="mb-5">금각교와 바다가 한눈에 내려다보이는 언덕 위 전망대.<br> 블라디보스토크 하면 떠오르는 바로 그 풍경을 바라볼 수 있는 곳이다.<br> 214m로 높지 않은 곳이지만, 블라디보스토크 시내에서는 가장 높은 곳!<br> 전망대에는 러시아 키릴 문자를 창제한 키릴 형제 동상도 위치해 있다. <br>낮에는 낮대로, 밤에는 밤대로 언제 찾아와도 탁 트인 시원한 전망을 바라볼 수 있는 곳.<br> 다만, 바람이 강하게 부는 편이니 유의하자.<br>푸니쿨라를 타고 방문할 수 있지만 내려서 5분 정도 걸어야 한다. <br>전망대에 갈 때는 택시를 이용하고, 내려올 때 푸니쿨라를 탑승하는 걸 추천.</p>
										            <h3 class="text-secondary text-uppercase mb-0">프리모르스키 아쿠아리움</h3>
										            <img class="img-fluid mb-5" src="img/Vladivostok/vlad2.jpg" alt="">
										            <p class="mb-5">2016년 개장한 러시아 최대의 아쿠아리움.<br> 러시아에 제대로 된 수족관이 없다는 사실을 안 푸틴 대통령의 지시로 만들어졌다고 한다.<br> 다른 아쿠아리움과 달리 이곳은 수중 생물 전시뿐만 아니라<br> 교육적인 자료가 많아 아이들과 함께 방문하기 좋다.<br> 내부는 해양 생물 진화관, 러시아 수역관, 세계 수역관 등 크게 3개 구역으로 나뉜다.<br> 또한 매일 두 차례 열리는 공연 또한 놓치지 말아야 할 볼거리.<br> 한국에서 보기 힘든 돌고래 쇼, 벨루가 쇼, 바다코끼리 쇼를 관람할 수 있다.</p>
										            <h3 class="text-secondary text-uppercase mb-0">아르바트 거리</h3>
										            <img class="img-fluid mb-5" src="img/Vladivostok/vlad3.jpg" alt="">
										            <p class="mb-5">블라디보스토크를 대표하는 아르바트 거리.<br> 해양 공원과 이어지는 보행자 전용 도로로, 길 끝으로 너머다 보이는 바다가 아름답다.<br> 알록달록, 아기자기한 건물들을 보면 정말 유럽에 온 듯한 분위기!<br> 주변으로 관광지와 맛집이 모여 있어 여행 중 꼭 들를 수밖에 없는 곳이다.<br> 길 중간중간에 분수와 벤치가 있어 쉬었다 가기도 좋다. <br>블라디보스토크 여행의 이정표와도 같은 곳.</p>
										            <h3 class="text-secondary text-uppercase mb-0">중앙 광장</h3>
										            <img class="img-fluid mb-5" src="img/Vladivostok/vlad4.jpg" alt="">
										            <p class="mb-5">블라디보스토크 시내 중심에 위치한 커다란 광장.<br> 러시아 혁명을 위해 목숨 바쳤던 병사들의 추모탑이 위치해 있어 혁명 광장으로도 불린다.<br> 중요 국경일 행사가 개최되는 광장으로, 시민들의 휴식처 역할도 톡톡히 하는 곳. <br>중앙 광장 서쪽으로는 연해주 정부 청사가 위치해 있다. <br>날이 풀리면 매주 금, 토요일에 주말 장터가 열리니 놓치지 말자.</p>
										            <h3 class="text-secondary text-uppercase mb-0">포크롭스키 성당 & 공원</h3>
										            <img class="img-fluid mb-5" src="img/Vladivostok/vlad5.jpg" alt="">
										            <p class="mb-5">블라디보스토크를 대표하는 러시아 정교회 성당. <br>20세기 초 마을 묘지에 건립되었으나 1935년 파괴되었다가 2007년 재건축되었다. <br>러시아에서만 볼 수 있는 독특한 건축 양식과 내부의 성화가 볼거리다.<br> 성당 내부로 들어갈 때는 모자를 벗고, 여성은 입구에 마련돼 있는 머플러를 둘러야 한다.<br> 성당 뒤편으로 포크롭스키 공원이 위치해 있다.</p>
										            <h3 class="text-secondary text-uppercase mb-0">해양 공원</h3>
										            <img class="img-fluid mb-5" src="img/Vladivostok/vlad6.jpg" alt="">
										            <p class="mb-5">아르바트 거리와 이어지는 해안 산책로.<br>여름에는 해수욕을 즐기는 사람들을, 겨울에는 꽁꽁 얼어 붙은 바다를 감상할 수 있다.<br> 내부에는 관람차가 있는 작은 놀이동산도 위치해 있다.<br> 해양 공원 북쪽으로 킹크랩과 곰새우를 맛볼 수 있는 크랩 마켓과 작은 아쿠아리움이 있다.<br> 한국 방송에서 나온 수동 VR 체험은 자동보다 더 실감 나는 강추 체험거리니 놓치지 말자!</p>
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
										            <h2 class="text-secondary text-uppercase mb-0">MOSCOW</h2>
										            <hr class="star-dark mb-5">
										            <h3 class="text-secondary text-uppercase mb-0">크렘린</h3>
										            <img class="img-fluid mb-5" src="img/Moscow/moscow1.jpg" alt="">
										            <p class="mb-5">러시아어로 ‘성채’를 뜻하며, 러시아의 수도이기도 한 모스크바의 중심을 흐르는 모스크바 강가에 있는 옛 러시아 제국 시절의 궁전이었다.<br> 모스크바 말고도 노브고로드, 니즈니노브고로드, 카잔, 아스트라한에도 크렘린이 있지만,<br> 일반적으로 모스크바에 있는 크렘린을 가리키는 경우가 많다.<br>러시아의 수도인 모스크바의 중심지에 위치한 크렘린 궁전은 <br>행정구역 및 관람구역 등 2개의 구역으로 나누어져 있다.<br> 행정구역은 대통령의 사무실, 상원의원들의 사무실 등<br> 러시아의 주요 기관들이 사용하고 있기 때문에 관람객이 들어갈 수 없다.<br> 나머지 관람구역을 크렘린 국립역사문화박물관으로 부른다. <br>이 구역에는 성당, 정원, 궁전, 전시장, 야외 전시품 등이 있다.</p>
										            <h3 class="text-secondary text-uppercase mb-0">붉은 광장</h3>
										            <img class="img-fluid mb-5" src="img/Moscow/moscow2.jpg" alt="">
										            <p class="mb-5">모스크바의 중심부에 있으며 크렘린과 성 바실리 성당,<br> 굼 백화점, 국립역사박물관에 둘러싸인 직사각형의 광장이다.<br> 주로 통하는 입구는 바실리 성당 맞은편인 부활의 문 쪽(마네쥐 광장, 지하철역 쪽)이지만 일단 광장이기 때문에 진입로는 여러 곳이 있으며 특별히 행사가 있거나 하지 않으면 <br>검문 같은 것도 없이 자유롭게 드나들 수 있다.<br> 옛 소련과 현 러시아를 대표하는 관광 명소.</p>
										            <h3 class="text-secondary text-uppercase mb-0">볼쇼이 극장</h3>
										            <img class="img-fluid mb-5" src="img/Moscow/moscow3.jpg" alt="">
										            <p class="mb-5">볼쇼이는 러시아어로 '크다'는 뜻이다.<br> 말 그대로 크고 아름다운 극장. <br>근처에는 작은 극장이라는 뜻의 말르이 극장도 있는데,<br> 여긴 크기는 작지만 역사가 가장 오래된 극장이기도 하다.<br>러시아 예술의 정수 중 하나로, 상트페테르부르크의 마린스키 극장과 함께 러시아 양대 오페라 극장이다. <br>여기에 소속된 볼쇼이 발레단 역시 세계 최고로 평가받는다.<br> 유명세에 비하면 관람요금도 한국에 비해 저렴한 편이다.<br> 유명한 공연은 보통 2~3개월 전에 표가 팔리지만 신관의 경우는 쉽게 구해지는 경우도 많다. <br>여름에는 공연이 없는 날이 많으니 참고. <br>주 3회(월수금) 11시경에 러시아어와 영어로 하는 극장 투어 프로그램도 있다.<br>위치는 붉은 광장 입구 맞은편 길 건너쪽이다. <br>바로 옆에 쭘 백화점이 있는데 굼만큼이나 고급진곳으로 유명하다.</p>
										            <h3 class="text-secondary text-uppercase mb-0">굼</h3>
										            <img class="img-fluid mb-5" src="img/Moscow/moscow4.jpg" alt="">
										            <p class="mb-5">러시아어로 종합 백화점이란 뜻으로 굼은 단어의 첫 글자들을 따서 만든 줄임말이다.<br> 소련 시대에는 국영 백화점이었고 소련이 망하고 러시아 시대엔 사실 민영화됐지만 <br>지금도 국영인 줄 아는 사람이 많다.<br> 모스크바의 굼이 압도적으로 유명해서 모스크바에만 있다고 생각할수있지만 러시아 각지에 같은 이름을 가진 상점이 운영되고 있다.</p>
										            <h3 class="text-secondary text-uppercase mb-0">트레티야코프 미술관</h3>
										            <img class="img-fluid mb-5" src="img/Moscow/moscow5.jpg" alt="">
										            <p class="mb-5">러시아의 중요한 미술관 중 하나로 1856년에 개관하여 1892년에 모스크바로 이전, 1918년 국유화되었다.<br> 모스크바의 상인, 파벨 미하일로비치 트레티야코프(1832~98, en:Pavel Mikhailovich Tretyakov)가<br> 예술가들을 후원하면서<br> 수집한 작품들로 시작되어 이후 미술품을 수집하는 일련의 움직임들을 통해<br> 현재 11세기부터 20세기 초반에 작업된 13만점 이상의 예술 작품을 소장하고 있다.</p>
										            <h3 class="text-secondary text-uppercase mb-0">노보데비치 수도원</h3>
										            <img class="img-fluid mb-5" src="img/Moscow/moscow6.jpg" alt="">
										            <p class="mb-5">이반 4세의 아버지 바실리 3세가 고대 도시 스몰렌스크를 점령한 기념으로 1524년에 세웠다.<br> 여자수도원(수녀원)으로 지어졌지만 크렘린을 지키는 요새 역할도 수행했다.<br> 보리스 고두노프가 차르로 추대된 곳이며 표트르 대제가<br> 이복 누나 소피아와 첫째 부인을 가두었던 곳으로 유명하다.<br> 또한 이 수도원 연못에서 헤엄치는 백조를 본 차이코프스키가 백조의 호수를 작곡했다고 알려져 있다.<br> 소련 시대에는 박물관이었다가 지금은 다시 러시아 정교 성당이 됐다. <br>모스크바 강변에 있으며 경치가 좋아 사람들이 많이 찾는다.<br> 해 질 무렵 호수 건너편에서 바라보는 게 가장 유명하다.<br>묘지가 딸려 있는데 안톤 체호프, 니콜라이 고골, 드미트리 쇼스타코비치,<br> 니키타 흐루쇼프, 보리스 옐친,레프 란다우등 <br>러시아의 역사적 유명인들이 다수 안장되어 있다.</p>
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
										            <h2 class="text-secondary text-uppercase mb-0">SAINT PETERSBURG</h2>
										            <hr class="star-dark mb-5">
										            <h3 class="text-secondary text-uppercase mb-0">에르미타시 미술관</h3>
										            <img class="img-fluid mb-5" src="img/Saint/saint1.jpg" alt="">
										            <p class="mb-5">에르미타시 미술관은 상트페테르부르크에 있는 미술관으로, 정식명칭은 국립 에르미타시 미술관이다.<br> 영국의 대영 박물관과 프랑스의 루브르 박물관과 더불어 세계 3대 박물관에 손꼽힌다<br>세계 3대 박물관 가운데 하나라는 명성에 걸맞게 전 세계 예술품을 골고루 소장한 에르미타시는<br> 바로크 스타일의 기품있는 궁전으로 제정 러시아 황제의 거처였던 겨울 궁전과 <br>네 개의 건물이 통로로 연결되어 있다.<br> 이 궁전은 원래 이처럼 방대하지 않았지만 표트르 대제가 후계자를 정하지 못하고 죽은 후<br> 러시아 황실과 귀족들의 피비린내 나는 당파 싸움 끝에 제위에 오른 표트르 대제의 딸 Jason이<br> 오늘날의 겨울 궁전을 건설했다고 한다.</p>
										            <h3 class="text-secondary text-uppercase mb-0">페테르고프 궁</h3>
										            <img class="img-fluid mb-5" src="img/Saint/saint2.jpg" alt="">
										            <p class="mb-5">페테르고프궁은 러시아 상트페테르부르크의 페테르고프에 위치한 궁전이다. <br>분수, 소규모 폭포, 정원으로 유명한 궁전으로서 "러시아의 베르사유궁"이라는 별칭으로 부르기도 한다.<br>1714년부터 1723년 사이에 러시아 제국의 표트르 1세 황제에 의해<br> 바로크 건축 양식을 띤 황제의 여름 관저로 건립되었다.<br> 제2차 세계 대전이 진행 중이던 1941년부터 1944년까지는 <br>독일 군대에 점령되면서 파괴되었지만 나중에 재건되었다.<br>궁전 주변에 위치한 소규모 폭포는 <br>프랑스의 루이 14세 국왕에 의해 건립된 마를리궁을 본떠서 건립되었다. <br>소규모 폭포 안에는 삼손 조각상과 64개의 분수가 설치되어 있다.<br> 궁전 하단부에는 17세기 프랑스의 정원 양식을 본뜬 소규모 정원이 들어서 있다.<br> 유네스코 세계유산으로 등재된 상트페테르부르크 역사 지구의 일부를 형성한다.</p>
										            <h3 class="text-secondary text-uppercase mb-0">피의 구원 사원</h3>
										            <img class="img-fluid mb-5" src="img/Saint/saint3.jpg" alt="">
										            <p class="mb-5">피의 구원 사원 또는 피흘리신 구세주 교회는<br> 러시아 상트페테르부르크에 위치한 그리스도의 부활, 구세주의 부활을 의미하는 피가 있는 교회를 뜻한다.<br> 그리스도의 부활을 의미하는 동방정교회 기념관이며, <br>1881년 3월 부상당해 죽은 황제인 알렉산더 2세의 피가 묻어있는 장소이다.<br>공식 명칭은 그리스도 부활 성당이다.<br> 러시아 상트페테르부르크에 위치한 성당으로 관광 명소 중의 하나이기도 하다. </p>
										            <h3 class="text-secondary text-uppercase mb-0">마린스키 극장</h3>
										            <img class="img-fluid mb-5" src="img/Saint/saint4.jpg" alt="">
										            <p class="mb-5">마린스키 극장은 러시아 상트페테르부르크의 역사적인 오페라,<br> 발레 극장으로 러시아에서 모스크바의 볼쇼이 극장과 비교되는 세계 최정상급 오페라 발레극장이다.<br> 과거의 이름은 “황실 마린스키 극장”(1860년 ~ 1920년)<br> 러시아 혁명 이후 “국립 오페라와 발레 아카데미”(1920년 ~ 1935년)<br> 세르게이 키로프의 이름을 따서 “키로프 오페라와 발레 아키데미 극장”(약칭 키로프 극장)이라 불렸다.(1935년 ~ 1992년)<br> 마린스키 극장의 이름은 알렉산드르 2세의 부인이던<br> 마리아 알렉산드로프나 황후의 이름을 따서 지어졌다.<br> 1988년 유리 테미르카노프의 은퇴 이후, <br>세계적으로 유명한 지휘자인 발레리 게르기예프가 <br>음악 감독으로 재직 중이다.</p>
										            <h3 class="text-secondary text-uppercase mb-0">페트로파블롭스크 요새</h3>
										            <img class="img-fluid mb-5" src="img/Saint/saint5.jpg" alt="">
										            <p class="mb-5">페트로파블롭스크 요새는 러시아 상트페테르부르크의 네바 강변에 위치한 요새로,<br> 스웨덴 해군의 공격으로부터 도시를 방어하기 위해 표트르 1세에 의해 지어졌다.<br> 요새를 짓기 전에는 주변에 습지가 많아 사람이 별로 살지 않았는데,<br> 이 요새를 짓는 것을 계기로 상트페테르부르크가 건설되기 시작했다.<br>1703년 5월 16일 네바 강의 '자야치'라는 작은 섬에 짓기 시작하여 1년 만에 완성하였고,<br> 1706년과 1740년에 돌로 다시 지어졌다.<br> 요새 안에 위치한 페트로파블롭스크 성당은 1712년부터 1733년까지 지어졌는데<br> 123.2m의 높은 종탑을 가지고 있다.<br>약 1720년부터는 수비대의 주둔지와 귀족 및 정치범의 수용소로 이용되었고,<br> 러시아의 표트르 1세부터 알렉산드르 3세까지의 황제가 매장되어 있다.</p>
										            <h3 class="text-secondary text-uppercase mb-0">성 이삭 성당</h3>
										            <img class="img-fluid mb-5" src="img/Saint/saint6.jpg" alt="">
										            <p class="mb-5">성 이사악 성당은 러시아 상트페테르부르크에 위치한 러시아 정교회의 성당으로<br> 지어질 당시에는 러시아에서 가장 큰 규모로 지어졌다.<br> 높이 101.52m, 성당의 둥근 천장이 21.83m, 길이가 11.2m, 폭이 97.6m인<br> 이 성당은 64~114톤에 이르는 72개의 거대한 원형의 돌들로 둘러싸고 있다.<br> 1만 4천명을 수용할 수 있다.<br> 원래 명칭은 ‘이사악키이예프스키 사보르’이다. <br>그것은 아브라함의 아들 이사악이 아니라 달마티아의 성 이사악이라는<br> 정교회 성인의 이름에서 따온 것이다. <br>달마티아의 성 이사악의 축일은 5월 30일인데<br> 바로 그 날이 표트르 대제의 생일이기 때문이다.<br> 웅장한 금빛의 둥근 지붕이 특징인 <br>성 이삭 성당은 현재 박물관으로 이용되고 있다.<br> 제정시대 교회의 막강한 권력을 상징하듯<br> 높이도 고층빌딩만해서 먼 곳에서도 잘 보인다.<br> 내부에는 중앙에 있는 카를 브리쵸프의 작품을 비롯하여 <br>성경의 내용과 성인들을 묘사한 예술가들의 그림이 많이 그려져 있다.<br> 그밖에도 수백점의 동상과 부조가 있다.</p>
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


</body>
</html>
