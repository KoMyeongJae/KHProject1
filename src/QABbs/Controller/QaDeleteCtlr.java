package QABbs.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QABbs.QABbsDao;
import QABbs.iQABbsDao;

public class QaDeleteCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -2449117978091952460L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		iQABbsDao dao = QABbsDao.getInstance();
		
		String command = req.getParameter("command");
		
		//vie
		if(command.equals("delete")) {
			resp.sendRedirect("3_QA_list.jsp");
		}
		// db에 입력후 이동
		else if(command.equals("deleteAf")) {
			String sseq = req.getParameter("seq");
			int seq = Integer.parseInt(sseq);
			boolean count = dao.deleteQbs(seq);
		
		if(count == false) {
			System.out.println("추가되지 못했습니다");
			resp.sendRedirect("3_QA_list.jsp");
			}
			resp.sendRedirect("3_QA_list.jsp");
		}
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
}
