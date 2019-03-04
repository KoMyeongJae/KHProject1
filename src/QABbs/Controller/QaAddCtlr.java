package QABbs.Controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
	      iQABbsDao dao = QABbsDao.getInstance();                              
	      String command = req.getParameter("command");

	      // DB에 입력 후 이동
	      if(command.equals("addAf")) {   
	         
	         System.out.println("QaAddCtlr addAf");
	         String id = req.getParameter("id");
	         String title = req.getParameter("title");
	         String content = req.getParameter("content");
	         
	         String Spbpv = req.getParameter("pbpv"); 
	         int pbpv = Integer.parseInt(Spbpv);
	          
	         
	         System.out.println(id);
	         System.out.println(title);
	         System.out.println(content);
	         System.out.println(pbpv); 
	         
	         boolean count =dao.writeQAB(new QABbsDto(id, title, content,pbpv));

	         System.out.println("writeQAB 해결 결과 count?t:f = " + count);
	         
	         if(count) {
	        	 resp.sendRedirect("3_QA_list.jsp");
	         }else {
	        	 System.out.println("Q&A 추가 실패");
	        	 
	        	 PrintWriter pw = resp.getWriter();
	        	 pw.println("<script>");
	        	 pw.println("alert(\"추가 실패\")");
	        	 pw.println("history.back()");
	        	 pw.println("</script>");
	        	 pw.close();
	        	 return;
	         }
/*	         
	           if(count == false) { System.out.println("추가되지 못했습니다");
	           
	           resp.sendRedirect("3_QA_write.jsp");
	          
	          }
	           
	           resp.sendRedirect("QaSearchCtlr");
*/	          
	      
	      }
	   }

	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      super.doPost(req, resp);
	   }
	
}
