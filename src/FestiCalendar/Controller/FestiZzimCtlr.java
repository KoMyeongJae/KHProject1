package FestiCalendar.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FestiCalendar.FestiCalendarDao;
import FestiCalendar.iFestiCalendarDao;

public class FestiZzimCtlr extends HttpServlet {
	
	private static final long serialVersionUID = 4285780495318247358L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		String command = req.getParameter("command");
		String id = req.getParameter("id");
		int seq = Integer.parseInt(req.getParameter("seq"));
		iFestiCalendarDao dao = FestiCalendarDao.getInstance();
		
		if(command.equals("zzim")) {
			
			boolean isS = dao.addZzimlist(seq, id);
			
			if(isS) {
				PrintWriter pw = resp.getWriter();
				pw.println("<script>");
				pw.println("history.back()");
				pw.println("</script>");
				pw.close();
				
				return;
			}else {
				PrintWriter pw = resp.getWriter();
				pw.println("<script>");
				pw.println("history.back()");
				pw.println("alert(\"이미 찜한 글입니다\")");
				pw.println("</script>");
				pw.close();
				return;
			}
		}else if(command.equals("delZzim")) {
			boolean isS = dao.delZzim(seq, id);
			if(isS) {
				resp.sendRedirect("4_pc_calendar.jsp");
			}else {
				
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
	
}
