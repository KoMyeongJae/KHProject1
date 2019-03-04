package CommentP.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import CommentP.CommentPDao;
import CommentP.CommentPDto;
import CommentP.iCommentPDao;

public class CommAddCtlr extends HttpServlet {

	private static final long serialVersionUID = -4874736589137970601L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		String command = req.getParameter("command");
		String id = req.getParameter("id");
		int bbs_seq = Integer.parseInt(req.getParameter("bbs_seq"));
		String content_ba = req.getParameter("content");
//		String content = URLEncoder.encode(content_ba, "utf-8") ;
		
		System.out.println("id:" + id);
		System.out.println("content:" + content_ba);
		
		if(command.equals("addComment")) {			
			iCommentPDao dao = CommentPDao.getInstance();
			boolean isS = dao.addComment(new CommentPDto(0, id, content_ba, bbs_seq, "", 0));
			
			if(isS) {
//				req.setAttribute("seq", bbs_seq);
//				req.getRequestDispatcher("bbsDetail.jsp").forward(req, resp);
				resp.sendRedirect("1_6PicBbsDetail.jsp?seq=" + bbs_seq);
			}else {
				PrintWriter pw = null;
				pw = resp.getWriter();
				pw.println("<script>");
				pw.println("alert(\"댓글 입력에 실패\")");
				pw.println("history.back()");
				pw.println("</script>");
				pw.close();
				
				return;
			}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		super.doPost(req, resp);
	}
	
	
}
