package User.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.UserDao;
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
		boolean TF = dao.login_User(id, pwd);
		
		if(TF) {
			req.setAttribute("id", id);
			req.getRequestDispatcher("1_3MainPage.jsp").forward(req, resp);
		}else {
			PrintWriter pw = resp.getWriter();
			pw.println("<script>");
			pw.println("alert(\"You are wrong\")");
			pw.println("history.back()");
			pw.println("</script>");
			pw.close();
			
			resp.sendRedirect("1_1Login.jsp");
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
}
