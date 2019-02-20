package FestiCalendar.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FestiCalendar.FestiCalendarDao;
import FestiCalendar.FestiCalendarDto;
import FestiCalendar.iFestiCalendarDao;

public class FestiListCtlr extends HttpServlet {
	
	private static final long serialVersionUID = 2554103554028349257L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String day = req.getParameter("day");

		String s = year + two(month) + two(day);
		
		iFestiCalendarDao dao = FestiCalendarDao.getInstance();

		List<FestiCalendarDto> list = dao.getdaylist(s);

		req.setAttribute("list", list);
		
		req.getRequestDispatcher("2_F_list.jsp").forward(req, resp);
		
	}

	public String two(String msg){
		return msg.trim().length()<2?"0"+msg:msg.trim();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}



}
