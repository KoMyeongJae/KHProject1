package ReferRoom.Controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import ReferRoom.ReferRoomDao;
import ReferRoom.ReferRoomDto;
import ReferRoom.iReferRoomDao;

public class ReferAddCtlr extends HttpServlet {
	
	private static final long serialVersionUID = -8725052050012267486L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	public String processUploadFile(FileItem fileItem, String dir) throws IOException{
		   
		   String fileName = fileItem.getName();
		   long sizeInBytes = fileItem.getSize();
		   
		   // 파일이 정상일 때
		   if(sizeInBytes > 0){   // d:\\tmp\\abc.txt
		      
		      int idx = fileName.lastIndexOf("\\");
		      if(idx == -1){         
		         idx = fileName.lastIndexOf("/");
		      }
		      fileName = fileName.substring(idx + 1);   // abc.txt
		      
		      try{
		         File uploadFile = new File(dir, fileName);
		         fileItem.write(uploadFile);   // 실제 올려주는 부분
		      }catch(Exception e){}      
		   }
		   
		   return fileName;
		}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("doPost");
		
		int yourMaxRequestSize = 100 * 1024 * 1024;      // 1M
		int yourMaxMemorySize = 100 * 1024;
		

		// form field 의 데이터(String)
		String id = "";
		String title = "";
		String content = "";

		// file data
		String filename = "";

		/*
		String path = req.getServletContext().getRealPath("/upload");
		*/
		
		String path = "d:\\tmp";
		/*
		System.out.println(path);
		MultipartRequest mreq = new MultipartRequest(req, path);
		Enumeration t = mreq.getParameterNames();
		*/
		/*
		while(t.hasMoreElements()) {
			String name = (String)t.nextElement();
			String conver =new String(mreq.getParameter(name).getBytes("8859_1"), "UTF-8");
			System.out.println(name + " : " + mreq.getParameter(name) + " : " + conver);
		}
		*/
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		System.out.println(isMultipart);
		if(isMultipart){
		
		// FileItem 을 생성하는 함수
		   DiskFileItemFactory factory = new DiskFileItemFactory();
		   
		   factory.setSizeThreshold(yourMaxMemorySize);
		   factory.setRepository(new File(path));
		   
		   ServletFileUpload upload = new ServletFileUpload(factory);
		   upload.setSizeMax(yourMaxRequestSize);
		      
		   // list저장
		   List<FileItem> items = null;
		try {
			items = upload.parseRequest(req);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   Iterator<FileItem> it = items.iterator();
		   
		   while(it.hasNext()){
		      
		      FileItem item = it.next();
		      // id, title, content
		      if(item.isFormField()){
		         if(item.getFieldName().equals("id")){
		        	id = item.getString("utf-8");
		         }
		         else if(item.getFieldName().equals("title")){
		            title = item.getString("utf-8");
		         }
		         else if(item.getFieldName().equals("content")){
		            content = item.getString("utf-8");
		         }
		      }
		      // file
		      else{
		         if(item.getFieldName().equals("fileload")){
		            filename = processUploadFile(item, path);
		            System.out.println("path:" + path);
		         }         
		      }   
		   }
		   
	}
		iReferRoomDao dao = ReferRoomDao.getInstance();

		boolean isS = dao.add_ReferR(new ReferRoomDto(id, title, content, filename));
		
		resp.sendRedirect("ReferListCtlr");
	}
	
	
}
