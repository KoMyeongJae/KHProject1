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

public class QaListCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -4707482072553635676L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		iQABbsDao dao = QABbsDao.getInstance();
		
		//db로 가서 데이터를 가져온다		
		List<QABbsDto> list = dao.getQABbsList();	
		// 짐싸!
		req.setAttribute("3Q_list", list);
		
		// go
		req.getRequestDispatcher("3Q_list.jsp").forward(req, resp);
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}

	
}
