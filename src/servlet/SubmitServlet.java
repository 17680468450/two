package servlet;
//ע�������
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import pojo.User;

@WebServlet("/SubmitServlet")
public class SubmitServlet extends HttpServlet {

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
		if("email".equals(type)){
			//����ע��
			emeli(request,response,out);
		}else if ("phone".equals(type)) {
			//�ֻ�����ע��
			phone(request,response,out);
		}
		
		out.flush();
		out.close();
	}

	private void phone(HttpServletRequest request, HttpServletResponse response, PrintWriter out) {
		String phone =  request.getParameter("phone");
		String pwd = request.getParameter("pwd");
		if (UserDao.checkLogin(phone, pwd) != null) {
			out.write("�ֻ��Ѵ��ڣ�");
		}else{
			UserDao.addPhone(phone, pwd,phone);
		}
	}

	private void emeli(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws IOException {
		String email =  request.getParameter("email");
		String pwd = request.getParameter("pwd");
		if (UserDao.checkLogin(email, pwd) != null) {
			out.write("�����Ѵ��ڣ�");
		}else{
			UserDao.addEmail(email, pwd,email);
		}
		
	}

}