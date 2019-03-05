<%@page import="Exchange.U_manager"%>
<%@page import="Exchange.U_Exchange"%>
<%@page import="Exchange.j_manager"%>
<%@page import="Exchange.J_Exchange"%>
<%@page import="java.util.List"%>
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
<%
//엔화
/* List<Exchange.J_Exchange> list = j_manager.getExchange();

String jsonEx = "[";

for(Exchange.J_Exchange jex : list){
	jsonEx += "현재 일본환율:" + jex.getSpt() + ",";
}

jsonEx = jsonEx.substring(0, jsonEx.lastIndexOf(","));

jsonEx += "]";

System.out.println(jsonEx);

request.setAttribute("jsonEx", jsonEx); */
%>
<%
//달러
/* List<U_Exchange> list2 = U_manager.getExchanges();

String UsonEx = "[";

for(U_Exchange uex : list2){
	jsonEx += "현재 일본환율:" + uex.getSpt() + ",";
}

UsonEx = UsonEx.substring(0, UsonEx.lastIndexOf(","));

UsonEx += "]";

System.out.println(UsonEx);

request.setAttribute("UsonEx", UsonEx);
 */
%>
<!DOCTYPE HTML>
<html>
<head>
	<title>MainPage</title>
	<meta charset="utf-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link rel="stylesheet" href="assets/css/main.css">
</head>
<body class="homepage is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">
			<div class="container">
				<!-- Logo : Logo 를 누르면 MainPage 로 이동하게 만들기 -->
				<h1 id="logo"><a href="#">TRIP</a></h1>
				<p>Take a Trip to Anywhere you want to go</p>
				
				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a class="icon fa-home" href="#"><span>About Us</span></a></li>
						<li>
							<a href="#" class="icon fa-sitemap"><span>나라 정보</span></a>
							<ul>
								<li>									
									<a href="3_Usa.jsp">미국</a>								
								</li>
								<li>
									<a href="3_Rusia.jsp">일본</a>
										
								</li>
								<li>
									<a href="3_vietnam.jsp">베트남</a>
										
								</li>
								<li>
									<a href="3_Rusia.jsp">러시아</a>
									
								</li>
							</ul>
						</li>
						<!-- class="icon fa-bar-chart-o" -->
						<li><a class="icon fa-sitemap" href="#"><span>여행 후기</span></a></li>
						<li><a class="icon fa-retweet" href="#"><span>여행 자료</span></a></li>
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
						<div id="content" class="col-8 col-12-medium">
							<!-- Post -->
								<article class="box post">
									<div id="infoCntry">
										<%-- <jsp:include page="3_Usa.jsp"></jsp:include> --%>
									</div>
								</article>
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
														<h3>My Information</h3>
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
														<span class="date"><%=request.getAttribute("jsonEx") %></span>
											<%-- 			<span class="date"><%=request.getAttribute("UsonEx") %></span>  --%>
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
					<h2>Request or comments? <strong>Get in touch:</strong></h2>
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
	
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>

<!-- <script type="text/javascript">

$(function name() {
	$("#gotoUSA").click(function name() {
		alert("aaa");
	});
	
});


</script> -->



</body>
</html>
