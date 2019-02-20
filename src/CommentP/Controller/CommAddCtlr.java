package CommentP.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ReferRoom.ReferRoomDao;
import ReferRoom.iReferRoomDao;

public class CommAddCtlr extends HttpServlet {

	private static final long serialVersionUID = -4874736589137970601L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("get");

		String seq = req.getParameter("seq");
		String n_seq = req.getParameter("r_seq");
		
		System.out.println(seq + " " + n_seq);
		// 이제 추가해줄거야
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		super.doPost(req, resp);
	}
	
	
}
