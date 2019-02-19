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
	
	private static final long serialVersionUID = -9167729097211571956L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		iQABbsDao dao = QABbsDao.getInstance();
		;
		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		req.setAttribute("id", id);
		req.setAttribute("title", title);
		req.setAttribute("content", content);
												
			boolean count = dao.writeQAB(new QABbsDto(id,title,content));
			
			if(count == false) {
				System.out.println("추가되지 못했습니다");
				resp.sendRedirect("3Q_list.jsp");
			}
			resp.sendRedirect("3Q_writeAf.jsp");
		
		
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
	
	
}
