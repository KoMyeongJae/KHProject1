package User.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.UserDao;
import User.UserDto;
import User.iUserDao;

public class UserAddCtlr extends HttpServlet {
	
	private static final long serialVersionUID = 5446567713880366486L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String command = req.getParameter("command");
		System.out.println(command);
		
		if(command.equals("add")) {
			resp.sendRedirect("1_2Register.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String command = req.getParameter("command");
		System.out.println(command);
		
		if(command.equals("addAf")) {
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			String name = req.getParameter("name");
			String birth = req.getParameter("birth");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String address[] = req.getParameterValues("address");
			String likeit_info = "";
			
			UserDto dto = new UserDto(id, pwd, name, email, birth, phone, address, 3, 3, likeit_info);
			
			iUserDao dao = UserDao.getInstance();
			boolean isS = dao.add_User(dto);
			
			if(isS) {
				resp.sendRedirect("1_1Login.jsp");
			}else {
				resp.sendRedirect("1_2Register.jsp");
			}
		}
	}
	
	
}
