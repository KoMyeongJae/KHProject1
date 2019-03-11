<%@page import="CommentP.CommentPDto"%>
<%@page import="java.util.List"%>
<%@page import="CommentP.CommentPDao"%>
<%@page import="CommentP.iCommentPDao"%>
<%@page import="PicBbs.PicBbsDto"%>
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
String id = user.getId();
%>
<%
/*
String sseq = request.getAttribute("seq")+"";
int seq = Integer.parseInt(sseq);
System.out.println("seq in jsp : " + seq);
/**/

// setAttribute 로 보내도 getParameter 로 받을 수 있는 것 같아
int seq = Integer.parseInt(request.getParameter("seq"));

iPicBbsDao dao = PicBbsDao.getInstance();
PicBbsDto dto = dao.detailPic(seq);
dao.readcount(seq);

String title = dto.getTitle();
String content = dto.getContent();

iCommentPDao comDao = CommentPDao.getInstance();
List<CommentPDto> list = comDao.getCommentList("pic");

%>
<!DOCTYPE HTML>
<html>
<head>
<title>MainPage</title>
<meta charset="utf-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="assets/css/main.css">

<link rel='stylesheet' href='smarteditor/css/style.css'>
<script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/smarteditor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>

<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">

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
						<table style="margin-top: 2em;">
						<col width="37.5%"><col width="62.5%">
						<tr>
							<td colspan="2" style="padding: 1em 0em 1em 0em;">
								<font color="black" size="10">
									&nbsp;&nbsp;&nbsp;<%=title %>
								</font>
								<input type="hidden" name="title" style="width: 100%" value="<%=title %>" readonly="readonly">
							</td>
						</tr>
						<tr style="border-bottom: double; border-color: lightgray;">
							<td style="padding-bottom: 1em;">
							<i class="fa fa-user-o" aria-hidden="true"></i> <%=dto.getId() %>
							&nbsp;&nbsp;&nbsp;
							<%=dto.getWdate() %>
							 </td>
							<td align="right" >
							URL http://localhost:8090/KHProject1/1_6PicBbsDetail.jsp?seq=<%=seq %>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="padding-top: 2em;">
								<%=content %>	
							</td>
						</tr>
						</table>
					<font>댓글 입력</font>
					<form action="CommAddCtlr">
						<input type="hidden" name="command" value="addCommentPIC">
						<input type="hidden" name="id" value="<%=user.getId() %>">
						<input type="hidden" name="bbs_seq" value="<%=seq %>">
						<table style="margin-bottom: 0em;">
						<tr>
							<th><%=user.getId() %></th>
							<td>
								<textarea rows="1" cols="80" name="content" style="resize: none; background-color: white; border: 1px solid; border-color: lightgray;"></textarea>
							</td>
							<td>
								<input type="submit" value="입력">
							</td>
						</tr>
						</table>
					</form>
					
						<table style="margin-bottom: 0em;">
						<col width="10%"><col width="56%"><col width="18%"><col width="8%"><col width="8%">
						<%for(int i = 0; i < list.size(); i++){ 
							CommentPDto comDto = list.get(i);
							if(seq==comDto.getBbs_seq()){
						%>
						<tr style="border-bottom: 1px solid; border-color: lightgray">
							<th><%=comDto.getId() %></th>
							<%if(comDto.getDel() != 0){ %>
								<td style="padding-top: 0em;">
									작성자에 의해 삭제된 댓글입니다.
								</td>
							<%}else{ %>
								<td style="padding-top: 0em;">
									<%=comDto.getContent() %>
								</td>
							<%} %>
							<td><%=comDto.getWdate() %></td>
							<%if(user.getId().equals(comDto.getId())){ 
								if(comDto.getDel() != 0){
							%>
							<%}else{ %>
							<td> <a href="CommUpdateCtlr?command=upd_viewPIC&seq=<%=comDto.getSeq() %>&bbs_seq=<%=comDto.getBbs_seq()%>"> 수정 </a> </td>
							<td> <a href="CommDeleteCtlr?command=delPIC&seq=<%=comDto.getSeq() %>&bbs_seq=<%=comDto.getBbs_seq()%>"> 삭제 </a> </td>
							<%} } %>
						</tr>
						<%}
						}%>
						</table>
					
					<form action="PicUpdateCtlr" name="write_form" method="get">
						<div align="center" style="margin-top: 1em;">
							<input type="hidden" name="command" value="update_view">
							<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
							<input type="button" onclick="location.href='1_6PicBbsList.jsp'" value="목록">
							<%if(user.getId().equals(dto.getId())){ %>
								<input type="submit" value="수정">
								<button type="button" onclick="location.href='PicDeleteCtlr?command=delete&seq=<%=dto.getSeq() %>'">
								삭제
								</button>
							<%} %>
						</div>
					</form>
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
function openSkyS() {
	window.open("https://www.skyscanner.co.kr/?ksh_id=_k_Cj0KCQiAtvPjBRDPARIsAJfZz0rlc5Nr_PqnGIkjyDBuew7pBjJnRwxq4Yx8UZIYwTSf03dZyXW3YZkaAq_fEALw_wcB_k_&associateID=SEM_GGT_00065_00021&utm_source=google&utm_medium=cpc&utm_campaign=KR-Travel-Search-Brand-Exact&utm_term=%EC%8A%A4%EC%B9%B4%EC%9D%B4%EC%8A%A4%EC%BA%90%EB%84%88&kpid=google_438310576_23048128696_331009635267_aud-326758276298:kwd-51820162295_c_&gclid=Cj0KCQiAtvPjBRDPARIsAJfZz0rlc5Nr_PqnGIkjyDBuew7pBjJnRwxq4Yx8UZIYwTSf03dZyXW3YZkaAq_fEALw_wcB")
}
</script>

</body>
</html>
