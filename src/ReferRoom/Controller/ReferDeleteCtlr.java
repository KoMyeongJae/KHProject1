package ReferRoom.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ReferRoom.ReferRoomDao;
import ReferRoom.iReferRoomDao;

public class ReferDeleteCtlr extends HttpServlet {
	
	private static final long serialVersionUID = 4867795648446726954L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
			String seqq = req.getParameter("seq");
			int seq = Integer.parseInt(seqq);
						
			iReferRoomDao dao = ReferRoomDao.getInstance();
			
			dao.delete_ReferR(seq);
			
			
			resp.sendRedirect("ReferListCtlr");
		}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
}
