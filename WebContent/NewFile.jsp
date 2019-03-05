<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js">
</script>

</head>
<body>

이름:<input type="text"><br><br>
이메일:<input type="text"><br><br>


<p>게시판</p>
<p>자료실</p>

<script type="text/javascript">
$(function () {
	
	// focus
	$("input").focus(function () {
		$(this).css("background-color", "#00ff00");
	});
	$("input").blur(function () {
	//	$(this).css("background-color", white);
		$(this).css("background-color", "#ffffff");
	});
	
	// mouse
	// 올릴때
	$("p").mouseover(function () {
			$(this).css("background-color", "#ffff00");
	});
	// 내릴때
	$("p").mouseout(function () {
		$(this).css("background-color", "#ffffff");
	});
	// 더블클릭
	$('p').dblclick(function () {
		$(this).hide();
	});
	
});
</script>

<br>
<button id="hideBtn">감추기</button>
<button id="showBtn">보이기</button>
<button id="togglenBtn">스위치</button>
<br><br>
<div align="center">
<div class="test" style="background-color: green; width: 50%;
		height: 100px; text-align:center;">
		I can do it!!
</div>
</div>

<script type="text/javascript">
$(function name() {
	
	$("#hideBtn").click(function () {
		$(".test").hide( 1000 );	// timer 작동가능..!
	});
	$("#showBtn").click(function () {
		$(".test").show( 2000 );
	});
	$("#togglenBtn").click(function () {
		$(".test").toggle( 1000 );
	});
	
	/* 마우스 기능하고 동일..
	$(".test").mouseenter(function () {
		alert("mouseenter 동작");
	});
	$(".test").mouseleave(function () {
		alert("mouseleave 동작");
	});
	 */
	/* 
	// 둘이 한	번에가능 토글같은느낌
	$(".test").hover(function () {
		alert("hover 동작");
	});
	 */ 
	// 누를때
	$(".test").mousedown(function () {
		alert("mousedown 동작");
	});
	// 땔때
	$(".test").mouseup(function () {
		alert("mouseup 동작");
	});
	 
	 
	 
});
</script>



</body>
</html>