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
		
//		获取用户id
		User user = (User)request.getSession().getAttribute("users");
		int u_id = user.getU_id();
//		获取信息
		Address Address = new Address();
//		收货人
		String a_consigneename = request.getParameter("a_consigneename");
//		手机号码
		String a_phone = request.getParameter("a_phone");
//		省
		String province = request.getParameter("province");
//		市
		String city = request.getParameter("city");
//		区
		String area = request.getParameter("town");
//		详细地址
		String a_consigneeaddress = request.getParameter("a_consigneeaddress");
//		添加到address对象
		Address.setU_id(u_id);
		Address.setA_consigneename(a_consigneename);
		Address.setA_phone(a_phone);
		Address.setA_consigneeaddress(province+" "+city+" "+area+" "+a_consigneeaddress);
//		添加到数据库
		
//		判断当前id已有多少条地址
		int number = AddressDao.name(u_id);
		if (number == 0) {
			if(AddressDao.addfirst(Address)){
				out.write("<script>"
						+ "alert('添加成功');"
						+ "location.href='QueryAddressServlet';"
						+ "</script>");
			}else {
				out.write("<script>"
						+ "alert('添加失败');"
						+ "location.href='QueryAddressServlet';"
						+ "</script>");
			}
		}else if(number < 3){
			if(AddressDao.add(Address)){
				out.write("<script>"
						+ "alert('添加成功');"
						+ "location.href='QueryAddressServlet';"
						+ "</script>");
			}else {
				out.write("<script>"
						+ "alert('添加失败');"
						+ "location.href='QueryAddressServlet';"
						+ "</script>");
			}
		}else {
			out.write("<script>"
					+ "alert('地址以到达上限');"
					+ "location.href='QueryAddressServlet';"
					+ "</script>");
		}
		
		out.flush();
		out.close();
	}

}
