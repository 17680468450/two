package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AddressDao;
import dao.OrderAboutDao;
import dao.OrderTotalDao;
import pojo.Address;
import pojo.OrderAbout;
import pojo.OrderAll;
import pojo.OrderTotal;
import pojo.User;

/**
 * Servlet implementation class PayServlet
 */
@WebServlet("/PayServlet")
public class PayServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String type = (String) request.getAttribute("type");
		if ("showone".equals(type)) {
			showone(request,response,out);
		}else if ("pay".equals(type)) {
			showall(request, response, out);
		}
		
		
		
		out.flush();
		out.close();
	}

	private void showall(HttpServletRequest request, HttpServletResponse response, PrintWriter out) {
		
	}

	private void showone(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
		String o_bh =  request.getAttribute("o_bh")+"";
		OrderTotal oTotal = OrderTotalDao.checkone(o_bh);
		List<OrderAbout> oAbouts = OrderAboutDao.checkByO_bh(o_bh);
		OrderAll orderAll = new OrderAll(oTotal, oAbouts);
		//查寻地址
		User user = (User)request.getSession().getAttribute("users");
		
		//查询默认地址
		Address address = AddressDao.checkdef(user.getU_id());
		request.setAttribute("orderall", orderAll);
		request.setAttribute("address", address);
		request.getRequestDispatcher("home/pay.jsp").forward(request, response);
		
	}

}
