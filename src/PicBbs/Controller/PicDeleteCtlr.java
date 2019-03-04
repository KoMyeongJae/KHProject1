package PicBbs.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import PicBbs.PicBbsDao;
import PicBbs.iPicBbsDao;

public class PicDeleteCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -1691256374022823915L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getParameter("command");
		int seq = Integer.parseInt(req.getParameter("seq"));
		
		if(command.equals("delete")) {
			iPicBbsDao dao = PicBbsDao.getInstance();
			boolean isS = dao.deletePic(seq);
			
			if(isS) {
				resp.sendRedirect("1_6PicBbsList.jsp");
			}else {
				PrintWriter pw = resp.getWriter();
				pw.println("<script>");
				pw.println("alert(\"작성 실패\")");
				pw.println("history.back()");
				pw.println("</script>");
				pw.close();
				
				return;
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
}
