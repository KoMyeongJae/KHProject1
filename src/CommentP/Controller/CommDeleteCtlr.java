package CommentP.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import CommentP.CommentPDao;
import CommentP.iCommentPDao;

public class CommDeleteCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -8996318455225398281L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getParameter("command");
		int seq = Integer.parseInt(req.getParameter("seq"));
		int bbs_seq = Integer.parseInt(req.getParameter("bbs_seq"));
		
		iCommentPDao dao = CommentPDao.getInstance();
		
		if(command.equals("del")) {
			boolean isS = dao.deleteComment(seq);
			if(isS) {
				resp.sendRedirect("1_6PicBbsDetail.jsp?seq=" + bbs_seq);
			}else {
				PrintWriter pw = null;
				pw = resp.getWriter();
				pw.println("<script>");
				pw.println("alert(\"댓글 삭제 실패\")");
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
