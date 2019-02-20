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
	

		String sseq = req.getParameter("seq");
		int seq = Integer.parseInt(sseq);
		boolean count = dao.deleteQbs(seq);
		
		// db에 입력후 이동
		 if(count == true) {
			 
			req.setAttribute("seq", seq);
			System.out.println("삭제완료");
			resp.sendRedirect("3_QA_list.jsp");
		 }
		else if(count == false) {
			System.out.println("삭제하지 못했습니다");

			resp.sendRedirect("3_QA_list.jsp");
			}

	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
	
	
}
