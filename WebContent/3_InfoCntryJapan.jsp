<%@page import="Weather.J_W_T_mm"%>
<%@page import="Weather.J_W_F_mm"%>
<%@page import="Weather.J_W_O_mm"%>
<%@page import="Weather.J_weather_osaka"%>
<%@page import="Exchange.j_manager"%>
<%@page import="Exchange.J_Exchange"%>
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
List<Exchange.J_Exchange> list = j_manager.getExchange();

String jsonEx = "";

for(Exchange.J_Exchange jex : list){
   jsonEx += jex.getSpt();
}


jsonEx += "";

System.out.println(jsonEx);

request.setAttribute("jsonEx", jsonEx); 
%>
<%
List<Weather.J_weather_osaka> list2 = J_W_O_mm.getWeather();
List<J_weather_osaka> list3 = J_W_F_mm.getWeather();
List<J_weather_osaka> list4 = J_W_T_mm.getWeather();

String jsonWt = "";

for(J_weather_osaka Jowt : list2){
   jsonWt += "오&nbsp;&nbsp;사&nbsp;카 : " + Jowt.getJW_o_spt() + "℃"+"<br>";
}
for(J_weather_osaka Jtwt : list4){
   jsonWt += "&nbsp;도&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;쿄 : " + Jtwt.getJW_o_spt() + "℃"+"<br>";
}
for(J_weather_osaka Jfwt : list3){
   jsonWt += "후쿠오카 : " + Jfwt.getJW_o_spt() + "℃";
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
									      <a class="navbar-brand js-scroll-trigger" href="#page-top">JAPAN</a>
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
									      <img class="img-fluid mb-5 d-block mx-auto" src="img/japan.jpg" style="margin-bottom: 0em !important;">
									      <font size="15" color="darkgray"><strong>JAPAN</strong></font>
									      <h3 class="font-weight-light mb-0" style="font-family: sans-serif;">The country of cherry blossoms</h3>
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
									            <img class="img-fluid" src="img/portfolio/OSAKA.png" alt="">
									          </a>
									          <font size="6" color="lightgray" style="font-family: fantasy;">OSAKA</font>
									        </div>
									        <div class="col-md-6 col-lg-4 text-center">
									          <a class="portfolio-item d-block mx-auto" href="#portfolio-modal-2" style="margin-bottom: 0.5em;">
									            <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
									              <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
									                <i class="fas fa-search-plus fa-3x"></i>
									              </div>
									            </div>
									            <img class="img-fluid" src="img/portfolio/Tokyo.png" alt="">
									          </a>
									          <font size="6" color="lightgray" style="font-family: fantasy;">TOKYO</font>
									        </div>
									        <div class="col-md-6 col-lg-4 text-center">
									          <a class="portfolio-item d-block mx-auto" href="#portfolio-modal-3" style="margin-bottom: 0.5em;">
									            <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
									              <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
									                <i class="fas fa-search-plus fa-3x"></i>
									              </div>
									            </div>
									            <img class="img-fluid" src="img/portfolio/fukuoka.png" alt="">
									          </a>
									          <font size="6" color="lightgray" style="font-family: fantasy;">FUKUOKA</font>
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
								          	100￥ = <%=request.getAttribute("jsonEx") %> 원
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
									            <h2 class="text-secondary text-uppercase mb-0">OSAKA</h2>
									            <hr class="star-dark mb-5">
									            <p class="mb-5">일본 관광의 중심지 오사카를 소개합니다.</p>
									            <h3 class="text-secondary text-uppercase mb-0">도톤보리</h3>
									            <img class="img-fluid mb-5" src="img/osaka/osaka1.jpg" alt="">
									            <p class="mb-5">에도시대부터 현재에 이르기까지 극장과 음식점들로 번성해 온 오사카 남쪽 지역의 대표적인 번화가</p>
									            <img class="img-fluid mb-5" src="img/osaka/osaka5.jpg" alt="">
									            <p class="mb-5">도톤보리는 좁은 길과 뒷골목을 따라 셀 수 없을 정도로 수 많은 레스토랑과 바들이 즐비해있다.<br> 다채로운 간판과 잘 꾸며진 입구는 눈을 부시게 하는 빛과 디자인의 교향곡을 만들어낸다. <br>이 곳을 방문하는 사람들은 거대한 게와 복어 조형물 그리고 드럼을 연주하는 마네킹, 도톤보리 거리의 레스토랑들이 자랑하는 흥미진진한 간판들을 볼 수 있다.<br> 이 곳에서 쿠이다오레의 진정한 의미를 경험할 수 있으며, 합리적인 가격으로 만족할 때까지 오사카 최고의 맛을 만끽 할 수 있다. <br>그리고 거리의 연주가들과 예술가들을 위한 "나니와워터프론트 극장가"가 현재 강을 따라 건설 중이다.<br> 완성되면 이곳은 도시와 강이 만나는 장소, 좀 더 활기차고 생명력 넘치는 오사카의 심벌로 거듭날 것이다.</p>
									          <h3 class="text-secondary text-uppercase mb-0">글리코 상</h3>
									          <img class="img-fluid mb-5" src="img/osaka/osaka6.jpg" alt="">
									          <p class="mb-5">도톤보리의 상징 글리코 상. <br>1919년 창업자인 에자키 리이치가 굴을 넣고 우려낸 국물에서 체출한 글리코겐을 이용, 그것을 캐러멜 속에 첨가해서 영양 과자 '글리코'를 제작, 1922년 2월 11일 오사카에 위치한 미쓰코시 백화점에서 출시·판매한 것이 시초였다.<br> '글리코'는 에자키 글리코가 출시한 첫 제품이었고 결국 이것이 회사의 애칭으로 자리잡게 된 것이다.<br> 이후 글리코는 '한알에 300미터'라는 캐치프레이즈가 붙여졌으며, 창업주인 에자키 리이치가 "아이들의 먹는 것과 노는 것을 동시에 만족시킨다."는 생각에 따라 조그만 완구를 동봉해 판매하여 일본내에서 대박을 치게 된다.<br> 즉, 식품완구의 원조 되시겠다.<br> 그리고 창업시기가 시기인지라 일제강점기 경성에서 일본 내지제품의 홍수가 쏟아지는 와중 당연히 이 '글리코'를 판매한 적도 있었다.</p>
									         <h3 class="text-secondary text-uppercase mb-0">돈키호테</h3>
									         <img class="img-fluid mb-5" src="img/osaka/osaka7.jpg" alt=""> 
									         <p class="mb-5">도톤보리에서 빠질 수 없는 쇼핑의 성지.<br>일본 최대 할인매장인 '돈키호테'도톤보리점은 오사카 미나미의 랜드마크 중 하나인 '노란 관람차'가 있는 곳이다.<br>. 매장 내에는 생활용품을 비롯한 잡화, 전기전자제품, 의류, 액세서리, 음식점 등 놀이동산에 온 듯한 다양한 쇼핑의 즐거움을 매일 파격적인 가격으로 판매하고 있다.</p>
									         <h3 class="text-secondary text-uppercase mb-0">헵 파이브</h3>
									         <img class="img-fluid mb-5" src="img/osaka/osaka3.jpg" alt="">
									         <p class="mb-5">젊은이들을 위한 전문점들이 있는 복합쇼핑몰인 헵파이브는 키타지역의 상징이다.<br> 지붕 위에는 지상 106 m 높이의 붉은색 관람차가 있고, 관람차의 정상에서는 다운타운과 오사카항의 전경, 그리고 이코마산을 볼 수 있다.<br> 또한 영화관과 레스토랑이 특징인 젊은 세대를 위한 현대풍의 쇼핑복합시설 헵나비오(HEP Navio)가 인접해 있다.</p>
									          <h3 class="text-secondary text-uppercase mb-0">우메다 공중정원</h3>
									          <img class="img-fluid mb-5" src="img/osaka/osaka4.jpg" alt="">
									          <p class="mb-5">이 전망대는 두 개의 우메다 스카이빌딩을 연결하는 다리이며, 360도의 파노라마 전경을 장애물 없이 볼 수 있도록 설계된 도너츠 형태의 지붕이 특징이다. 멋진 광경을 즐기면서 지상 170m에서 부는 바람을 직접 느낄 수 있다.<br>이 전망대에서 낮에는 오사카시내뿐만 아니라 멀리 떨어진 아와지 섬도 볼 수가 있고, 밤에는 화려한 오사카의 야경을 감상할 수 있다.<br> 빌딩 지하에는1920년대 오사카의 전통 이미지를 지닌 타키미코지라는 음식가가 있다.</p>
									          <h3 class="text-secondary text-uppercase mb-0">오사카 유니버셜 스튜디오</h3>
									         <img class="img-fluid mb-5" src="img/osaka/osaka8.jpg" alt="">
									         <p class="mb-5">유니버설 스튜디오 재팬은 여러 유니버설 스튜디오 놀이공원 중 하나로 일본 오사카 시에 있으며, 2001년 3월 31일 토요일에 개장했다.<br> 일본에서 드림랜드 등 다른 테마파크들이 줄줄이 망하는 상황에서도 대형업체가 운영한다는 점으로 말미암아 크나큰 성공을 거둔 테마파크다.<br> 걸어서 5분거리에 유니버설시티역이 있으므로 JR 전철을 타고 가면 편하게 찾아갈 수 있다.<br> 입장료는 세금포함 성인이 7900엔 정도로 한국의 놀이공원에 비해 꽤 비싼편이지만, 어트랙션들이 정말 잘 만들어져있고, 내부에 극장이 5개 정도 있어서 뮤지컬이나 쇼를 볼 수도 있으며, 거의 모든 시설을 공짜로 이용할 수 있기 때문에[9] 막상 들어가보면 입장료가 그리 비싸게 느껴지진 않을 것이다.<br> 다만 파크 내부에서 파는 음식이나 기념품들은 상당히 비싸므로 주의.</p>
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
									            <h2 class="text-secondary text-uppercase mb-0">TOKYO</h2>
									            <hr class="star-dark mb-5">
									             <h3 class="text-secondary text-uppercase mb-0">츠키지 시장</h3>
									            <img class="img-fluid mb-5" src="img/tokyo/tokyo1.jpg" alt="">
									            <p class="mb-5"> 도쿄의 부엌이라고 불리는 쓰키지 시장.<br> 전 세계의 해산물이 모여드는 거대한 시장이다.<br> 쓰키지는 하루 종일 활기가 넘쳐흐르는 곳이지만, 방문은 이른 아침에 할 것.<br> 생선 전문가가 골라주는 신선한 생선으로 요리된 초밥이나 회덮밥을 먹을 수 있다.<br> 배를 채운 뒤에는 산책을 즐기자. <br>전문가용 조리 기구와 일식에 사용되는 음식 재료를 구경하는 것도 재미있다.</p>
									            <h3 class="text-secondary text-uppercase mb-0">긴자</h3>
									            <img class="img-fluid mb-5" src="img/tokyo/tokyo3.jpg" alt="">
									            <p class="mb-5">고급 브랜드 매장과 오랜 전통을 지닌 백화점이 줄지어 늘어선 긴자.<br> 쇼핑가로 유명하지만, 미식가를 만족시키는 초밥과 덴푸라 등의 일류 일식집도 모여 있다.<br> 우선은 긴자의 상징으로 유명한 긴자 4초메 교차로에 자리한 고급 백화점 '와코'로 발걸음을 옮겨보자.</p>
									            <h3 class="text-secondary text-uppercase mb-0">고쿄(황궁)</h3>
									            <img class="img-fluid mb-5" src="img/tokyo/tokyo4.jpg" alt="">
									            <p class="mb-5"> 도쿄 역에서 도보권 내에 있는 고쿄는 천황이 사는 황궁이다. <br>고쿄에 오면 한 바퀴 도는 데 약 5킬로미터 길이의 코스인 성을 둘러싼 해자 주변을 걸어 보자.<br> 여기는 천황이 교토에서 수도를 이전해 오기 전에는 장군이 살았던 '에도 성'이기도 하다.<br> 에도의 정취가 남아 있는 성의 정문과 파수꾼이 보초를 서던 번소, 나카노몬의 터, 주자쿠몬의 터 등의 명소를 바로 가까이에서 볼 수 있다.</p>
									            <h3 class="text-secondary text-uppercase mb-0">우에노와 아사쿠사</h3>
									            <img class="img-fluid mb-5" src="img/tokyo/tokyo5.jpg" alt="">
									            <p class="mb-5"> 우에노와 아사쿠사는 에도 문화를 만끽할 수 있는 인기 관광 지역이다.<br> 아사쿠사에는 도쿄에서 가장 오래된 절인 '센소지'를 비롯해 기념품으로 큰 인기인 식품 모형을 살 수 있는 '갓파바시' 상점가 등 볼거리도 풍성하다.<br> 또한, 우에노에도 곳곳에 사원이 있으며 그 밖에도 서민들의 상점가가 늘어선 '아메요코'도 들러볼 만한 곳이다.</p>
									            <h3 class="text-secondary text-uppercase mb-0">도쿄스카이트리</h3>
									            <img class="img-fluid mb-5" src="img/tokyo/tokyo6.jpg" alt="">
									            <p class="mb-5"> 도쿄의 새로운 랜드마크인 '도쿄스카이트리'는 세계에서 가장 높은 자립식 전파탑이다.<br> 지상 350미터 높이의 경치를 즐길 수 있는 전망 덱과 지상 450미터 높이에 자리한 전망 회랑에서 내다보이는 도쿄의 야경은 그야말로 환상적이다!<br> 튜브형의 유리로 된 복도를 걸어 최고 도달점(451.2미터)에 다다르면 마치 공중을 산책하는 듯한 기분을 맛볼 수 있다.</p>
									            <h3 class="text-secondary text-uppercase mb-0">도쿄 디즈니 랜드</h3>
									            <img class="img-fluid mb-5" src="img/tokyo/tokyo2.jpg" alt="">
									            <p class="mb-5"> 일본 도쿄 근교의 지바현 우라야스 시에 위치한 46만 5천 제곱미터 규모의 테마 파크이다.<br> 미국 이외의 지역에서 건설된 첫 디즈니랜드로, 1983년 4월 15일 개장하였다.<br>도쿄 디즈니 랜드에는 각기 다른 테마로 나뉜 구역이 일곱 개 있고 그것들을 「테마랜드」라고 부른다. <br>각 테마랜드에 배치되는 어트랙션이나 물건 파는 상점, 음식점 및 장식류는 각 테마에 맞춰서 이미지가 통일되게 도모되고 있다. <br>원내의 시설은 어트랙션이외의 설비또한 모두 OCL직영이다.<br> 파크 내에는 숍, 레스토랑, 서비스시설이 다수 존재한다.</p>
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
									            <h2 class="text-secondary text-uppercase mb-0">FUKUOKA</h2>
									            <hr class="star-dark mb-5">
									            <h3 class="text-secondary text-uppercase mb-0">텐진</h3>
									            <img class="img-fluid mb-5" src="img/fukuoka/fukuoka2.jpg" alt="">
									            <p class="mb-5">후쿠오카현의 중심도시인 후쿠오카시 주오구의 지역. <br>후쿠오카 서부의 중심지이자 후쿠오카 최대의 번화가이다. <br>하카타역 일대를 중심으로 한 후쿠오카시 동부 지역의 하카타 도심과 쌍벽을 이루고 있다. <br>天神이라는 이름은 천신(天神)을 모시는 스이쿄텐만구(水鏡天満宮) 사당에서 왔다.<br>쇼핑시설로는 다이마루 백화점, 미츠코시 백화점, 이와타야 백화점, 파르코 백화점, 텐진코어, 빅 카메라, 애플스토어 등이 있다.<br>다이묘거리에는 슈프림, 베이프, 크롬하츠, 나이키, 뉴에라, 스투시 등 스트릿패션의 대가인 브랜드가 포진되있다. </p>
									            <h3 class="text-secondary text-uppercase mb-0">하카타 캐널시티</h3>
									            <img class="img-fluid mb-5" src="img/fukuoka/fukuoka3.jpg" alt="">
									            <p class="mb-5">운하(캐널)를 둘러싸듯 호텔, 공연극장, 영화관, 숍, 레스토랑, 전문매장, 쇼룸<br> 등이 한 곳에 모인 복합상업시설.<br> 매일 열리는 분수 쇼와 이벤트뿐 아니라 쇼핑과 레저 그리고, 맛있는 먹거리 등 이곳에는 언제나 즐거운 시간들이 기다리고 있다.<br>외국 관광객도 많이 방문하는 후쿠오카의 관광지로서 빠질 수 없는 인기 장소다.</p>
									            <h3 class="text-secondary text-uppercase mb-0">후쿠오카 타워</h3>
									            <img class="img-fluid mb-5" src="img/fukuoka/fukuoka4.jpg" alt="">
									            <p class="mb-5">최상층의 전망실은 엘리베이터로 약 70초・높이 123m의 장소에 있으며, 전망실에서 후쿠오카 시의 시가지를 볼 수 있다.<br> 진도 7의 지진이나 풍속 63m에 견딜 수 있는 설계이며, 외관은 8000매의 반투명 유리로 덮인 정삼각기둥의 형상이다. <br>삼각기둥의 상부에는 후쿠오카 시의 마크가 보인다.<br> 시나 운영회사의 프로모션으로서 「미라세일(ミラーセイル)」이라고 하는 별명을 보급하고 싶었던 것 같지만, 「미라세일」이라고 하는 명칭은 별로 알려지지 않고 있다. <br>이 명칭은 새롭게 출발하는 후쿠오카를 범선에 비유되어, 안전한 항해를 기원하는 의미를 담고 있다.<br>7, 8월에는 은하수, 12월에는 크리스마스 트리를 탑신에 조명으로 나타내어 밤하늘을 밝힌다. <br>또, 골든 위크와 체육의 날 전후에는 비상 계단을 일반 개방해, 1층으로부터 전망실까지의 577개의 계단을 올라가는 이벤트가 개최된다. 이 이벤트에 있어서의 최고 속도 도달 3분 18초라고 하는 기록은 2014년 현재 갱신되어 있지 않다.</p>
									            <h3 class="text-secondary text-uppercase mb-0">모모치 해변</h3>
									            <img class="img-fluid mb-5" src="img/fukuoka/fukuoka5.jpg" alt="">
									            <p class="mb-5">후쿠오카(福岡) 타워」의 북쪽에 펼쳐지는 인공 해수욕장의 공원.<br> 「후쿠오카시종합도서관」 「후쿠오카시박물관」 「후쿠오카 야후오쿠! 돔」으로부터도 가까운, 인공모래사장의 중앙에는 「마리존」이 있다.<br> 모래사장에서는 비치 발리볼이나 비치 축구등의 비치 스포츠가 왕성하다.<br> 밤은 해면에 비치는 도회의 야경을 즐길 수 있고, 밤낮 막론하고 후쿠오카시 유수의 인기 데이트 장소이기도 한다.</p>
									            <h3 class="text-secondary text-uppercase mb-0">다자이후 텐만구</h3>
									            <img class="img-fluid mb-5" src="img/fukuoka/fukuoka6.jpg" alt="">
									            <p class="mb-5">다자이후 텐만구는 다자이후시에 있는 신사이다.<br> 다자이후란, 7세기 후반에 큐슈의 치쿠젠 국에 설치된 지방 행정 기관으로, 901년에 좌대신인 후지와라노 토키히라라의  음모로 조정에서 다자이후로 좌천됐고, 그곳에서 숨진 스가와라노 미치자네를 제신으로 모시고 있다.학문・지성・액막이의 신으로서, 연간 700만명의 참배객이 찾고 있다.<br> 학문의 신이어서 수험생에게 인기가 매우 높다. <br>또, 다자이후 텐만구는 과거 아시아 국가와 일본의 문화가 교차한 땅이며, 현재는 아시아권을 중심으로 한 해외 참배자들이 많이 찾는 것으로 유명하다.</p>
									            <h3 class="text-secondary text-uppercase mb-0">유후인</h3>
									            <img class="img-fluid mb-5" src="img/fukuoka/fukuoka7.jpg" alt="">
									            <p class="mb-5">유후인은 더 크고 발전된 온천 도시인 벳푸에서 내륙으로 10km 정도 떨어진 곳에 위치한 온천 마을이다.<br> 유후인에는 미술관과 카페, 부티크가 많아 당일 여행으로 이 도시를 찾는 사람들이 많다.<br>메인 거리에는 대신 카페나 부티크, 소규모 박물관이 들어서 있어서 전통적인 온센 마을보다는 보다 세련된 쇼핑 지구의 분위기를 풍긴다.<br> 물론 온천이 있는 숙박 시설도 많이 있으며 그 중에는 낮 시간에 비투숙객을 상대로 온천을 개방하는 곳도 있다.</p>
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
