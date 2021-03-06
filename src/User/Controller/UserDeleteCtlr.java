package User.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.UserDao;
import User.iUserDao;

public class UserDeleteCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -5873386509203662137L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		
		iUserDao dao = UserDao.getInstance();
		dao.delete_User(id);
		resp.sendRedirect("1_1Login.jsp");
	}
	
	
}
