package servlet;
//��¼ҳ��
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import pojo.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		
		String type = request.getParameter("type");
		if(type == null){
			register(request,response,out);
		}else if ("logout".equals(type)) {
			logout(request,response,out);
		}

		
		out.flush();
		out.close();
	}

	private void logout(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws IOException {
		request.getSession().removeAttribute("users");
		response.sendRedirect("home/home.jsp");
	}

	private void register(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws IOException {
		String user = request.getParameter("u_account");
		String password = request.getParameter("u_pwd");
		User users = UserDao.checkLogin(user, password);
		if (users != null) {
			//��ȡ��ѡ��
			String comfig = request.getParameter("comfig");
			//�жϸ�ѡ���Ƿ�ѡ��
			if(comfig != null){
				//����cookie
				Cookie cook_user = new Cookie("user", user);
				Cookie cook_pwd = new Cookie("password", password);
//				//��Ӧ���û�
				response.addCookie(cook_user);
				response.addCookie(cook_pwd);
			}else{
				//����Cookie
				Cookie cook_user = new Cookie("user", "");
				Cookie cook_pwd = new Cookie("password", "");
				//��Ӧ���û�
				response.addCookie(cook_user);
				response.addCookie(cook_pwd);
			}
			request.getSession().setAttribute("users", users);
			response.sendRedirect("home/home.jsp");
		}else{
			out.write("<script>"
					+ "alert('�˺��������');"
					+ "location.href = 'home/login.jsp';"
					+ "</script>");
			return;
		}
	}

}