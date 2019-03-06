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
<<<<<<< HEAD
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		iQABbsDao dao = QABbsDao.getInstance();		
	

		String sseq = req.getParameter("seq");
		int seq = Integer.parseInt(sseq);
		boolean count = dao.deleteQbs(seq);
	
		
		// db에 입력후 이동
		 if(count == true) {
			 
			req.setAttribute("seq", seq);
			req.getRequestDispatcher("3_QA_delete.jsp").forward(req, resp);
			System.out.println("삭제완료");
			
		 }
		else if(count == false) {
			System.out.println("삭제하지 못했습니다");

			resp.sendRedirect("3_QA_delete.jsp");
			}

	
	}
=======
	   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      
>>>>>>> branch 'KMJ' of https://github.com/KoMyeongJae/KHProject1.git

<<<<<<< HEAD
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
=======
	      iQABbsDao dao = QABbsDao.getInstance();      
	   

	      String sseq = req.getParameter("seq");
	      int seq = Integer.parseInt(sseq);
	      boolean count = dao.deleteQbs(seq);
	   
	      
	      // db에 입력후 이동
	      if(count == true) {
	    	  resp.sendRedirect("3_QA_list.jsp");
/*	         req.setAttribute("seq", seq);
	         req.getRequestDispatcher("3_QA_delete.jsp").forward(req, resp);
	         System.out.println("삭제완료");
*/	         
	       }
	      else if(count == false) {
	         System.out.println("삭제하지 못했습니다");

	         resp.sendRedirect("3_QA_delete.jsp");
	         }

	   
	   }

	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      super.doPost(req, resp);
	   }
>>>>>>> branch 'KMJ' of https://github.com/KoMyeongJae/KHProject1.git
	
	
}
