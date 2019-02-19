package QABbs.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QABbs.QABbsDao;
import QABbs.QABbsDto;
import QABbs.iQABbsDao;

public class QaSearchCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -6759405979133856030L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		iQABbsDao dao = QABbsDao.getInstance();
		
		//db로 가서 데이터를 가져온다
		String searchWord = req.getParameter("searchWord");
		String choice = req.getParameter("choice");
		List<QABbsDto> list = dao.getQABbsSearchList(searchWord, choice);
		
		req.setAttribute("3Q_list",list);
		
		req.getRequestDispatcher("3Q_list.jsp").forward(req, resp);
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
}
