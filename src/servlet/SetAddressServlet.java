package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.AddressDao;
import pojo.Address;
import pojo.User;

/**
 * Servlet implementation class SetAddressServlet
 */
@WebServlet("/SetAddressServlet")
public class SetAddressServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String type = request.getParameter("type");
		if ("setdef".equals(type)) {
			setdef(request,response,out);
		} else if ("del".equals(type)) {
			del(request,response,out);
		}
		
		out.flush();
		out.close();
	}
	private void del(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws IOException {
		int a_id = Integer.valueOf(request.getParameter("a_id"));
		User user = (User) request.getSession().getAttribute("users");
		Address address = AddressDao.queryAll(a_id);
		if (address.getA_status() == 1) {
			if (AddressDao.del(a_id)) {
				ArrayList<Address> addresses = (ArrayList<Address>) AddressDao.queryList(user.getU_id());
				if (addresses.size()>0) {
					addresses.get(0).setA_status(1);
					AddressDao.update1(addresses.get(0));
				}
				out.write("<script>"
						+ "location.href='QueryAddressServlet';"
						+ "</script>");
			}
		}else {
			if (!AddressDao.del(a_id)) {
				out.write("<script>"
						+ "alert('修改失败');"
						+ "location.href='QueryAddressServlet';"
						+ "</script>");
			}
		}
		
	}
	private void setdef(HttpServletRequest request, HttpServletResponse response, PrintWriter out) {
		int a_id = Integer.valueOf(request.getParameter("a_id"));
		User user = (User) request.getSession().getAttribute("users");
		//获取默认地址
		Address def_address = AddressDao.checkdef(user.getU_id());
		if (def_address != null) {
			Address address = AddressDao.queryAll(a_id);
			address.setA_status(1);
			def_address.setA_status(0);
			if (AddressDao.update1(address)&&AddressDao.update1(def_address)) {
				out.write("<script>"
						+ "location.href='QueryAddressServlet';"
						+ "</script>");
			} else {
				out.write("<script>"
						+ "alert('修改失败');"
						+ "location.href='QueryAddressServlet';"
						+ "</script>");
			}
		}else {
			Address address = AddressDao.queryAll(a_id);
			address.setA_status(1);
			if (AddressDao.update1(address)) {
				out.write("<script>"
						+ "location.href='QueryAddressServlet';"
						+ "</script>");
			} else {
				out.write("<script>"
						+ "alert('修改失败');"
						+ "location.href='QueryAddressServlet';"
						+ "</script>");
			}
		}
		
	}

}
