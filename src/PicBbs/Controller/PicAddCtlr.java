package PicBbs.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import PicBbs.PicBbsDao;
import PicBbs.PicBbsDto;
import PicBbs.iPicBbsDao;

public class PicAddCtlr extends HttpServlet {
	
	private static final long serialVersionUID = 6312698176083262894L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getParameter("command");
		
		if(command.equals("PicAdd_view")) {
			resp.sendRedirect("1_6PicBbsWrite.jsp");
		}else if(command.equals("PicAdd")) {
			String id = req.getParameter("id");
			String title = req.getParameter("title");
			String content_b = req.getParameter("content");
			String content = content_b.replace("./upload/", "./smarteditor/upload/");
			
			// filename : 대표 이미지 [ DB 저장 ]
			String file_nameA = "";
			String file_nameB = "";
			String file_name = "";
			if(content.contains("./smarteditor/upload/")) {
				 file_nameA = "<img src";
				 int where_img = content.indexOf(file_nameA);
				 file_nameB = content.substring(where_img + file_nameA.length(), (content.substring(where_img).indexOf(">")+where_img + 1));
				 
				 String file_nameC = file_nameA + file_nameB;
					
				if(file_nameC.contains(".png")) {
					file_name = file_nameC.replace(".png\"", ".png\" style='height: 100%; width: 100%;'");
				}
				else if(file_nameC.contains(".jpg")) {
					file_name = file_nameC.replace(".jpg\"", ".jpg\" style='height: 100%; width: 100%;'");
				}
				else if(file_nameC.contains(".gif")) {
					file_name = file_nameC.replace(".gif\"", ".gif\" style='height: 100%; width: 100%;'");
				}
			 }else {
				 file_name = "대표 이미지 없음";
			 }
			
			
			
			System.out.println("fname" + file_name);
			
			PicBbsDto dto = new PicBbsDto(id, title, content, file_name);
			
			iPicBbsDao dao = PicBbsDao.getInstance();
			boolean isS = dao.addPic(dto);
			
			if(isS) {
				resp.sendRedirect("1_6PicBbsList.jsp");
			}else {
				PrintWriter pw = resp.getWriter();
				pw.println("<script>");
				pw.println("alert(\"작성 실패\")");
				pw.println("history.back()");
				pw.println("</script>");
				pw.close();
				
				return;
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
}
