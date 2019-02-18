package QABbs.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QABbs.QABbsDao;
import QABbs.QABbsDto;
import QABbs.iQABbsDao;

public class QaAddCtlr extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		iQABbsDao dao = QABbsDao.getInstance();
		
		String command = req.getParameter("command");
		
		//view
		if(command.equals("add")) {
			resp.sendRedirect("3_QA_write.jsp");
		}
		// DB에 입력 후 이동
		else if(command.equals("addAf")) {			
			
			boolean count = dao.writeQAB(new QABbsDto());
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

		super.doPost(req, resp);
	}
	
	
}
