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

public class PerCAddCtlr extends HttpServlet {
	
	private static final long serialVersionUID = 7072597790801264782L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  
	  req.setCharacterEncoding("utf-8");
	  
	  String id = req.getParameter("id");
	  String title = req.getParameter("title");
	  String content = req.getParameter("content");
	  
	  String rstartdate = req.getParameter("rstartdate");
	  String renddate = req.getParameter("renddate");
	  
	  if(renddate == null || renddate == "") {
		  renddate = rstartdate;
	  }
	  
	  System.out.println(id+" "+title+" "+content);
	  System.out.println("rstartdate = " + rstartdate +"renddate = "+renddate);
	  
	  iPerCalendarDao dao = PerCalendarDao.getInstance();
	  boolean isS = dao.addPerCalendar(new PerCalendarDto(id,title,content,rstartdate,renddate));
	  
	  if(!isS) {
			PrintWriter pw = resp.getWriter();
			pw.println("<script>");
			pw.println("alert(\"You are wrong\")");
			pw.println("history.back()");
			pw.println("</script>");
			pw.close();
		}
	  
	  String url = String.format("%s?year=%s&month=%s","4_pc_calendar.jsp",rstartdate.substring(0,4),rstartdate.substring(4,6));
	  
	  resp.sendRedirect(url);
	}
	
	
}
