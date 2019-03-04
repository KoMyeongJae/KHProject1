<%@page import="Weather.V_W_Ho_mm"%>
<%@page import="Weather.V_W_Ha_mm"%>
<%@page import="Weather.V_W_D_mm"%>
<%@page import="Weather.V_Wether"%>
<%@page import="Exchange.V_manager"%>
<%@page import="Exchange.V_Exchange"%>
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
List<Exchange.V_Exchange> list = V_manager.getExchange();

String jsonEx = "";

for(Exchange.V_Exchange jex : list){
   jsonEx += jex.getV_spt();
}


jsonEx += "";

System.out.println(jsonEx);

request.setAttribute("jsonEx", jsonEx); 
%>
<% 
List<V_Wether> list2 = V_W_D_mm.getWeather();
List<V_Wether> list3 = V_W_Ha_mm.getWeather();
List<V_Wether> list4 = V_W_Ho_mm.getWeather();

String jsonWt = "";

for(V_Wether Vdwt : list2){
   jsonWt += "다&nbsp;&nbsp;&nbsp;낭 : "+ Vdwt.getV_spt() + "℃"+"<br>";
}
for(V_Wether VHawt : list3){
   jsonWt += "하노이 : "+ VHawt.getV_spt() + "℃"+"<br>";
}
for(V_Wether VHowt : list4){
   jsonWt += "호치민 : "+ VHowt.getV_spt() + "℃"+"<br>";
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
									      <a class="navbar-brand js-scroll-trigger" href="#page-top">VIETNAM</a>
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
									  <header class="bg-img text-black text-center" >
									    <div class="container">
									      <img class="img-fluid mb-5 d-block mx-auto" src="img/Vietnam.png" style="margin-bottom: 0em !important;">
									      <font size="15" color="darkgray"><strong>VIETNAM</strong></font>
								      <h3 class="font-weight-light mb-0" style="font-family: sans-serif;">The Country of Sunshine</h3>
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
									            <img class="img-fluid" src="img/danang/danang.jpg" alt="">
									          </a>
									          <font size="6" color="lightgray" style="font-family: fantasy;">DANANG</font>
									        </div>
									        <div class="col-md-6 col-lg-4 text-center">
									          <a class="portfolio-item d-block mx-auto" href="#portfolio-modal-2" style="margin-bottom: 0.5em;">
									            <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
									              <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
									                <i class="fas fa-search-plus fa-3x"></i>
									              </div>
									            </div>
									            <img class="img-fluid" src="img/hanoi/hanoi.jpg" alt="">
									          </a>
									          <font size="6" color="lightgray" style="font-family: fantasy;">HANOI</font>
									        </div>
									        <div class="col-md-6 col-lg-4 text-center">
									          <a class="portfolio-item d-block mx-auto" href="#portfolio-modal-3" style="margin-bottom: 0.5em;">
									            <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
									              <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
									                <i class="fas fa-search-plus fa-3x"></i>
									              </div>
									            </div>
									            <img class="img-fluid" src="img/hochimihn/hochimihn.jpg" alt="">
									          </a>
									          <font size="6" color="lightgray" style="font-family: fantasy;">HOCHIMIHN</font>
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
								          	100₫ = <%=request.getAttribute("jsonEx") %> 원
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
									            <h2 class="text-secondary text-uppercase mb-0">DANANG</h2>
									            <hr class="star-dark mb-5">
									            <h3 class="text-secondary text-uppercase mb-0">오행산</h3>
									            <img class="img-fluid mb-5" src="img/danang/danang1.jpg" alt="">
									            <p class="mb-5">다낭에서 호이안으로 가는 길, 논느억 해변 근처에 위치한 오행산. <br>석회암으로 이루어진 산답게 영어로는 마블 마운틴(Marble Mountain)이라 불린다.<br>평지에 5개의 산이 볼록 솟아나 있는데, 동양에서 세상을 구성하는 다섯 요소인 목(木), 화(火), 토(土), 금(金), 수(水)의 이름을 따서 오행산이라 칭한다.<br> 이 중에 많은 여행자들이 방문하는 곳은 수산(水山)으로, 엘리베이터를 이용해 오를 수 있다.<br>수산에 오르면 여러 사원과 전망대가 있는데, 가장 큰 규모를 자랑하는 현공 동굴과 주변을 한눈에 전망할 수 있는 망강대를 놓치지 말자.<br> 전망대에 오르면 소박한 다낭 시내가 내려다보이는데, 저 멀리 논느억 해변까지 볼 수 있어 아름다운 풍광을 즐길 수 있다.<br> 수산을 둘러보고 내려오면서 주차장 옆에 위치한 암부 동굴도 들러 보자.<br> 사후 세계를 묘사하고 있는 곳으로, 계단이 많아 편한 신발을 신고 가는 게 좋다.</p>
									            <h3 class="text-secondary text-uppercase mb-0">호이안</h3>
									            <img class="img-fluid mb-5" src="img/danang/danang2.jpg" alt="">
									            <p class="mb-5">다낭 여행에서 빠질 수 없는 근교 여행지, 호이안. <br>16~17세기 해양 실크로드의 주요 항구 도시였던 호이안은 무역 도시로 발전하였다. <br>당시에 머물던 중국, 일본 상인들의 지구가 형성되어 있으며 거리 곳곳에 건축물들이 남아 있다.<br> 19세기 무렵 다낭으로 무역항이 이전하면서 그 명성은 넘겨주었지만, 시간이 멈춘 듯한 도심의 멋스러움과 클래식함이 여행자들의 발길을 이끈다.</p>
									             <h3 class="text-secondary text-uppercase mb-0">한 시장</h3>
									            <img class="img-fluid mb-5" src="img/danang/danang3.jpg" alt="">
									            <p class="mb-5">1940년대부터 형성된 다낭에서 가장 오래된 재래시장. <br>2층 규모의 대형 시장으로 베트남에서 유명한 건어물을 비롯해<br> 건과일, 꽃, 의류 등 다양한 품목을 판매한다.<br> 없는 것이 없고, 물건 값이 저렴하기로 유명해서 많은 사람들이 찾는다. <br>오래된 시장인 만큼 깔끔하고 쾌적한 분위기를 기대하기보다는 현지 분위기를 느껴볼 겸 한 번쯤 방문해 보면 좋다.</p>
									             <h3 class="text-secondary text-uppercase mb-0">다낭 대성당</h3>
									            <img class="img-fluid mb-5" src="img/danang/danang6.jpg" alt="">
									            <p class="mb-5">시내의 중심에 위치한 다낭 대성당.<br>1923년 프랑스 식민 지배 당시 건축된 가톨릭 성당이다. <br>연분홍빛 외관과 70m 높이의 찌를 듯한 첨탑이 인상적이다. <br>탑 꼭대기에는 수탉 모양의 풍향계가 있는데, 이 때문에 현지인들에게는 수탉 교회로 잘 알려져 있다.<br> 아기자기한 성당 뜰에 있는 성모마리아 상이 유명하며, <br>아름다운 성당으로 인해 사진 촬영 명소로도 인기가 높다.</p>
									             <h3 class="text-secondary text-uppercase mb-0">아시아파크</h3>
									            <img class="img-fluid mb-5" src="img/danang/danang5.jpg" alt="">
									            <p class="mb-5">바나 힐과 같은 선 그룹에서 운영하는 작은 규모의 놀이공원.<br> 시내 중심가에서 택시로 10분이면 도착할 수 있을 만큼 접근성이 좋다. <br>2014년에 개장해 시설, 환경이 깔끔하며 중국풍의 웅장한 건물과 화려한 조명이 돋보인다. <br>우리나라 놀이공원처럼 스릴 넘치는 놀이기구는 없지만 가족끼리 다 함께 즐기기 좋으며, <br>멋진 데이트 장소로도 손색이 없다.<br> 다낭 시내 어디에서나 볼 수 있는 대관람차 선 휠은 세계에서 4번째로 높은 관람차.<br> 선 휠에 올라서면 아시아 파크는 물론, 시내를 한눈에 내려다볼 수 있어 인기 만점이다.<br> 연인과는 로맨틱한 시간을, 친구, 가족과는 두고두고 기억될 만한 추억의 순간을 이곳에서 만들어 보자.</p>
									             <h3 class="text-secondary text-uppercase mb-0">용교</h3>
									            <img class="img-fluid mb-5" src="img/danang/danang4.jpg" alt="">
									            <p class="mb-5">다낭의 랜드마크이자 명물로 자리 잡은 용교는 2013년 3월 세워졌다. <br>용의 몸을 형상화한 다리 모양이 특이한 데다 밤이 되면 화려한 LED 조명으로 인기가 높다.<br> 걸어서 다리를 건널 수도 있고, 용교 머리 쪽에는 사랑의 부두가 있어 함께 둘러보기 좋다.<br> 주말 저녁에는 용의 머리에서 불을 뿜어내는 퍼포먼스도 펼쳐진다.</p>
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
									            <h2 class="text-secondary text-uppercase mb-0">HANOI</h2>
									            <hr class="star-dark mb-5">
									            <h3 class="text-secondary text-uppercase mb-0">구시가</h3>
									            <img class="img-fluid mb-5" src="img/hanoi/hanoi1.jpg" alt="">
									            <p class="mb-5">하노이 구시가는 쩐 왕조 때부터 이어져 내려온 상업촌으로,<br> 다양한 상품을 판매하던 거리가 현재까지 이어지고 있다.<br> 생선, 대나무, 소금 등 판매하는 물품이 그대로 거리 이름에 반영되었다.<br> 수십 개의 작은 골목으로 이루어져 있어 36거리, 여행자 거리라고도 불린다.<br> 호안끼엠 호수 북쪽에 위치하였으며, 저렴한 호텔과 여행사들이 많아 가히 배낭여행자들의 천국이라 할 수 있다. 낮에는 북적이는 거리에서 현지인들의 삶을 그대로 느낄 수 있고, 밤에는 맥주 거리, 야시장 등 활기참으로 가득한 곳! 하노이에서 진짜 베트남을 경험하고 싶다면 구시가로 발걸음을 옮겨 보자.</p>
									            <h3 class="text-secondary text-uppercase mb-0">동쑤언 시장</h3>
									            <img class="img-fluid mb-5" src="img/hanoi/hanoi2.jpg" alt="">
									            <p class="mb-5">구시가 내에 위치한 대규모 재래시장. <br>베트남 북부 최대의 시장으로 실내로 이루어져 있다.<br> 3층 규모의 건물 내부에는 먹거리, 의류, 생활용품, 기념품 등 없는 게 없을 정도. <br>하노이를 여행하며 필요한 게 있다면 구경도 하고, 겸사겸사 들렀다 가기 좋다.<br> 시장 앞에 노점이 빽빽이 늘어서 있어 활기찬 분위기를 느낄 수 있다.</p>
									            <h3 class="text-secondary text-uppercase mb-0">하롱베이</h3>
									            <img class="img-fluid mb-5" src="img/hanoi/hanoi3.jpg" alt="">
									            <p class="mb-5">파란 하늘 아래, 바다의 숲이라 불리는 베트남 최고의 경승지 하롱베이.<br> 유네스코 세계 자연 유산에 등록된 아름다운 여행지다.<br> 하롱(下龍)의 지명 유래는 '하늘에서 내려온 용이 베트남을 지켜 내고, 용이 내뿜은 여의주가 땅에 떨어져 오늘날 기암의 모습이 되었다'고 한다.<br> 영롱한 비취색 바다 위에 2,000여 개의 크고 작은 섬들이 파도를 막아 마치 잔잔한 호수 같다.</p>
									            <h3 class="text-secondary text-uppercase mb-0">야시장</h3>
									            <img class="img-fluid mb-5" src="img/hanoi/hanoi4.jpg" alt="">
									            <p class="mb-5">호안끼엠 호수 북쪽의 항 다오 거리에서부터 동쑤언 시장까지 이어지는 야시장.<br> 금요일부터 일요일까지, 주말 저녁에만 문을 여는 노점 형태의 시장이다.<br> 동쑤언 시장을 야외로 옮겨 놓은 듯한 분위기로,<br> 의류부터 조명등, 액세서리, 기념품, 길거리 음식까지 모든 게 준비되어 있다. <br>종류는 다양하지만 예상 외로 살 만한 것들은 많이 없는 편.<br> 야시장의 활기찬 분위기를 즐기며 가볍게 둘러보자.</p>
									            <h3 class="text-secondary text-uppercase mb-0">주석궁&호치민 관저</h3>
									            <img class="img-fluid mb-5" src="img/hanoi/hanoi5.jpg" alt="">
									            <p class="mb-5">호치민 묘소 뒤편에 자리한 주석궁과 호치민 관저.<br> 호치민이 국가주석으로 재임했을 당시 공무를 수행하고 일상생활을 영위했던 곳이다.<br> 주석궁은 프랑스 양식으로 지어졌으며, 프랑스 식민 지배기에는 총독부 건물로 사용되었다.<br> 정원이 잘 가꿔져 있어 산책하기 좋으며, 노란색 외관은 부를 상징한다.<br> 내부 입장은 불가하며 외부에서만 관람할 수 있다.<br> 호치민의 검소한 성품을 가늠해 볼 수 있는 곳이다. <br>간단한 한국어 안내문이 비치되어 있으니 참고해 보자.</p>
									            <h3 class="text-secondary text-uppercase mb-0">호안끼엠 호수</h3>
									            <img class="img-fluid mb-5" src="img/hanoi/hanoi6jpg.jpg" alt="">
									            <p class="mb-5">하노이 도심에 위치한 작은 호수로 하노이 여행의 이정표 역할을 하는 곳이다. <br>주요 여행지 및 맛집은 모두 호안끼엠 호수 주변에 위치해 있으므로,<br> 이곳을 중심으로 길을 찾으면 편리하다.<br> 호수 북쪽에는 응옥선 사당이 위치해 있으며, 주변으로 조경이 잘 조성돼 있어 산책을 즐기기 좋다.<br> 하노이에서 시클로를 타고 싶다면 호안끼엠 호수 북쪽의 수상 인형 극장 맞은편으로 가 보자.<br> 대기 중인 시클로가 많으므로 가격을 확인한 후 적당히 흥정을 해서 탑승하자.</p>
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
									            <h2 class="text-secondary text-uppercase mb-0">HOCHIMIHN</h2>
									            <hr class="star-dark mb-5">
									            <h3 class="text-secondary text-uppercase mb-0">벤탄 야시장</h3>
									            <img class="img-fluid mb-5" src="img/hochimihn/hochimihn1.jpg" alt="">
									            <p class="mb-5">벤탄 시장이 문을 닫으면 매일 저녁마다 건물 양옆으로 노점상이 열린다. <br>각종 이미테이션 제품에서부터 의류, 신발, 먹거리까지 다양한 상품을 판매한다.<br> 물건을 구입할 때는 비싸게 부르는 편이므로 적당히 흥정을 해서 구입하자.<br> 야시장만의 구경하는 재미가 있긴 하지만 사실 벤탄 시장이 볼거리가 더 많은 편이다.</p>
									            <h3 class="text-secondary text-uppercase mb-0">여행자 거리</h3>
									            <img class="img-fluid mb-5" src="img/hochimihn/hochimihn2.jpg" alt="">
									            <p class="mb-5">음식점, 게스트 하우스, 여행사 등이 즐비한 여행자 거리.<br> 데탐 거리에서부터 부이 비엔 중심까지, 골목 사이사이 가게들로 가득하다. <br>로컬 스타일과 백패커의 문화가 혼재된 자유로운 분위기다.<br> 시원한 맥주 한잔과 함께 호기롭게 호치민의 밤을 보내고 싶다면 여행자 거리로!<br> 단, 복잡한 거리에는 펍에서 나오는 음악 소리, 시끄러운 오토바이 소리까지 더해져 정신이 하나도 없다.<br> 주말 저녁(19:00~02:00)이면 부이 비엔은 차 없는 거리로, 오토바이를 포함한 모든 차량이 통제되니 항상 안전하게 즐기고 소지품을 잘 챙기자.</p>
									            <h3 class="text-secondary text-uppercase mb-0">인민위원회 청사</h3>
									            <img class="img-fluid mb-5" src="img/hochimihn/hochimihn3.jpg" alt="">
									            <p class="mb-5">1901~1908년 프랑스 식민 지배기에 지어진 시청사로 고풍스러운 외관이 특징이다. <br>호치민에 남아 있는 콜로니얼 건축물 중 가장 아름답다는 평가를 받는다.<br> 1975년 베트남 통일 이후 호치민 시 인민위원회로 사용되고 있다. <br>청사 앞으로는 호치민 동상이 반갑게 맞아주고 있다. <br>내부 관람은 불가하지만 청사 앞쪽으로 드넓은 광장이 있어 저녁이면 많은 시민들이 찾는다.<br>조명이 들어오는 밤이면 더욱 멋스럽다.</p>
									            <h3 class="text-secondary text-uppercase mb-0">요정의 샘</h3>
									            <img class="img-fluid mb-5" src="img/hochimihn/hochimihn4.jpg" alt="">
									            <p class="mb-5">소위 동양의 그랜드 캐년이라고 불리는 요정의 샘.<br> 이름에서 주는 아기자기한 느낌과 달리 실제로는 협곡이다.<br> 자연 지형 그대로 남아 있어 입장료도 따로 받지 않지만 입구에서 호객 행위가 극성인 편.<br> 그랜드 캐년과 비교하기 무색할만큼 작은 규모지만, 발바닥을 겨우 적실만큼 낮은 깊이의 물이 길처럼 흐르고 그 옆의 붉은 흙과 작은 규모의 협곡을 바라보며 맨발로 산책하는 느낌은 잊지 못할 것이다.<br> 계속 맨발로 다녀야 하니 가볍게 신고, 입고 갈 것을 추천한다.</p>
									            <h3 class="text-secondary text-uppercase mb-0">사이공 센터</h3>
									            <img class="img-fluid mb-5" src="img/hochimihn/hochimihn5.jpg" alt="">
									            <p class="mb-5">호치민 중심가에서 가장 크고 세련된 쇼핑센터.<br>B2층~L6층까지 구성되어 있으며, 다양한 매장이 입점해 있다.<br>B2층과 L5층에서는 각종 프랜차이즈, 브런치, 베이커리, 디저트를 맛볼 수 있다.<br> 일본계 백화점인 다카시마야와 연결돼 있어 다양한 상품군을 만나볼 수 있는 것이 장점.<br> 시내를 돌아다니다 더위에 지칠 때쯤 잠시 들러 휴식을 취하기 좋은 곳이다.</p>
									            <h3 class="text-secondary text-uppercase mb-0">레드 샌드 듄</h3>
									            <img class="img-fluid mb-5" src="img/hochimihn/hochimihn6.jpg" alt="">
									            <p class="mb-5">화이트 샌드 듄과 함께 무이네를 대표하는 해안 사구. <br>붉은 빛의 모래가 석양과 잘 어울려 많은 여행자들이 일몰을 보러 방문한다. <br>양초를 슥슥 바른 간이 썰매를 타고 모래 언덕을 내려가는 모래 썰매도 체험할 수 있는 곳! <br>모래 썰매는 한 번 대여하면 무제한으로 탈 수 있지만, 타는 걸 도와주며 팁을 요구하기도 하니 유의하자.</p>
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
														<span class="date">뭘 또 뿌려줄까나</span>
														<h4><a href="#">Whatever you want</a></h4>
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




</body>
</html>
