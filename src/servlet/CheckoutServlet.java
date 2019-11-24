package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AddressDao;
import dao.CommodityDao;
import dao.OrderAboutDao;
import dao.OrderTotalDao;
import dao.ShopcartDao;
import pojo.Address;
import pojo.Commodity;
import pojo.OrderAbout;
import pojo.OrderTotal;
import pojo.Shopcart;
import pojo.User;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String type = request.getParameter("type");
		if ("out".equals(type)) {
			Checkout(request,response,out);
		} else if ("outarr".equals(type)) {
			checkoutarr(request,response,out);
		}else if ("pay".equals(type)) {
			pay(request,response,out);
		}
		
		
		out.flush();
		out.close();
	}

	private void pay(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
		String o_bh = request.getParameter("o_bh");
		User user = (User) request.getSession().getAttribute("users");
		OrderTotal orderTotal = OrderTotalDao.checkone(o_bh);
		Address address = AddressDao.checkdef(user.getU_id());
		orderTotal.setA_consigneename(address.getA_consigneename());
		orderTotal.setA_phone(address.getA_phone());
		orderTotal.setA_consigneeaddress(address.getA_consigneeaddress());
		if (!OrderTotalDao.updpay(orderTotal)) {
			out.write("<script>"
					+ "alert('�����쳣');"
					+ "location.href='PayServlet?type=showone&&o_bh'"+o_bh+";"
					+ "</script>");
			return;
		}
		request.setAttribute("ordertotal", orderTotal);
		request.getRequestDispatcher("home/success.jsp").forward(request, response);
	}

	private void checkoutarr(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
		//��ȡ���еĹ��ﳵid
		String[] sc_ids = request.getParameterValues("sc_id");
		//��ȡѡ�еĹ��ﳵid
		String[] ids = request.getParameterValues("items[]");
		for (String string : ids) {
			System.out.println(string);
		}
		//�����������
		String o_bh = new Date().getTime()+"";
		int t_price = 0;
		//���������������
		for(int i=0;i<sc_ids.length;i++){
			for(int j=0;j<ids.length;j++){
				int sc_id = Integer.valueOf(ids[j]);
				//��ѡ�й��ﳵid�����й��ﳵid���бȽ�
				if (Integer.valueOf(sc_ids[i]) == sc_id) {
					//��ȡѡ�еĹ��ﳵ����
					Shopcart shopcart = ShopcartDao.checkBySC_id(sc_id);
					OrderAbout orderAbout = new OrderAbout(
							o_bh,
							shopcart.getCommodity(),
							shopcart.getSc_number(),
							shopcart.getSc_price()
							);
					//��ӹ��ﳵ��Ϣֵ��Ʒ�����
					if (!OrderAboutDao.add(orderAbout)) {
						out.write("<script>"
								+ "alert('�����쳣1');"
								+ "location.href='ShopcartServlet?type=all';"
								+ "</script>");
						return;
					}
					t_price += shopcart.getSc_price();
					//ɾ�����ﳵ����
					if (!ShopcartDao.del(sc_id)) {
						out.write("<script>"
								+ "alert('�����쳣2');"
								+ "location.href='ShopcartServlet?type=all';"
								+ "</script>");
						return;
					}
				}
			}
		}
		//��ȡ��ǰʱ��
		String t_time = new Date().toLocaleString();
		//��ȡ�û�
		User user = (User) request.getSession().getAttribute("users");
		OrderTotal orderTotal = new OrderTotal(
				user.getU_id(),
				o_bh,
				t_price,
				t_time
				);
		if (!OrderTotalDao.add(orderTotal)) {
			out.write("<script>"
					+ "alert('�����쳣3');"
					+ "location.href='ShopcartServlet?type=all';"
					+ "</script>");
			return;
		}
		request.setAttribute("o_bh", o_bh);
		request.setAttribute("type", "showone");
		request.getRequestDispatcher("PayServlet").forward(request, response);
	}

	private void Checkout(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("users");
		int s_id = Integer.valueOf(request.getParameter("s_id"));
		Commodity commodity = CommodityDao.checkone(s_id);
		int number = Integer.valueOf(request.getParameter("number"));
		String o_bh = new Date().getTime()+"";
		int t_price = commodity.getS_price()*number;
		String t_time = new Date().toLocaleString();
		OrderAbout oAbout = new OrderAbout(o_bh, commodity, number, t_price);
		OrderTotal oTotal = new OrderTotal(user.getU_id(), o_bh, t_price, t_time);
		if (!OrderAboutDao.add(oAbout)||!OrderTotalDao.add(oTotal)) {
			out.write("<script>"
					+ "alert('�����쳣');"
					+ "location.href='InformationServlet?s_id="+s_id+"';"
					+ "</script>");
			return;
		}
		request.setAttribute("o_bh", o_bh);
		request.setAttribute("type", "showone");
		request.getRequestDispatcher("PayServlet").forward(request, response);
	}

}
