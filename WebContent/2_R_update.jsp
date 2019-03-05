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
ReferRoomDto dto = (ReferRoomDto)request.getAttribute("rfr");
%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 
	주의점 : 1. 같은 파일명으로 사용시 주의 필요! (다른사용자의 같은파일이름이 있다면 파일이 덮어쓰기 된다.)
				해결) 파일명을 DATE() 클래스를 이용하여 시간으로 파일을 저장하고 불러내고, 
			 		 다운로드시에 저장된 파일명을 호출하여 가져온다.
		  
		   2. 한글파일명은 문자가 깨짐
		   
		  		ex) bbslist.jsp -> 1232123213.jsp   upload
		  		
		  		DB의 column에서 취득 후					download
		  		1232123213.jsp  -> bbslist.jsp
 --%>
 
<h2>수정</h2>

<div align="center">
<%-- multipart : byte, String 다 받아주는 방식 --%> 
<%-- 파일보낼땐 String byte 둘다 보내기때문에 보내지지 않는다. --%>
<form action="ReferUpdateCtlr" name="frm" method="POST" enctype="multipart/form-data">
<input type="hidden" name="command" value="updateAf">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
 
<table border="1" class="specalt">
<col width="200"><col width="500">
<tr>
	<td>아이디</td>
	<td><%=user.getId() %>
		<input type="hidden" name="id" value="<%=user.getId() %>">
	</td>
</tr>
<tr>
	<td>제목</td>
	<td>
		<input type="text" id="title" name="title" value="<%=dto.getTitle() %>"
		size="50" placeholder="14자 내외로 입력해 주십시오">
	</td>
</tr>
<tr>
	<td>기존파일</td>
	<td>
		<%=dto.getFilename() %>
	</td>
</tr>
<tr>
	<td>파일업로드</td>
	<td>
		<%-- 이건 request.get ~ 으로 받아낼 수 없다. --%>
		<b style="color:red">파일을 새로 첨부해서 수정하면 기존 파일은 사라집니다.</b>
		<input type="hidden" name="_filename" value="<%=dto.getFilename() %>">
		<input type="file" id="file" name="fileload" style="width: 400px">
	</td>
</tr>
<tr>
	<td>내용</td>
	<td>
		<textarea rows="20" id="con" cols="50" name="content" style="resize: none;"><%=dto.getContent() %></textarea>
	</td>
</tr>
<tr align="center">
	<td colspan="2">
		<button type="button" onclick="doUpdate()">올리기</button>
	</td>
</tr>

</table>

</form>
</div>

<script type="text/javascript">
function doUpdate() {
	
	var frm = document.frm;
	var errorMsg = null;
	var objFocus = null;
	
	if ( frm.title.value.length == 0 ){
		errorMsg = "글제목을 입력해 주십시오";
		objFocus = frm.title;
	} else if ( frm.title.value.length > 14 ){
		errorMsg = "14자 이하로 입력해 주십시오";
		objFocus = frm.title;
	} else if ( frm.content.value.length == 0 ){
		errorMsg = "내용을 입력해 주십시오";
		objFocus = frm.content;	
	} else if ( frm.file.value.length == 0){
		
		
	}
	
	if(errorMsg != null){
		alert(errorMsg);
		objFocus.focus();
		return false;
	}
	console.log(frm);
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
