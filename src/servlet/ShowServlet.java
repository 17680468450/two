package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommodityDao;
import dao.FootDao;
import dao.ProductImageDao;
import pojo.Commodity;
import pojo.Foot;
import pojo.ProductImage;
import pojo.User;

/**
 * Servlet implementation class ShowServlet
 */
@WebServlet("/ShowServlet")
public class ShowServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int s_id = Integer.valueOf(request.getParameter("s_id"));
		Commodity shop = CommodityDao.checkone(s_id);
		ProductImage imgs = ProductImageDao.checkByS_id(s_id);
		List<Commodity> arr = CommodityDao.checksort(shop.getsThree().getS_three_id());
		
		User user = (User) request.getSession().getAttribute("users");
		if (user != null) {
			Foot foot1 = FootDao.checkByS_id(s_id,user.getU_id());
			//Ìí¼Ó×ã¼£
			if (foot1==null) {
				Foot foot = new Foot();
				foot.setU_id(user.getU_id());
				foot.setCommodity(shop);
				FootDao.add(foot);
			}
		}
		
		
		
		request.setAttribute("shop", shop);
		request.setAttribute("imgs", imgs);
		request.setAttribute("arr", arr);
		request.getRequestDispatcher("home/introduction.jsp").forward(request, response);
		out.flush();
		out.close();
	}

}
