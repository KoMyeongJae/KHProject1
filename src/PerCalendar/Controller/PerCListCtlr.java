package PerCalendar.Controller;

import java.io.IOException;

import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import PerCalendar.PerCalendarDao;
import PerCalendar.PerCalendarDto;
import PerCalendar.iPerCalendarDao;
import User.UserDto;




public class PerCListCtlr extends HttpServlet {
	
	private static final long serialVersionUID = 297174627828387770L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = null;
		session = req.getSession();
		
		UserDto user = (UserDto)session.getAttribute("login");
		
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String day = req.getParameter("day");

		System.out.println(year+" "+month+" "+day);
		
		String rdate = year + two(month) + two(day);
		
		iPerCalendarDao dao = PerCalendarDao.getInstance();
		List<PerCalendarDto> list = dao.getDayList(user.getId(), rdate);
		
		req.setAttribute("list", list);
		req.setAttribute("srdate", rdate);
		req.getRequestDispatcher("4_pc_callist.jsp").forward(req, resp);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
	}
	
	public String two(String msg){
		return msg.trim().length()<2?"0"+msg:msg.trim();
	}
}
