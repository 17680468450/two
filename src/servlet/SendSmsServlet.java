package servlet;
//手机验证码服务器
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.GetMessageCode;

@WebServlet("/SendSmsServlet")
public class SendSmsServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		//接收页面传过来的手机号码
		String phone = request.getParameter("phone");
		
		//根据获取到的手机号码发送号码
		String code = GetMessageCode.getCode(phone);
		out.write(code);
		
		out.flush();
		out.close();
	}

}