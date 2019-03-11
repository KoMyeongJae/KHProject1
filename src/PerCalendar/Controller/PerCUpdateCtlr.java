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

public class PerCUpdateCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -8681738228850971230L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		String command = req.getParameter("command");
		
		int seq = Integer.parseInt(req.getParameter("seq"));
		System.out.println("seq = " + seq);
		
		iPerCalendarDao dao = PerCalendarDao.getInstance();
		PerCalendarDto dto = dao.getDay(seq);
		
		if(command.equals("update")) {
			req.setAttribute("update", dto);
			req.getRequestDispatcher("4_pc_update.jsp").forward(req, resp);
		}else if(command.equals("updateAf")){
			
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String rstartdate = req.getParameter("rstartdate");
			String renddate = req.getParameter("renddate");
			
			System.out.println("seq ="+ seq);
			System.out.println("title ="+ title);
			System.out.println("content ="+ content);
			System.out.println("rstartdate ="+ rstartdate);
			System.out.println("renddate ="+ renddate);
			
			 if(rstartdate.length()>8) {
		            rstartdate = rstartdate.substring(0, 4) + rstartdate.substring(6,8) + rstartdate.substring(10,12);
		         }
		         if(renddate.length()>8) {
		            renddate = renddate.substring(0, 4) + renddate.substring(6,8) + renddate.substring(10,12);
		         }
		         
		         System.out.println("rstartdate ="+ rstartdate);
		         System.out.println("renddate ="+ renddate);
		         
			boolean isS = dao.updatePerCalendar(new PerCalendarDto(seq,"",title,content,"",rstartdate,renddate));
			
			 if(!isS) {
					PrintWriter pw = resp.getWriter();
					pw.println("<script>");
					pw.println("alert(\"You are wrong\")");
					pw.println("history.back()");
					pw.println("</script>");
					pw.close();
				}
			  String url = "PerCDetailCtlr?seq="+seq;
			  resp.sendRedirect(url);
			}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
}
