
<%@page import="FestiCalendar.FestiCalendarDao"%>
<%@page import="FestiCalendar.iFestiCalendarDao"%>
<%@page import="java.util.Calendar"%>
<%@page import="FestiCalendar.FestiCalendarDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
// nvl 함수
public boolean nvl(String msg){
	return msg == null || msg.trim().equals("")?true:false;
}

// 날짜를 클릭하면, 그날의 일정이 모두 보이게하는 callist.jsp로 이동시키는 함수
public String callist(int year, int month, int day){
	String s = "";
	
	s += String.format("<a href='%s?year=%d&month=%d&day=%d'>", 
							"FestiListCtlr", year, month, day);
	s += String.format("%2d", day); 
	s += "</a>"; 
	
	return s;
}

// 일정을 추가하기 위한 함수로 pen이미지를 클릭하면, calwrite.jsp로 이동
public String showPen(int year, int month, int day){
	String s = "";
	
	String image = "<img src='image/write.png'>";	
	
	String a;
	
	// 아이디 비교해주는 부분
	if(false){
		a = "<a href='%s?year=%d&month=%d&day=%d'>%s</a>";
	}
	else{
		a = "";
	}
	s = String.format(a, "2_F_write.jsp", year, month, day, image); 
	
	return s;	
}

// 1 ~ 9 -> 01 
public String two(String msg){
	return msg.trim().length()<2?"0"+msg:msg.trim();
}

// 각 날짜별로 테이블을 생성하는 함수
public String makeTable(int year, int month, int day, List<FestiCalendarDto> list){
	
	String s = "";
	String dates = (year + "") + two(month + "") + two(day + "");	// 20190211
	
	s += "<table>";
	s += "<col width='98'>";
	
	for(FestiCalendarDto dto : list){		
		if(dto.getRdate().substring(0, 8).equals(dates)){
			
			s += "<tr color='red'>";
			s += "<td><div class='event'><div class='event-desc'>";
			
			String a;
			
			// 아이디 비교해주는 부분
			if(true){
				a = "<a href='FestiDetailCtlr?seq=" + dto.getSeq() + "'>";
			}
			else{
				a = "";
			}
			
			s += a;
			s += dto.getTitle();
			s += "</a>";
			
			s += "</div></div></td>";
			s += "</tr>";		
		}		
	}
	s += "</table>";
	
	return s;
}

// 제목이 너무 길면, (미팅약속이...) 으로 처리할 함수
public String dot3(String msg){
	String s = "";
	if(msg.length() >= 4){
		s = msg.substring(0, 4);
		s += "...";
	}else{
		s = msg.trim();
	}	
	return s;
}


%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
body {
    font-family: Tahoma;
}

header {
    text-align: center;
}

#calendar {
    width: 100%;    
}

#calendar a {
    color: #8e352e;
    text-decoration: none;
}

#calendar ul {
    list-style: none;
    padding: 0;
    margin: 0;
    width: 100%;
}

#calendar li {
    display: block;
    float: left;
    width:14.342%;
    padding: 5px;
    box-sizing:border-box;
    border: 1px solid #ccc;
    margin-right: -1px;
    margin-bottom: -1px;
}

#calendar ul.weekdays {
    height: 40px;
    background: #8e352e;
}

#calendar ul.weekdays li {
    text-align: center;
    text-transform: uppercase;
    line-height: 20px;
    border: none !important;
    padding: 10px 6px;
    color: #fff;
    font-size: 13px;
}

#calendar .days li {
    height: 180px;
}

#calendar .days li:hover {
    background: #d3d3d3;
}

#calendar .date {
    text-align: center;
    margin-bottom: 5px;
    padding: 4px;
    background: #333;
    color: #fff;
    width: 20px;
    border-radius: 50%;
    float: left;
}

#calendar .event {
    clear: both;
    display: block;
    font-size: 13px;
    border-radius: 4px;
    padding: 5px;
    margin-top: 40px;
    margin-bottom: 5px;
    line-height: 14px;
    background: #e4f2f2;
    border: 1px solid #b5dbdc;
    color: #009aaf;
    text-decoration: none;
}

#calendar .event-desc {
    color: #666;
    margin: 3px 0 7px 0;
    text-decoration: none;  
}

#calendar .other-month {
    background: #f5f5f5;
    color: #666;
}

/* ============================
                Mobile Responsiveness
   ============================*/


@media(max-width: 768px) {

    #calendar .weekdays, #calendar .other-month {
        display: none;
    }

    #calendar li {
        height: auto !important;
        border: 1px solid #ededed;
        width: 100%;
        padding: 10px;
        margin-bottom: -1px;
    }

    #calendar .date {
        float: none;
    }
}

</style>
<body>
<%
Calendar cal = Calendar.getInstance();
cal.set(Calendar.DATE, 1);		// 1일

String syear = request.getParameter("year");
String smonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
if(nvl(syear) == false){	// 넘어온 파라메터가 있음
	year = Integer.parseInt(syear);
}

int month = cal.get(Calendar.MONTH) + 1;
if(nvl(smonth) == false){
	month = Integer.parseInt(smonth);
}

if(month < 1){
	month = 12;
	year--;
}
if(month > 12){
	month = 1;
	year++;
}

cal.set(year, month - 1, 1);	// 연월일을 셋팅

// 요일
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

// <<
String pp = String.format("<a href='%s?year=%d&month=%d'>" + 
							"<img src='image/left2.png'></a>", 
							"2_F_Calendar.jsp", year-1, month);

// <
String p = String.format("<a href='%s?year=%d&month=%d'>" + 
							"<img src='image/left1.png'></a>", 
							"2_F_Calendar.jsp", year, month-1);

// >
String n = String.format("<a href='%s?year=%d&month=%d'>" + 
							"<img src='image/right1.png'></a>", 
							"2_F_Calendar.jsp", year, month+1);

// >>
String nn = String.format("<a href='%s?year=%d&month=%d'>" + 
							"<img src='image/right2.png'></a>", 
							"2_F_Calendar.jsp", year+1, month);
/* 
FestiCalendarDto user = (FestiCalendarDto)session.getAttribute("login");
 */
 
iFestiCalendarDao dao = FestiCalendarDao.getInstance();
List<FestiCalendarDto> list 
/* 
	= dao.getCalendarList(user.getId(), year + two(month + ""));
 */
 	= dao.getCalendarList("idd", year + two(month + ""));
%>

<div id="calendar-wrap">
		<header>
        <h1><%=pp %>&nbsp;<%=p %><%=String.format("%d년&nbsp;&nbsp;%2d월", year, month) %>
        <%=n %>&nbsp;<%=nn %></h1>
            
            </header>
<div id="calendar">
                <ul class="weekdays">
					<li>Sunday</li>
               		<li>Monday</li>
                    <li>Tuesday</li>
                    <li>Wednesday</li>
                    <li>Thursday</li>
                    <li>Friday</li>
                    <li>Saturday</li>
</ul>

<!-- Days from previous month -->
<ul class="days">
<%
// 위쪽 빈칸
for(int i = 1; i < dayOfWeek; i++){
	%>
	<li class="day other-month">                 
    </li>
	<%
}

// 날짜
int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
for(int i = 1;i <= lastDay; i++){
	%>
	<li class="day">
                        <div class="date"><%=callist(year, month, i) %>&nbsp;		
	</div>             
	<div><%=showPen(year, month, i) %>
		<%=makeTable(year, month, i, list) %></div>         
                    </li>	
	<%
	/* 
	if((i + dayOfWeek - 1) % 7 == 0 && i != lastDay){
	}
	 */
}

// 밑칸
for(int i = 0;i < (7 - (dayOfWeek + lastDay - 1) % 7) % 7; i++){
	%>
	<li class="day other-month">                   
    </li>		
	<%
}
%>
</tr>
</ul>

</div>
</div>

</body>
</html>









