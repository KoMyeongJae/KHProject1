<%@page import="QABbs.QABbsDao"%>
<%@page import="QABbs.iQABbsDao"%>
<%@page import="QABbs.QABbsDto"%>
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
<%
String sseq = request.getParameter("seq");
int seq = Integer.parseInt(sseq);

iQABbsDao dao = QABbsDao.getInstance();

dao.readcount(seq);

QABbsDto qbbs = dao.getQbs(seq);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
   <link rel="stylesheet" href="assets/css/main.css">
   
<title>Q&A 게시판</title>
</head>
<body>
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
            
               <!-- Content banner 제외 부분에 본인코드 부분 작성하면 됩니다 -->
               <div class="content_m">
	               <div id="content" class="col-8 col-12-medium">
	                  
	                  <!-- Post -->
					<article class="box post">
						<div class="center">
							<h3>Q&A 게시판</h3>
							<table style="margin-top: 2em;">
							<col width="37.5%"><col width="62.5%">
							<tr>
								<td colspan="2" style="padding: 1em 0em 1em 0em;">
							   		<font color="black" size="10">
							   			&nbsp;&nbsp;&nbsp;<%=qbbs.getTitle() %>
							   		</font>
								</td>
							</tr>
							<tr style="border-bottom: double; border-color: lightgray;">
							   <td style="padding-bottom: 1em;">
							   		<i class="fa fa-user-o" aria-hidden="true"></i> <%=qbbs.getId() %>
							   		&nbsp;&nbsp;&nbsp;
							   		<%=qbbs.getWdate() %>
							   </td>
							   <td align="right" style="padding-top: 1em;">
							   		URL http://localhost:8090/KHProject1/3_QA_detail.jsp?seq=<%=seq %>
							   
							   </td>
							</tr>
							<tr>
								<td colspan="2" style="padding-top: 2em;">
									<textarea rows="10" readonly="readonly" style="width: 100%; height: 100%; resize: none; border: hidden;">
										<%=qbbs.getContent() %>
									</textarea>
								</td>
							</tr>
							</table>
							<hr>
							
							
							<div align="center">
							<%
							if(qbbs.getId().equals(user.getId())){
							%>
								<button onclick="location.href='3_QA_list.jsp'">목록</button>
								<button onclick="updatebbs('<%=qbbs.getSeq() %>')">수정</button>
								<button onclick="deletebbs('<%=qbbs.getSeq() %>')">삭제</button>
							</div>
							<%
							}
							%>
							<!-- 관리자만 답글을 달 수 있게 할까? -->
							<%if(user.getAuth()==1){ %>
							<form action="3_QA_answer.jsp" method="post">
								<input type="hidden" name="seq" value="<%=qbbs.getSeq() %>">
								<input type="submit" value="답글">
							</form>
							<%} %>
						
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


<script type="text/javascript">
function deletebbs(seq) {
   
   location.href = "QaDeleteCtlr?seq=" + seq;
}
function updatebbs(seq) {
      
   location.href = "3_QA_update.jsp?seq=" + seq;
}

function openSkyS() {
	window.open("https://www.skyscanner.co.kr/?ksh_id=_k_Cj0KCQiAtvPjBRDPARIsAJfZz0rlc5Nr_PqnGIkjyDBuew7pBjJnRwxq4Yx8UZIYwTSf03dZyXW3YZkaAq_fEALw_wcB_k_&associateID=SEM_GGT_00065_00021&utm_source=google&utm_medium=cpc&utm_campaign=KR-Travel-Search-Brand-Exact&utm_term=%EC%8A%A4%EC%B9%B4%EC%9D%B4%EC%8A%A4%EC%BA%90%EB%84%88&kpid=google_438310576_23048128696_331009635267_aud-326758276298:kwd-51820162295_c_&gclid=Cj0KCQiAtvPjBRDPARIsAJfZz0rlc5Nr_PqnGIkjyDBuew7pBjJnRwxq4Yx8UZIYwTSf03dZyXW3YZkaAq_fEALw_wcB")
}

</script>
</body>
</html>