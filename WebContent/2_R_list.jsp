<<<<<<< HEAD
<%@page import="ReferRoom.ReferRoomDto"%>
<%@page import="java.util.List"%>
<%@page import="QABbs.QABbsDto"%>
<%@page import="QABbs.QABbsDao"%>
<%@page import="QABbs.iQABbsDao"%>
<%@page import="User.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
public String dot3(String msg){
	String s = "";
	if(msg.length() >= 14){
		s = msg.substring(0, 14);
		s += "...";
	}else{
		s = msg.trim();
	}	
	return s;
}

public String arrow(int depth){
	String rs = "<img src='./images/arrow.png' width='20px' height='20px'/>";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";	// 여백
	
	String ts = ""; 
	
	for(int i = 0;i < depth; i++){
		ts += nbsp;
	}
	
	return depth==0?"":ts + rs;
}
%>
<%

Object ologin = session.getAttribute("login");
UserDto user = null;
if(ologin == null){
	%>
	<script type="text/javascript">
	alert("로그인 해 주십시오");
	location.href = "Login.jsp";
	</script>	
	<%
	return;
}

user = (UserDto)ologin;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link rel="stylesheet" href="assets/css/main.css">
	
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body class="homepage is-preload">


<div id="page-wrapper">
		<!-- Header -->
		<section id="header">
			<div class="container">
				<!-- Logo : Logo 를 누르면 MainPage 로 이동하게 만들기 -->
				<h1 id="logo"><a href="1_3MainPage.jsp">TRIP</a></h1>
				<p>Take a Trip to Anywhere you want to go</p>
				
				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a class="icon fa-home" href="#"><span>About Us</span></a></li>
						<li>
							<a href="#" class="icon fa-sitemap"><span>나라 정보</span></a>
							<ul>
								<li>
									<a href="#">미국</a>
										<ul>
											<li><a href="#">뉴욕</a></li>
											<li><a href="#">하와이</a></li>
											<li><a href="#">LA</a></li>
										</ul>
								</li>
								<li>
									<a href="#">일본</a>
										<ul>
											<li><a href="#">도쿄</a></li>
											<li><a href="#">오사카</a></li>
											<li><a href="#">후쿠오카</a></li>
										</ul>
								</li>
								<li>
									<a href="#">베트남</a>
										<ul>
											<li><a href="#">하노이</a></li>
											<li><a href="#">다낭</a></li>
										</ul>
								</li>
								<li>
									<a href="#">러시아</a>
									<ul>
										<li><a href="#">모스크바</a></li>
										<li><a href="#">블라디보스톡</a></li>
									</ul>
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

<% 
List<ReferRoomDto> list = (List<ReferRoomDto>)request.getAttribute("referlist");
%>   


<div align="center">

<h2>자료실</h2>




<form action="" method="post">

<table class="type03">
<col width="85"><col width="280"><col width="80"><col width="80">
<col width="100"><col width="80">
<tr align="center">
	<th scope="row">번호</th>
	<th scope="row">제목</th>
	<th scope="row">작성자</th>
	<th scope="row">조회수</th>
	<th scope="row">작성일</th>
	<th scope="row">좋아요</th>
	
</tr>
<% 
if(list.size() == 0){
	%>	
	<tr bgcolor="#f6f6f6">
		<td colspan="8" align="center">자료가 존재하지 않습니다</td>
	</tr>
	<%
}
else{
	for(int i = 0; i < list.size(); i++){
		ReferRoomDto rfr = list.get(i);
		String bgcolor = "";
		if(i % 2 == 0){
			bgcolor= "white";
		}else{
			bgcolor= "white";
		}
		
		if(rfr.getDel() == 1){
			int a = 0;
			a++;
			
			if(a == list.size()){%>
				<tr bgcolor="#f6f6f6">
				<td colspan="8" align="center">자료가 존재하지 않습니다</td>
				</tr>
				<%
			}
		}
		else{
		%>
		<tr>
			<th scope="row"><%=i+1 %></th>
			<th scope="row">
				<a href="ReferDetailCtlr?seq=<%=rfr.getSeq() %>">
					<%= dot3(rfr.getTitle()) %>
				</a>
			</th>
			<th scope="row"><%=rfr.getId() %></th>
			<th scope="row"><%=rfr.getReadcount() %></th>
			<th scope="row"><%=rfr.getWdate().substring(0,10) %></th>
			<th scope="row"><%=rfr.getLikeit() %></th>
			
		</tr>
		<%
		}
	}
}
%>
<tr>
</tr>
</table> 
</form>

<form action="ReferSearchCtlr" method="post" name="frm">

<table>
<tr>
<td>
<select name="choice">
<option value="multi">제목+작성자+내용</option>
<option value="title">제목</option>
<option value="writer">작성자</option>
<option value="content">내용</option>
</select>
</td>
<td><input type="text" name="search" placeholder="검색어를 입력하세요"></td>
<td><button type="button" onclick="doSearch()">검색</button></td>
</tr>
</table>
</form>

<button type="button" class="aligi" style="align:left" >Add</button>


<script type="text/javascript">
$(function () {
	$(".btn").click(function () {
		alert("다운로드 합니다");
	});
	
	$(".aligi").click(function () {
		location.href = "2_R_add.jsp";
	});

});

function doSearch() {
	var frm = document.frm;
	
	var errorMsg = null;
	var objFocus = null;
	
	if ( frm.search.value.length == 0 ){
		errorMsg = "검색어를 입력해 주십시오";
		objFocus = frm.search;
	}  
	
	if(errorMsg != null){
		alert(errorMsg);
		objFocus.focus();
		return false;
	}
	
	frm.submit();
}
</script>





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
 
<hr>

<script type="text/javascript">
function searchBbs() {
	
	var choice = document.getElementById("choice").value;
	var word = $("#search").val();
//	alert("choice = " + choice);
//	alert("word = " + word);

	if(word == ""){
		alert("choice = " + choice);
		document.getElementById("choice").value = 'sel';
	}
	
	location.href = "3_QA_list.jsp?searchWord=" + word + "&choice=" + choice;
	
}


</script>
 
 
</body>
</html>
=======
<%@page import="dto.PagingBean"%>
<%@page import="ReferRoom.ReferRoomDao"%>
<%@page import="ReferRoom.iReferRoomDao"%>
<%@page import="ReferRoom.ReferRoomDto"%>
<%@page import="java.util.Calendar"%>
<%@page import="FestiCalendar.FestiCalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="FestiCalendar.FestiCalendarDao"%>
<%@page import="FestiCalendar.iFestiCalendarDao"%>
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
<%!
public String dot3(String msg){
	String s = "";
	if(msg.length() >= 14){
		s = msg.substring(0, 14);
		s += "...";
	}else{
		s = msg.trim();
	}	
	return s;
}

public String arrow(int depth){
	String rs = "<img src='./images/arrow.png' width='20px' height='20px'/>";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";	// 여백
	
	String ts = ""; 
	
	for(int i = 0;i < depth; i++){
		ts += nbsp;
	}
	
	return depth==0?"":ts + rs;
}
%>
<%
String choice = request.getParameter("choice");
//검색어
String findWord = request.getParameter("findWord");
%>

<!-- 페이징 처리 정보 교환 -->
<%
PagingBean paging = new PagingBean();
if(request.getParameter("nowPage") == null){
	paging.setNowPage(1);	
}else{
	paging.setNowPage(Integer.parseInt(request.getParameter("nowPage")));
}
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

iReferRoomDao dao = ReferRoomDao.getInstance();
List<ReferRoomDto> list = dao.getReferPagingList(paging, findWord, choice);
// List<BbsDto> bbslist = dao.getBbsList();
%>
<%

//(List<ReferRoomDto>)request.getAttribute("referlist");
%>   
<!DOCTYPE HTML>
<html>
<head>
	<title>MainPage</title>
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
						<li><a class="icon fa-retweet" href="#"><span>여행 자료</span></a></li>
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
								<h3>여행 자료</h3>
								
								<form action="" method="post">

								<table class="type03" style="border: 1px solid; border-color: lightgray; margin-bottom: 1em;">
								<col width="8%"><col width="46%"><col width="10%"><col width="16%">
								<col width="10%"><col width="10%">
								<tr align="center"  style="border-bottom: 1px solid; border-color: lightgray; background-color: lightgray;">
									<th scope="row">번호</th>
									<th scope="row">제목</th>
									<th scope="row">작성자</th>
									<th scope="row">작성일</th>
									<th scope="row">조회수</th>
									<th scope="row">좋아요</th>
									
								</tr>
								<% 
								if(list.size() == 0){
									%>	
									<tr bgcolor="#f6f6f6" style="border-bottom: 1px solid; border-color: lightgray;">
										<td colspan="8" align="center">자료가 존재하지 않습니다</td>
									</tr>
									<%
								}
								else{
									for(int i = 0; i < list.size(); i++){
										ReferRoomDto rfr = list.get(i);
										String bgcolor = "";
										if(i % 2 == 0){
											bgcolor= "white";
										}else{
											bgcolor= "white";
										}
										
										if(rfr.getDel() == 1){
											int a = 0;
											a++;
											
											if(a == list.size()){%>
												<tr bgcolor="#f6f6f6" style="border-bottom: 1px solid; border-color: lightgray;">
													<td colspan="8" align="center">자료가 존재하지 않습니다</td>
												</tr>
												<%
											}
										}
										else{
										%>
										<tr style="border-bottom: 1px solid; border-color: lightgray;">
											<th style="text-align: center;"><%=rfr.getSeq() %></th>
											<td scope="row">
												<a href="ReferDetailCtlr?seq=<%=rfr.getSeq() %>">
													<%= dot3(rfr.getTitle()) %>
												</a>
											</td>
											<td scope="row"><%=rfr.getId() %></td>
											<td scope="row"><%=rfr.getWdate().substring(0,10) %></td>
											<td style="text-align: center;"><%=rfr.getReadcount() %></td>
											<td style="text-align: center;"><%=rfr.getLikeit() %></td>
											
										</tr>
										<%
										}
									}
								}
								%>
								<tr>
								</tr>
								</table> 
								</form>
								<div align="right">
									<button type="button" class="aligi">글쓰기</button>
								</div>
								</article>
						</div>
						
						<jsp:include page="paging.jsp">
							<jsp:param name="actionPath" value="2_R_list.jsp" />
							<jsp:param name="nowPage" value="<%=String.valueOf(paging.getNowPage()) %>" />
							<jsp:param name="totalCount" value="<%=String.valueOf(paging.getTotalCount()) %>" />
							<jsp:param name="countPerPage" value="<%=String.valueOf(paging.getCountPerPage()) %>" />
							<jsp:param name="blockCount" value="<%=String.valueOf(paging.getBlockCount()) %>" />
							<jsp:param name="findWord" value="<%=findWord %>" />
							<jsp:param name="choice" value="<%=choice %>" />
						</jsp:include>
						
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

<script type="text/javascript">
$(function () {
	$(".btn").click(function () {
		alert("다운로드 합니다");
	});
	
	$(".aligi").click(function () {
		location.href = "2_R_add.jsp";
	});

});
</script>

<script type="text/javascript">
function searchBbs() {
   
   var choice = document.getElementById("choice").value;
   var word = $("#search").val();
//   alert("choice = " + choice);
//   alert("word = " + word);

   if(word == ""){
      alert("choice = " + choice);
      document.getElementById("choice").value = 'sel';
   }
   
   location.href = "2_R_list.jsp?findWord=" + word + "&choice=" + choice;
   
}
</script>

</body>
</html>
>>>>>>> branch 'KMJ' of https://github.com/KoMyeongJae/KHProject1.git
