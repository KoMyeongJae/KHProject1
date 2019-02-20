package FestiCalendar.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FestiCalendar.FestiCalendarDao;
import FestiCalendar.FestiCalendarDto;
import FestiCalendar.iFestiCalendarDao;

public class FestiDetailCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -3728277710618900500L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String sseq = req.getParameter("seq");
		int seq = Integer.parseInt(sseq);

		iFestiCalendarDao dao = FestiCalendarDao.getInstance();

		FestiCalendarDto cal = dao.get_Festi(seq);

		req.setAttribute("cal", cal);
		
		req.getRequestDispatcher("2_F_detail.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
}
