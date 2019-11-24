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
					+ "alert('网络异常');"
					+ "location.href='PayServlet?type=showone&&o_bh'"+o_bh+";"
					+ "</script>");
			return;
		}
		request.setAttribute("ordertotal", orderTotal);
		request.getRequestDispatcher("home/success.jsp").forward(request, response);
	}

	private void checkoutarr(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
		//获取所有的购物车id
		String[] sc_ids = request.getParameterValues("sc_id");
		//获取选中的购物车id
		String[] ids = request.getParameterValues("items[]");
		for (String string : ids) {
			System.out.println(string);
		}
		//创建订单编号
		String o_bh = new Date().getTime()+"";
		int t_price = 0;
		//创建订单详情对象
		for(int i=0;i<sc_ids.length;i++){
			for(int j=0;j<ids.length;j++){
				int sc_id = Integer.valueOf(ids[j]);
				//将选中购物车id跟所有购物车id进行比较
				if (Integer.valueOf(sc_ids[i]) == sc_id) {
					//获取选中的购物车对象
					Shopcart shopcart = ShopcartDao.checkBySC_id(sc_id);
					OrderAbout orderAbout = new OrderAbout(
							o_bh,
							shopcart.getCommodity(),
							shopcart.getSc_number(),
							shopcart.getSc_price()
							);
					//添加购物车信息值商品详情表
					if (!OrderAboutDao.add(orderAbout)) {
						out.write("<script>"
								+ "alert('网络异常1');"
								+ "location.href='ShopcartServlet?type=all';"
								+ "</script>");
						return;
					}
					t_price += shopcart.getSc_price();
					//删除购物车数据
					if (!ShopcartDao.del(sc_id)) {
						out.write("<script>"
								+ "alert('网络异常2');"
								+ "location.href='ShopcartServlet?type=all';"
								+ "</script>");
						return;
					}
				}
			}
		}
		//获取当前时间
		String t_time = new Date().toLocaleString();
		//获取用户
		User user = (User) request.getSession().getAttribute("users");
		OrderTotal orderTotal = new OrderTotal(
				user.getU_id(),
				o_bh,
				t_price,
				t_time
				);
		if (!OrderTotalDao.add(orderTotal)) {
			out.write("<script>"
					+ "alert('网络异常3');"
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
					+ "alert('网络异常');"
					+ "location.href='InformationServlet?s_id="+s_id+"';"
					+ "</script>");
			return;
		}
		request.setAttribute("o_bh", o_bh);
		request.setAttribute("type", "showone");
		request.getRequestDispatcher("PayServlet").forward(request, response);
	}

}
