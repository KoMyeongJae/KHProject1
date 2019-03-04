package PerCalendar.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import PerCalendar.PerCalendarDao;
import PerCalendar.PerCalendarDto;
import PerCalendar.iPerCalendarDao;

public class PerCDetailCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -8812319474375012986L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int seq = Integer.parseInt(req.getParameter("seq"));
		
		iPerCalendarDao dao = PerCalendarDao.getInstance();
		PerCalendarDto dto = dao.getDay(seq);
		
		req.setAttribute("detail", dto);
		req.getRequestDispatcher("4_pc_detail1.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
}
