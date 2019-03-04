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

public class ReferSearchCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -7586874660803456496L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("doGet");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("doPost");
		
		String choice = req.getParameter("choice");
		String search = req.getParameter("search");
		
		System.out.println(choice + "  " + search);
		
		iReferRoomDao dao = ReferRoomDao.getInstance();
		
		
			String conver =new String(search.getBytes("8859_1"), "UTF-8");
			System.out.println(conver);
		
		// Db로 가서 데이터를 갖고 온다
		List<ReferRoomDto> referlist = dao.searchList(choice, conver);		
		System.out.println(referlist.toString());
		// 짐싸!
		req.setAttribute("referlist", referlist);		
		// 잘가		
		req.getRequestDispatcher("2_R_list.jsp").forward(req, resp);
		
		
		
		
	}
	
	
}
