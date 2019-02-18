package User.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.UserDao;
import User.UserDto;
import User.iUserDao;

public class UserLoginCtlr extends HttpServlet {
	
	private static final long serialVersionUID = 8264036838136650793L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		System.out.println("id : " + id + ", pwd : " + pwd);
		
		
		
		iUserDao dao = UserDao.getInstance();
		UserDto dto = dao.login_User(new UserDto(id, pwd, null, null, null, null, null, 0, 0, null));
		
		if(dto != null && !dto.getId().equals("")) {
			req.setAttribute("login", dto);
			req.getRequestDispatcher("1_3MainPage.jsp").forward(req, resp);
		}
		else {
			PrintWriter pw = resp.getWriter();
			pw.println("<script>");
			pw.println("alert(\"You are wrong\")");
			pw.println("history.back()");
			pw.println("</script>");
			pw.close();
			
			return;
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
}
