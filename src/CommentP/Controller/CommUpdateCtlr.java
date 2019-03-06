package CommentP.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import CommentP.CommentPDao;
import CommentP.iCommentPDao;

public class CommUpdateCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -6587082371033354700L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		String command = req.getParameter("command");
		System.out.println("command : " + command);
		// comment seq (20)
		int seq = Integer.parseInt(req.getParameter("seq"));
		System.out.println("comment seq : " + seq);
		
		// detail seq (41)
		int bbs_seq = Integer.parseInt(req.getParameter("bbs_seq"));
		System.out.println("bbs seq : " + bbs_seq);
		
		String content = req.getParameter("content");
		
		iCommentPDao dao = CommentPDao.getInstance();
		
		if(command.equals("upd_view")) {
			req.setAttribute("seq", bbs_seq); // seq : detail seq (41)
			req.setAttribute("bbs_seq", seq); // bbs_seq : comment seq (20)
			req.getRequestDispatcher("1_7CommetnUpdatePicBbs.jsp").forward(req, resp);
		}
		else if(command.equals("upd")) {
//			int seq1 = Integer.parseInt(req.getParameter("seq1"));
//			String bbs_seq1 = req.getParameter("bbs_seq1");
			
			
			System.out.println("seq : " + seq + ", bbs_seq : " + bbs_seq + ", content : " + content);
			
			boolean isS = dao.updateComment(seq, content);
			if(isS) {
				resp.sendRedirect("1_6PicBbsDetail.jsp?seq=" + bbs_seq);
			}else {
				PrintWriter pw = null;
				pw = resp.getWriter();
				pw.println("<script>");
				pw.println("alert(\"댓글 수정 실패\")");
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
