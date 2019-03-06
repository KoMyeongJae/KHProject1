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
<<<<<<< HEAD
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		iQABbsDao dao = QABbsDao.getInstance();
		
		String searchWord = "";
		String choice = "sel";
		
		
		List<QABbsDto> list = dao.getQABbsSearchList(searchWord, choice);
		System.out.println(list.toString());
		
		
		req.setAttribute("3Q_list",list);
		
		req.getRequestDispatcher("3_QA_list.jsp").forward(req, resp);
		
		
	}
=======
	   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      
	      iQABbsDao dao = QABbsDao.getInstance();
	      
	      String searchWord = "";
	      String choice = "sel";
	      
	      
	      List<QABbsDto> list = dao.getQABbsSearchList(searchWord, choice);
	      System.out.println(list.toString());
	      
	      
	      req.setAttribute("3Q_list",list);
	      
	      req.getRequestDispatcher("3_QA_list.jsp").forward(req, resp);
	      
	      
	   }
>>>>>>> branch 'KMJ' of https://github.com/KoMyeongJae/KHProject1.git

	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      // TODO Auto-generated method stub
	      super.doPost(req, resp);
	   }
	
	
}