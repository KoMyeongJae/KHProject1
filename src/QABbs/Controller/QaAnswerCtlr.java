package QABbs.Controller;

import java.io.IOException;
<<<<<<< HEAD
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QABbs.QABbsDao;
import QABbs.QABbsDto;
import QABbs.iQABbsDao;

public class QaAnswerCtlr extends HttpServlet{


	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		iQABbsDao dao = QABbsDao.getInstance();
		
		String id = req.getParameter("id");
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		String sseq = req.getParameter("seq");
		int seq = Integer.parseInt(sseq);

		String Spbpv = req.getParameter("pbpv"); 
		int pbpv = Integer.parseInt(Spbpv);
		 
		boolean count = dao.Q_answer(seq, new QABbsDto(id, title, content, pbpv));
		
		if(count == false) { System.out.println("추가되지 못했습니다");
		
		  resp.sendRedirect("3_QA_list.jsp");
		 
		 }
			req.setAttribute("seq", seq);
			req.setAttribute("id", id);
			req.setAttribute("title", title);
			req.setAttribute("content", content);
			req.setAttribute("pbpv",pbpv);
			req.getRequestDispatcher("3_QA_answerAf.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
=======
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QABbs.QABbsDao;
import QABbs.QABbsDto;
import QABbs.iQABbsDao;

public class QaAnswerCtlr extends HttpServlet{


   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      iQABbsDao dao = QABbsDao.getInstance();
      
      String id = req.getParameter("id");
      String title = req.getParameter("title");
      String content = req.getParameter("content");

      String sseq = req.getParameter("seq");
      int seq = Integer.parseInt(sseq);

      String Spbpv = req.getParameter("pbpv"); 
      int pbpv = Integer.parseInt(Spbpv);
       
      boolean count = dao.Q_answer(seq, new QABbsDto(id, title, content, pbpv));
      
      if(count) {
    	  resp.sendRedirect("3_QA_list.jsp");
    	  
      }else {
    	  PrintWriter pw = resp.getWriter();
			pw.println("<script>");
			pw.println("alert(\"답글 작성 실패\")");
			pw.println("history.back()");
			pw.println("</script>");
			pw.close();
			
			return;
      }
        
   }

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // TODO Auto-generated method stub
      super.doPost(req, resp);
   }
   
>>>>>>> branch 'KMJ' of https://github.com/KoMyeongJae/KHProject1.git
}
