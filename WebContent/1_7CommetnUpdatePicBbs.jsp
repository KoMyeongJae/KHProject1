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

//int seq = Integer.parseInt(request.getParameter("seq"));
int seq = (int)(request.getAttribute("seq"));			// detail seq
int bbs_seq = (int)(request.getAttribute("bbs_seq"));	// comment seq

System.out.println("comment seq2 : " + seq);	// 41
System.out.println("bbs seq2 : " + bbs_seq);	// 20

iPicBbsDao dao = PicBbsDao.getInstance();
PicBbsDto dto = dao.detailPic(seq);
dao.readcount(seq);

String title = dto.getTitle();
String content = dto.getContent();

iCommentPDao comDao = CommentPDao.getInstance();
List<CommentPDto> list = comDao.getCommentList();


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
						<table>
						<col width="37.5%"><col width="62.5%">
						<tr style="border: 1px solid; border-bottom: dashed; border-color: lightgray">
							<td>
								제목 : <%=title %>
								<input type="hidden" name="title" style="width: 100%" value="<%=title %>" readonly="readonly">
							</td>
							<td align="right"> 작성일: <%=dto.getWdate() %> </td>
						</tr>
						<tr style="border: 1px solid; border-bottom: hidden; border-color: lightgray">
							<td colspan="2">작성자 : <%=dto.getId() %></td>
						</tr>
						<tr style="border: 1px solid; border-color: lightgray">
							<td colspan="2">
								<%=content %>	
							</td>
						</tr>
						</table>
					<font>댓글 입력</font>
					<form action="CommAddCtlr">
						<input type="hidden" name="command" value="addComment">
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
					
						<form action="CommUpdateCtlr">
							<input type="hidden" name="command" value="upd">
							<table >
							<%for(int i = 0; i < list.size(); i++){ 
								CommentPDto comDto = list.get(i);
								if(seq==comDto.getBbs_seq()){
							%>
							<tr style="padding-bottom: 1em; border-bottom: 1px solid; border-color: lightgray">
								<th><%=comDto.getId() %></th>
								<%if(comDto.getDel() != 0){ %>
									<td>
										작성자에 의해 삭제된 댓글입니다.
									</td>
								<%}else{
										if(comDto.getSeq() == bbs_seq){
										System.out.println("번호 확인 : " + comDto.getSeq());%>
									<td style="margin-bottom: 0.5em;">
										<textarea rows="1" cols="50%" name="content" style="resize: none; background-color: white; border: 1px solid; border-color: lightgray;"><%=comDto.getContent() %></textarea>
									</td>
										<%}else{ %>
									<td>
										<%=comDto.getContent() %>
									</td>
									
								<%}	}%>
								<td>작성일 : <%=comDto.getWdate() %></td>
								<%if(user.getId().equals(comDto.getId())){ 
									if(comDto.getDel() != 0){
								%>
									<td></td>
								<%}else{ %>
								
								<td>
									<!-- for 문이 도는데 input hidden 에 들어가는건 첫 번쨰 seq 인 18이.. ㅅㅂ  -->
									<input type="hidden" name="seq" value="<%=bbs_seq %>">
									<%-- <% System.out.println("번호 확인2 : " + comDto.getSeq()); %> --%>
									<input type="hidden" name="bbs_seq" value="<%=comDto.getBbs_seq()%>">
									<%if(comDto.getSeq() == bbs_seq){ %>
									<input type="submit" value="완료">
									<%} %>
								</td>
								<%} } %>
							</tr>
							<%}	}%>
							</table>
							</form>
					
					<form action="PicUpdateCtlr" name="write_form" method="get">
						<div align="center">
<%-- 							<input type="hidden" name="command" value="update_view">
							<input type="hidden" name="seq" value="<%=bbs_seq %>"> --%>
							<input type="button" onclick="location.href='PicListCtlr?command=PicList'" value="목록">
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


</body>
</html>
