package User.Controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.UserDao;
import User.UserDto;
import User.iUserDao;

public class UserDetailCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -6703955650247809854L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		iUserDao dao = UserDao.getInstance();
		UserDto user = dao.detail_User(id);
		
		req.setAttribute("detail_user", user);
		req.getRequestDispatcher("1_4DetailUser.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
	
}
