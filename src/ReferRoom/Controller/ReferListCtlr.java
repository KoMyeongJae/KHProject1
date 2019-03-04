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

public class ReferListCtlr extends HttpServlet {
	
	private static final long serialVersionUID = 5335791248481840638L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		iReferRoomDao dao = ReferRoomDao.getInstance();
		
		// Db로 가서 데이터를 갖고 온다
		List<ReferRoomDto> referlist = dao.get_ReferRoomList();		
		// 짐싸!
		req.setAttribute("referlist", referlist);		
		
		// 잘가		
		req.getRequestDispatcher("2_R_list.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
}
