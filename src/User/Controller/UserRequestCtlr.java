package User.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.RequestDto;
import User.UserDao;
import User.iUserDao;

public class UserRequestCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -2889138974784692465L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String message = req.getParameter("message");
		
		System.out.println(id+"  "+name+"  "+email+"  "+message);
		
		iUserDao dao = UserDao.getInstance();
		boolean isS = dao.addRequset(new RequestDto(id, name, email, message));
		System.out.println(isS);
		if(isS) {
			resp.sendRedirect("1_3MainPage.jsp?msg=asd");
		}else {
			
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
	
}
