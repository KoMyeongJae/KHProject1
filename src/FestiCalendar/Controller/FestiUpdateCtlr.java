package FestiCalendar.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FestiCalendar.FestiCalendarDao;
import FestiCalendar.iFestiCalendarDao;

public class FestiUpdateCtlr extends HttpServlet {
	
	private static final long serialVersionUID = 3640901118656052171L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		iFestiCalendarDao dao = FestiCalendarDao.getInstance();
		
		String seqq = req.getParameter("seq");
		int seq = Integer.parseInt(seqq);
		
		boolean b = dao.update_Festi();
		
		System.out.println("삭제 여부 = " + b);
		
		resp.sendRedirect("FestiDetailCtlr");
		*/
		
		// 수정 보류
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		super.doPost(req, resp);
	}
	
	
}
