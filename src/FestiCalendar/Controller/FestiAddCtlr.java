package FestiCalendar.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import FestiCalendar.FestiCalendarDao;
import FestiCalendar.FestiCalendarDto;
import FestiCalendar.iFestiCalendarDao;

import javax.servlet.http.HttpServletResponse;

public class FestiAddCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -6772124909188788919L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		super.doGet(req, resp);
	}

	public String two(String msg){
		return msg.trim().length()<2?"0"+msg:msg.trim();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		String i_title =new String(title.getBytes("8859_1"), "UTF-8");
		
		String i_content =new String(content.getBytes("8859_1"), "UTF-8");
		
		
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String day = req.getParameter("day");
		String hour = req.getParameter("hour");
		String min = req.getParameter("min");

		// 201902111338 <- rdate
		String rdate = year + two(month) + two(day) + two(hour) + two(min);

		iFestiCalendarDao dao = FestiCalendarDao.getInstance();

		boolean isS = dao.addCalendar(new FestiCalendarDto(id, i_title, i_content, rdate));

		String url = String.format("%s?year=%s&month=%s", 
									"2_F_Calendar.jsp", year, month);

		String msg;
		
		if(isS){
				msg = "성공적으로 일정을 추가하였습니다";
		}else{
				msg = "일정이 추가되지 않았습니다";
		}

		req.setAttribute("msg", msg);
		
		req.getRequestDispatcher(url).forward(req, resp);
	}
	
	
}
