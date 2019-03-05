<%@page import="ReferRoom.ReferRoomDao"%>
<%@page import="ReferRoom.iReferRoomDao"%>
<%@page import="ReferRoom.ReferRoomDto"%>
<%@page import="java.util.List"%>
<%@page import="QABbs.QABbsDto"%>
<%@page import="QABbs.QABbsDao"%>
<%@page import="QABbs.iQABbsDao"%>
<%@page import="User.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
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
ReferRoomDto dto = (ReferRoomDto)request.getAttribute("rfr");

String msg = (String)request.getAttribute("msg");
System.out.println("좋아요여부 = " + msg);

iReferRoomDao dao = ReferRoomDao.getInstance();
dao.readCount(dto.getSeq());
%>  


<script type="text/javascript">
if(<%=msg %> != null && <%=msg %> != "")
{

	alert(msg);
}
</script>

<table border="1">

<tr>
<td align="left"><b><%=dto.getTitle() %></b>ㅣ <a href="ReferListCtlr">자료실</a></td>
<td align="right"><%=dto.getWdate() %></td>
</tr>
<tr>
<td align="left"><b><%=dto.getId() %></b></td>
<td align="right">조회수 : <%=dto.getReadcount() %>  다운로드 수 : <%=dto.getDowncount() %>
  좋아요 : <%=dto.getLikeit() %></td>
</tr>
<tr>
<td colspan="4" align="right">
<input type="submit" class="btn" name="btnDown" value="파일"
					onclick="location.href='ReferDownCtlr?filename=<%=dto.getFilename() %>&seq=<%=dto.getSeq() %>'">
					</td>

</tr>
<tr>
<td><%=dto.getContent() %></td>
</tr>

</table>

<!-- 로그인 세션 받아와야되는부분 -->
<%
if(dto.getId().equals(user.getId())){
%>
<button onclick="deletebbs('<%=dto.getSeq() %>')">삭제</button>
<button onclick="updatebbs('<%=dto.getSeq() %>')">수정</button>
<%
}
%>
<button onclick="likeit('<%=dto.getSeq() %>')">이글이 도움이 되었습니다(좋아요)</button>


<p align="right"><a href='ReferListCtlr'>글 목록</a></p>

<script type="text/javascript">
function deletebbs(seq) {
	alert("삭제되었습니다");	
	location.href = "ReferDeleteCtlr?seq=" + seq;
}
function updatebbs(seq) {
	location.href = "ReferDetailCtlr?seq=" + seq + "&command=update";
}
function likeit(seq) {
	location.href = "ReferLikeCtlr?seq=" + seq + "&id=" + "<%=dto.getId()%>";
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