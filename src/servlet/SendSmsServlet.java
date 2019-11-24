package servlet;
//�ֻ���֤�������
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
		//����ҳ�洫�������ֻ�����
		String phone = request.getParameter("phone");
		
		//���ݻ�ȡ�����ֻ����뷢�ͺ���
		String code = GetMessageCode.getCode(phone);
		out.write(code);
		
		out.flush();
		out.close();
	}

}