<%@page import="dto.PagingBean1"%>
<%@page import="dto.PagingBean"%>
<%@page import="PicBbs.PicBbsDto"%>
<%@page import="java.util.List"%>
<%@page import="PicBbs.PicBbsDao"%>
<%@page import="PicBbs.iPicBbsDao"%>
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
String choice = request.getParameter("choice");
//검색어
String findWord = request.getParameter("findWord");
%>

<!-- 페이징 처리 정보 교환 -->
<%
PagingBean1 paging = new PagingBean1();
if(request.getParameter("nowPage") == null){
	paging.setNowPage(1);	
}else{
	paging.setNowPage(Integer.parseInt(request.getParameter("nowPage")));
}
System.out.println("aaaaaa" + paging.getNowPage());
%>


<%
System.out.println("choice = " + choice);

if(choice == null || choice.equals("")){
	choice = "sel";	
}
if(choice.equals("sel")){
	findWord = "";
}

// 검색어를 지정하지 않았을 경우, 빈 문자열로
if(findWord == null){
	findWord = "";
	choice = "sel";
}
iPicBbsDao dao = PicBbsDao.getInstance();
List<PicBbsDto> list = dao.getPicPagingList(paging, findWord, choice);
%>
<!DOCTYPE HTML>
<html>
<head>
	<title>여행 후기 게시판</title>
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
				
					<!-- 이곳에 리스트를 뿌려줄겁니다 -->
					<div class="content_m">
					<h3>후기 게시판</h3>
					<div>
					<%for(int i = 0; i < list.size(); i++){
						System.out.println("test1:" + list.get(i));
						PicBbsDto dto = list.get(i);
						System.out.println("test2:" + dto.toString());
							if(dto.getDel()==0){
					%>
					<div style="width: 30%; padding: 0em 0 0 0; margin: 0em 1em 0 0; display: inline-block;">
						<table style="border: 1px solid; border-color: lightgray;">
						<col width="50%"><col width="50%">
							<tr style="border-bottom: 1px solid; border-color: lightgray">
								<td colspan="2" height="200px">
								<%-- <a onclick="location.href='PicDetailCtlr?command=detail_view&seq=<%=dto.getSeq() %>'"> --%>
									<a href="1_6PicBbsDetail.jsp?seq=<%=dto.getSeq()%>">
										<%=dto.getFile_name() %>
									</a>
								</td>
							</tr>
							<tr>
								<td colspan="2"><%=dto.getTitle() %> </td>
							</tr>
							<tr>
								<td colspan="2"><%=dto.getWdate() %></td>
							</tr>
							<tr>
								<td>조회수<%=dto.getReadcount() %></td>
								<td>좋아요<%=dto.getLikeit() %></td>
							</tr>
						</table>
					</div>
					<%} 
					}%>
					</div>
					<div align="right">
						<button type="button" onclick="location.href='PicAddCtlr?command=PicAdd_view'">글쓰기</button>
					</div>
					<div>
					<jsp:include page="paging1.jsp">
						<jsp:param name="actionPath" value="1_6PicBbsList.jsp" />
						<jsp:param name="nowPage" value="<%=String.valueOf(paging.getNowPage()) %>" />
						<jsp:param name="totalCount" value="<%=String.valueOf(paging.getTotalCount()) %>" />
						<jsp:param name="countPerPage" value="<%=String.valueOf(paging.getCountPerPage()) %>" />
						<jsp:param name="blockCount" value="<%=String.valueOf(paging.getBlockCount()) %>" />
						
						<jsp:param name="findWord" value="<%=findWord %>" />
						<jsp:param name="choice" value="<%=choice %>" />
					</jsp:include>
					</div>
					<!-- search -->
					<div align="center">
						<select id="choice">
						<option value="sel">선택</option>
						<option value="title">제목</option>
						<option value="writer">작성자</option>
						<option value="content">내용</option>
						</select>
					
						<input type="text" id="search" value="">
						<button name="search" onclick="searchBbs()">검색</button>
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
function searchBbs() {
	var word = document.getElementById("search").value;
	var choice = document.getElementById("choice").value;
	alert("choice = " + choice);
	if(word == ""){
		choice = 'sel';
	}
	location.href = "1_6PicBbsList.jsp?findWord=" + word + "&choice=" + choice;	
}
function openSkyS() {
	window.open("https://www.skyscanner.co.kr/?ksh_id=_k_Cj0KCQiAtvPjBRDPARIsAJfZz0rlc5Nr_PqnGIkjyDBuew7pBjJnRwxq4Yx8UZIYwTSf03dZyXW3YZkaAq_fEALw_wcB_k_&associateID=SEM_GGT_00065_00021&utm_source=google&utm_medium=cpc&utm_campaign=KR-Travel-Search-Brand-Exact&utm_term=%EC%8A%A4%EC%B9%B4%EC%9D%B4%EC%8A%A4%EC%BA%90%EB%84%88&kpid=google_438310576_23048128696_331009635267_aud-326758276298:kwd-51820162295_c_&gclid=Cj0KCQiAtvPjBRDPARIsAJfZz0rlc5Nr_PqnGIkjyDBuew7pBjJnRwxq4Yx8UZIYwTSf03dZyXW3YZkaAq_fEALw_wcB")
}
</script>



</body>
</html>
