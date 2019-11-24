package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.jni.Time;

import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import dao.UserDao;
import pojo.User;
import sun.security.util.Password;

/**
 * Servlet implementation class InformationServlet
 */
@WebServlet("/InformationServlet")
public class InformationServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		User user = (User) request.getSession().getAttribute("users");
		System.out.println(user);
		String type = request.getParameter("type");
//		�޸�����
		if("pwd".equals(type)){
			Password(request, response, user);
//			�޸��û���Ϣ
		}else if ("user".equals(type)) {
			Information(request,response,user);
		}
		out.flush();
		out.close();
	}
	
//	�޸�����
private void Password(HttpServletRequest request, HttpServletResponse response,User user) throws IOException {
	user.setU_pwd(Integer.valueOf(request.getParameter("one_pwd")));
//	�޸����ݿ�
	if(UserDao.updateUser(user)){
		response.getWriter().write("<script>"
				+ "alert('�޸ĳɹ�');"
				+ "location.href='person/password.jsp'"
				+ "</script>");
	}else {
		response.getWriter().write("<script>"
				+ "alert('�޸�ʧ��');"
				+ "location.href='person/password.jsp'"
				+ "</script>");
	}	
	}
	//	�޸��û���Ϣ
	private void Information(HttpServletRequest request, HttpServletResponse response,User user) throws ServletException, IOException {
		
//		1.����smartupLoad
		SmartUpload upload = new SmartUpload();
//		2.���ñ����ʽ
		upload.setCharset("utf-8");
//		3.��ʼ���ϴ�����
		upload.initialize(this.getServletConfig(),request,response);
//		4.�ϴ���������smartupload
		try {
			upload.upload();
		} catch (Exception e) {
			e.printStackTrace();
		}
//		5.��ȡ������ͼƬ
		File file = upload.getFiles().getFile(0);
//		6.����ͼƬ--------���뱣֤�ļ��д���
		if (file != null) {
			try {
				file.saveAs("images/user/"+user.getU_id()+".jpg");
		} catch (Exception e) {
				e.printStackTrace();
			}
		}
//	��ȡ�û���Ϣ
		user.setU_nickname(upload.getRequest().getParameter("u_nickname"));
		user.setU_name(upload.getRequest().getParameter("u_name"));
		user.setU_sex(upload.getRequest().getParameter("radio10"));
		user.setU_birth(upload.getRequest().getParameter("u_birth"));
		user.setU_phone(upload.getRequest().getParameter("u_phone"));
		user.setU_email(upload.getRequest().getParameter("u_email"));
		if(file.getSize() != 0){
			user.setU_url("/images/user/"+user.getU_id()+".jpg");
		}
//		�޸����ݿ�
		if(UserDao.updateUser(user)){
//			�޸ĳɹ�
			response.getWriter().write("<script>"
					+ "alert('�޸ĳɹ�');"
					+ "location.href='person/information.jsp'"
					+ "</script>");
//			�޸�ʧ��
		}else {
			response.getWriter().write("<script>"
					+ "alert('�޸�ʧ��');"
					+ "location.href='person/information.jsp'"
					+ "</script>");
		}
		
	}

}
