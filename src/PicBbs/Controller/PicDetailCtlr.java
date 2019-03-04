package PicBbs.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import PicBbs.PicBbsDao;
import PicBbs.PicBbsDto;
import PicBbs.iPicBbsDao;

public class PicDetailCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -1062098853447021457L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getParameter("command");
		int seq = Integer.parseInt(req.getParameter("seq"));
		
		System.out.println(command);
		
		if(command.equals("detail_view")) {
			
			System.out.println("seq:" + seq);
			resp.sendRedirect("1_6PicBbsDetail.jsp?seq="+seq);
//			req.setAttribute("seq", seq);
//			req.getRequestDispatcher("1_6PicBbsDetail.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
}
