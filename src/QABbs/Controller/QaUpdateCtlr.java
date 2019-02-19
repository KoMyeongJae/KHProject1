package QABbs.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QABbs.QABbsDao;
import QABbs.iQABbsDao;

public class QaUpdateCtlr extends HttpServlet {
	
	private static final long serialVersionUID = 9154523597564847097L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		iQABbsDao dao = QABbsDao.getInstance();
		
		
		
		String sseq = req.getParameter("seq");
		int seq = Integer.parseInt(sseq);
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		req.setAttribute("seq", seq);
		req.setAttribute("title", title);
		req.setAttribute("content", content);
		
		boolean count = dao.updateQbs(seq, title, content);
		if(count == false){
			System.out.println("변경실패");
			resp.sendRedirect("3Q_detail.jsp");
		}
			
			System.out.println("변경완료");
			resp.sendRedirect("3Q_updateAf.jsp");
		
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
	
}
