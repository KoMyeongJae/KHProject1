package PerCalendar.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import PerCalendar.PerCalendarDao;
import PerCalendar.PerCalendarDto;
import PerCalendar.iPerCalendarDao;

public class PerCDeleteCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -4115441955676159788L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		int seq = Integer.parseInt(req.getParameter("seq"));
		
		iPerCalendarDao dao = PerCalendarDao.getInstance();
		boolean isS = dao.deletePerCalendar(seq);

		
		resp.sendRedirect("4_pc_calendar.jsp");
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	public String toOne(String msg){
			return msg.substring(0, 1).equals("0")?msg.substring(1):msg.trim();
		}
	
	
}
