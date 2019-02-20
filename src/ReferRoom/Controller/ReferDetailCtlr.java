package ReferRoom.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ReferRoom.ReferRoomDao;
import ReferRoom.ReferRoomDto;
import ReferRoom.iReferRoomDao;

public class ReferDetailCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -4230385300904163766L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		iReferRoomDao dao = ReferRoomDao.getInstance();
		
		String command = req.getParameter("command");
		
		String seqq = req.getParameter("seq");
		int seq = Integer.parseInt(seqq);
		
		// Db로 가서 데이터를 갖고 온다
		ReferRoomDto rfr = dao.detail_ReferR(seq);		
		
		String msg = (String)req.getAttribute("msg");
		
		if(msg != null) {
			req.setAttribute("msg", msg);
		}
		
		// 짐싸!
		req.setAttribute("rfr", rfr);		
		
		// 잘가
		if( command != null && !"".equals(command) ){
			req.getRequestDispatcher("2_R_update.jsp").forward(req, resp);
		}else {
			req.getRequestDispatcher("2_R_detail.jsp").forward(req, resp);
		}
		
		
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
}
