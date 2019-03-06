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

public class UserUpdate extends HttpServlet {
	
	private static final long serialVersionUID = 9005251226645896066L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		req.setCharacterEncoding("utf-8");
		
		String command = req.getParameter("command");
		String id = req.getParameter("id");
		System.out.println(id);
		
		iUserDao dao = UserDao.getInstance();
		UserDto user = dao.detail_User(id);
		
		
		if(command.equals("update_view")) {
			
			req.setAttribute("detail_user", user);
			req.getRequestDispatcher("1_4UpdateUser.jsp").forward(req, resp);
			
		}else if(command.equals("update_user")){
			
			String name = req.getParameter("name");
			String birth = req.getParameter("birth");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String array[] = req.getParameterValues("address");
			String address = "";
			for(int i = 0; i < array.length; i++) {
				address += array[i].toString() + "_";
			}
						
			boolean isS = dao.update_User(name, birth, email, phone, address, id);
			
			if(isS) {
				resp.sendRedirect("1_3MainPage.jsp");
			}else {
				PrintWriter pw = resp.getWriter();
				pw.println("<script>");
				pw.println("alert(\"수정 실패\")");
				pw.println("history.back()");
				pw.println("</script>");
				pw.close();
				
				return;
			}
		} else if(command.equals("update_pwd_view")) {
			req.setAttribute("detail_user", user);
			req.getRequestDispatcher("1_4UpdatePwd.jsp").forward(req, resp);
			
		} else if(command.equals("update_pwd")) {
			String id1 = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			
			boolean isS1 = dao.update_pwd_User(pwd, id1);
			
			if(isS1) {
				resp.sendRedirect("1_3MainPage.jsp");
			}else {
				PrintWriter pw = resp.getWriter();
				pw.println("<script>");
				pw.println("alert(\"수정 실패\")");
				pw.println("history.back()");
				pw.println("</script>");
				pw.close();
				
				return;
			}
			
		}
	}
	
}
