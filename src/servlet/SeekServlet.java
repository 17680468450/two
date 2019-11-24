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
import dao.STopThreeDao;
import pojo.Commodity;

/**
 * Servlet implementation class SeekServlet
 */
@WebServlet("/SeekServlet")
public class SeekServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String type = request.getParameter("type");
		if (type == null) {
			showall(request,response,out);
		}else if ("sort".equals(type)) {
			//·ÖÀà
			showsort(request,response,out);
		}else if ("brand".equals(type)) {
			//Æ·ÅÆ
			showbrand(request,response,out);
		}
		
		out.flush();
		out.close();
	}

	private void showbrand(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
		String input = request.getParameter("s_brand");
		List<Commodity> arr = CommodityDao.checkbrand(input);
		int sum = arr.size();
		request.setAttribute("arr", arr);
		request.setAttribute("input", input);
		request.setAttribute("sum", sum);
		request.getRequestDispatcher("home/search.jsp").forward(request, response);
	}

	private void showsort(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
		int s_three_id = Integer.valueOf(request.getParameter("s_three_id"));
		String input = STopThreeDao.checkBythreeId(s_three_id).getS_three_name();
		List<Commodity> arr = CommodityDao.checksort(s_three_id);
		int sum = arr.size();
		request.setAttribute("arr", arr);
		request.setAttribute("input", input);
		request.setAttribute("sum", sum);
		request.getRequestDispatcher("home/search.jsp").forward(request, response);
	}

	//ËÑË÷Ðü¸¡¿ò²éÑ¯
	private void showall(HttpServletRequest request, HttpServletResponse response, PrintWriter out) throws ServletException, IOException {
		String input = request.getParameter("index_none_header_sysc");
		if (input == null) {
			
			List<Commodity> arr = CommodityDao.checkall();
			int sum = arr.size();
			request.setAttribute("arr", arr);
			request.setAttribute("input", input);
			request.setAttribute("sum", sum);
			request.getRequestDispatcher("home/search.jsp").forward(request, response);
		}else {
			List<Commodity> arr = CommodityDao.checklike(input);
			int sum = arr.size();
			request.setAttribute("arr", arr);
			request.setAttribute("input", input);
			request.setAttribute("sum", sum);
			request.getRequestDispatcher("home/search.jsp").forward(request, response);
		}
	}

}
