package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AddressDao;
import pojo.Address;
import pojo.User;

/**
 * Servlet implementation class AddressServlet
 */
@WebServlet("/AddressServlet")
public class AddressServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
//		��ȡ�û�id
		User user = (User)request.getSession().getAttribute("users");
		int u_id = user.getU_id();
//		��ȡ��Ϣ
		Address Address = new Address();
//		�ջ���
		String a_consigneename = request.getParameter("a_consigneename");
//		�ֻ�����
		String a_phone = request.getParameter("a_phone");
//		ʡ
		String province = request.getParameter("province");
//		��
		String city = request.getParameter("city");
//		��
		String area = request.getParameter("town");
//		��ϸ��ַ
		String a_consigneeaddress = request.getParameter("a_consigneeaddress");
//		��ӵ�address����
		Address.setU_id(u_id);
		Address.setA_consigneename(a_consigneename);
		Address.setA_phone(a_phone);
		Address.setA_consigneeaddress(province+" "+city+" "+area+" "+a_consigneeaddress);
//		��ӵ����ݿ�
		
//		�жϵ�ǰid���ж�������ַ
		int number = AddressDao.name(u_id);
		if (number == 0) {
			if(AddressDao.addfirst(Address)){
				out.write("<script>"
						+ "alert('��ӳɹ�');"
						+ "location.href='QueryAddressServlet';"
						+ "</script>");
			}else {
				out.write("<script>"
						+ "alert('���ʧ��');"
						+ "location.href='QueryAddressServlet';"
						+ "</script>");
			}
		}else if(number < 3){
			if(AddressDao.add(Address)){
				out.write("<script>"
						+ "alert('��ӳɹ�');"
						+ "location.href='QueryAddressServlet';"
						+ "</script>");
			}else {
				out.write("<script>"
						+ "alert('���ʧ��');"
						+ "location.href='QueryAddressServlet';"
						+ "</script>");
			}
		}else {
			out.write("<script>"
					+ "alert('��ַ�Ե�������');"
					+ "location.href='QueryAddressServlet';"
					+ "</script>");
		}
		
		out.flush();
		out.close();
	}

}
