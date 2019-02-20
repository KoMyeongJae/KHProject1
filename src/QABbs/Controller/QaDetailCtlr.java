package QABbs.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QABbs.QABbsDao;
import QABbs.QABbsDto;
import QABbs.iQABbsDao;

public class QaDetailCtlr extends HttpServlet {
	
	private static final long serialVersionUID = 7833045086108262029L;


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		iQABbsDao dao = QABbsDao.getInstance();
				
		String sseq = req.getParameter("seq");
		int seq = Integer.parseInt(sseq);
		System.out.println(seq);
		
		QABbsDto count = dao.getQbs(seq);
		req.setAttribute("seq", seq);
		
		if(count == null){
			System.out.println("Detail 출력 실패");
			resp.sendRedirect("3_QA_list.jsp");
		}
			
			System.out.println("Detail 출력 성공");
			resp.sendRedirect("3_QA_detail.jsp");
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
}
