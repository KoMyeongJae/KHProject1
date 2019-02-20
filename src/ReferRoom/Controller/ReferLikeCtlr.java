package ReferRoom.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ReferRoom.ReferRoomDao;
import ReferRoom.iReferRoomDao;

public class ReferLikeCtlr extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		iReferRoomDao dao = ReferRoomDao.getInstance();
		
		String seqq = req.getParameter("seq");
		int seq = Integer.parseInt(seqq);
		
		String id = req.getParameter("id");
		
		String msg = "";
		System.out.println("id = " + id + "seq = " +  seq);
		
		boolean b = dao.check_likeit(seq, id);
		
		if(b) {
			dao.del_likeit(seq);
			msg = "좋아요 해제!!";
		}
		else {
			dao.add_likeit_table(seq, id);
			dao.add_likeit(seq);
			msg = "좋아요!!";
		}
		
		// 짐싸!
		req.setAttribute("msg", msg);		
		// 잘가		
		req.getRequestDispatcher("ReferDetailCtlr").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
