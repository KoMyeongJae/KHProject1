package QABbs.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QABbs.QABbsDao;
import QABbs.iQABbsDao;

public class QaUpdateCtlr extends HttpServlet {
	
	private static final long serialVersionUID = 9154523597564847097L;

	@Override
	   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setCharacterEncoding("utf-8");
			resp.setContentType("text/html; charset=utf-8");

	      iQABbsDao dao = QABbsDao.getInstance();
	            
	      String sseq = req.getParameter("seq");
	      int seq = Integer.parseInt(sseq);
	      String title = req.getParameter("title");
	      String content = req.getParameter("content");
	      
	      
	      boolean count = dao.updateQbs(seq, title, content);
	      if(count){
	    	  
	    	  resp.sendRedirect("3_QA_detail.jsp?seq="+seq);
	    	  
	      }else {
	    	  System.out.println("변경실패");
	    	  PrintWriter pw = resp.getWriter();
	    	  pw.println("<script>");
	    	  pw.println("alert(\"수정 실패\")");
	    	  pw.println("history.back()");
	    	  pw.println("</script>");
	    	  pw.close();
	    	  
	    	  return;
	      }
	         
	         
	   }

	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      super.doPost(req, resp);
	   }
	
}
