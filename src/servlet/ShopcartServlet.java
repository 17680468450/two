package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.security.DeclareRoles;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.UpdatableResultSet;

import dao.CommodityDao;
import dao.ShopcartDao;
import pojo.Commodity;
import pojo.Shopcart;
import pojo.User;

/**
 * Servlet implementation class ShopcartServlet
 */
@WebServlet("/ShopcartServlet")
public class ShopcartServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String type = request.getParameter("type");
		if ("add".equals(type)) {
			addshopcart(request,response,out);
		}else if ("all".equals(type)) {
			showall(request,response,out);
		}else if ("del".equals(type)) {
			delshopcart(request,response,out);
		}else if ("delarr".equals(type)) {
			delarr(request,response,out);
		}else if ("upd".equals(type)) {
			upd(request,response,out);
		}
		
		
		out.flush();
		out.close();
	}

	private void upd(HttpServletRequest request, HttpServletResponse response, PrintWriter out) {
		int sc_id = Integer.valueOf(request.getParameter("sc_id"));
		int sc_number = Integer.valueOf(request.getParameter("sc_number"));
		int sc_price = Integer.valueOf(request.getParameter("sc_price"));
		Shopcart shopcart = ShopcartDao.checkBySC_id(sc_id);
		shopcart.setSc_number(sc_number);
		shopcart.setSc_price(sc_price);
		if (ShopcartDao.upd(shopcart)) {
			out.write("修改成功");
		} else {
			out.write("修改失败");
		}
	}

	private void delarr(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
		String[] ids = request.getParameterValues("sc_id");
		String[] sc_ids = request.getParameterValues("items[]");
		for(int j=0;j<ids.length;j++){
			for(int i=0;i<sc_ids.length;i++){
				int sc_id = Integer.parseInt(sc_ids[i]);
				if (Integer.valueOf(ids[j])==sc_id) {
					if (!ShopcartDao.del(sc_id)) {
						out.write("<script>"
								+ "alert('网络异常');"
								+ "location.href='ShopcartServlet?type=all';"
								+ "</script>");
					}
				}
			}
		}
		
		showall(request, response, out);
	}

	private void delshopcart(HttpServletRequest request, HttpServletResponse response, PrintWriter out) {
		int s_id = Integer.valueOf(request.getParameter("sc_id"));
		if (ShopcartDao.del(s_id)) {
			out.write("删除成功");
		} else {
			out.write("删除失败");
		}
	}

	private void showall(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
		//获取用户
		User user = (User) request.getSession().getAttribute("users");
		List<Shopcart> arr = ShopcartDao.checkByU_id(user.getU_id());
		request.setAttribute("arr", arr);
        request.getRequestDispatcher("home/shopcart.jsp").forward(request, response);
	}

	private void addshopcart(HttpServletRequest request, HttpServletResponse response, PrintWriter out) {
		//获取用户id
		User user = (User) request.getSession().getAttribute("users");
		//获取商品id
		int s_id = Integer.valueOf(request.getParameter("s_id"));
		//获取购买的商品数量
		int sc_number = Integer.valueOf(request.getParameter("number"));
		//获取购物车中该商品
		Shopcart shopcart = ShopcartDao.checkByS_id(s_id,user.getU_id());
		Commodity shop = CommodityDao.checkone(s_id);
		if (shopcart != null) {
			shopcart.setSc_number(shopcart.getSc_number()+sc_number);
			shopcart.setSc_price(shopcart.getSc_number()*shopcart.getCommodity().getS_price());
			if (ShopcartDao.upd(shopcart)) {
				out.write("添加成功");
			} else {
				out.write("添加失败");
			}
		} else {
			Shopcart shopcart1 = new Shopcart();
			//获取商品总价
			shopcart1.setCommodity(shop);
			shopcart1.setSc_number(sc_number);
			shopcart1.setSc_price(shop.getS_price()*sc_number);
			shopcart1.setU_id(user.getU_id());
			if (ShopcartDao.add(shopcart1)) {
				out.write("添加成功");
			}else {
				out.write("添加失败");
			}
		}
		
	}

}
