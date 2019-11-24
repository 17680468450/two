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
//		修改密码
		if("pwd".equals(type)){
			Password(request, response, user);
//			修改用户信息
		}else if ("user".equals(type)) {
			Information(request,response,user);
		}
		out.flush();
		out.close();
	}
	
//	修改密码
private void Password(HttpServletRequest request, HttpServletResponse response,User user) throws IOException {
	user.setU_pwd(Integer.valueOf(request.getParameter("one_pwd")));
//	修改数据库
	if(UserDao.updateUser(user)){
		response.getWriter().write("<script>"
				+ "alert('修改成功');"
				+ "location.href='person/password.jsp'"
				+ "</script>");
	}else {
		response.getWriter().write("<script>"
				+ "alert('修改失败');"
				+ "location.href='person/password.jsp'"
				+ "</script>");
	}	
	}
	//	修改用户信息
	private void Information(HttpServletRequest request, HttpServletResponse response,User user) throws ServletException, IOException {
		
//		1.创建smartupLoad
		SmartUpload upload = new SmartUpload();
//		2.设置编码格式
		upload.setCharset("utf-8");
//		3.初始化上传工具
		upload.initialize(this.getServletConfig(),request,response);
//		4.上传表单内容至smartupload
		try {
			upload.upload();
		} catch (Exception e) {
			e.printStackTrace();
		}
//		5.获取表单保存图片
		File file = upload.getFiles().getFile(0);
//		6.保存图片--------必须保证文件夹存在
		if (file != null) {
			try {
				file.saveAs("images/user/"+user.getU_id()+".jpg");
		} catch (Exception e) {
				e.printStackTrace();
			}
		}
//	获取用户信息
		user.setU_nickname(upload.getRequest().getParameter("u_nickname"));
		user.setU_name(upload.getRequest().getParameter("u_name"));
		user.setU_sex(upload.getRequest().getParameter("radio10"));
		user.setU_birth(upload.getRequest().getParameter("u_birth"));
		user.setU_phone(upload.getRequest().getParameter("u_phone"));
		user.setU_email(upload.getRequest().getParameter("u_email"));
		if(file.getSize() != 0){
			user.setU_url("/images/user/"+user.getU_id()+".jpg");
		}
//		修改数据库
		if(UserDao.updateUser(user)){
//			修改成功
			response.getWriter().write("<script>"
					+ "alert('修改成功');"
					+ "location.href='person/information.jsp'"
					+ "</script>");
//			修改失败
		}else {
			response.getWriter().write("<script>"
					+ "alert('修改失败');"
					+ "location.href='person/information.jsp'"
					+ "</script>");
		}
		
	}

}
