<%@page import="User.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<<<<<<< HEAD
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
	<link rel="stylesheet" href="assets/css/main.css">
<title>Insert title here</title>
=======
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
   <link rel="stylesheet" href="assets/css/main.css">
<title>Q&A 게시판</title>
>>>>>>> branch 'KMJ' of https://github.com/KoMyeongJae/KHProject1.git
</head>
<<<<<<< HEAD
<body>
<h1>글쓰기</h1>
<%
Object ologin = session.getAttribute("login");
UserDto user = (UserDto)ologin;
%>
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
=======
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
>>>>>>> branch 'KMJ' of https://github.com/KoMyeongJae/KHProject1.git
					</ul>
				</nav>

<<<<<<< HEAD
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
	<div class="center">

<form action="QaAddCtlr" method="get">
<input type="hidden" name="command" value="addAf">
=======
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
						<div class="center">
						<h3>Q&A 게시판</h3>
						<form action="QaAddCtlr" method="get">
						<table style="margin-bottom: 0em;">
						<col width="8%"><col width="8%"><col width="84%">  
						<tr>
						   <th>제목</th>
						   <td colspan="2" style="padding-bottom: 0.5em;">
						      <input type="text" name="title" size="50" style="background: white; border: 1px solid; border-color: lightgray;">      
						   </td>
						</tr>
						<tr>
						   <td colspan="3" style="padding-bottom: 0.5em;">
<!-- textarea 입력 시 공백 부분 없애기 위해서 왼쪽에 붙인거야 : 근데 안됨 => 질문!!!-->
<textarea rows="10" cols="50" name="content" style="resize: none; background-color: white; border: 1px solid; border-color: lightgray;"></textarea>
						   </td>
						</tr>
						<tr>
						   <td colspan="2">
						      <select name="pbpv" style="background-color: white;
						      	border: 1px solid; border-color: lightgray;">
						         <option value="0">공개</option>
						         <option value="1">비공개</option>
						      </select>
						   </td>
						</tr>
						<tr>
							<td colspan="3" align="right">
								<button type="button" onclick="location.href='3_QA_list.jsp'">목록</button>
								<input type="hidden" name="command" value="addAf">
								<input type="hidden" name="id" readonly="readonly" size="50" value="<%=user.getId() %>">
								<input type="submit" value="작성">
							</td>
						</tr>
						</table>
							<div align="center">
								
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
                                 <a href="UserDetailCtlr?id=<%=user.getId() %>"><font size="2">내 정보 보기</font></a>
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

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
>>>>>>> branch 'KMJ' of https://github.com/KoMyeongJae/KHProject1.git

<table border="1" class="specalt">
<col width="200"><col width="500"> 

<tr>
	<th>아이디</th>
	<td>
		<input type="text" name="id" readonly="readonly" size="50" 
			value="<%=user.getId() %>">
	</td>
</tr>	
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="50">		
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="50" name="content"></textarea>		
	</td>
</tr>
<tr>
	<td>
		<select name="pbpv">
			<option value="0">공개</option>
			<option value="1">비공개</option>
		</select>
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="질문 등록하기">
	</td>
</tr>

</table>

</form>

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

</body>
</html>