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

import dao.CommodityDao;
import dao.STopOneDao;
import dao.STopThreeDao;
import dao.STopTwoDao;
import pojo.CategoryInfo;
import pojo.CategoryThreeInfo;
import pojo.CategoryTwoInfo;
import pojo.Commodity;
import pojo.STopOne;
import pojo.STopThree;
import pojo.STopTwo;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String type = request.getParameter("type");
		if (type == null) {
			try {
				showAll(request,response,out);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		out.flush();
		out.close();
	}

	private void showAll(HttpServletRequest request, HttpServletResponse response,PrintWriter out) throws Exception {
		List<STopOne> s_Ones = STopOneDao.checkall();
		List<CategoryInfo> twoInfos = new ArrayList<CategoryInfo>();
		
		for (STopOne sOne : s_Ones) {
			List<STopTwo> sTwos = STopTwoDao.checkById(sOne.getS_one_id());
			List<CategoryTwoInfo> arr_two = new ArrayList<CategoryTwoInfo>();
			for (STopTwo sTwo : sTwos) {
				List<STopThree> sThrees = STopThreeDao.checkById(sTwo.getS_two_id());
				CategoryTwoInfo twoInfo = new CategoryTwoInfo(sTwo, sThrees);
				arr_two.add(twoInfo);
			}
			CategoryInfo info = new CategoryInfo(sOne, arr_two);
			twoInfos.add(info);
		}
		
		//品牌
	    List arr_brand = CommodityDao.checkByBrand();
	    
	    //甜品
	    List<CategoryThreeInfo> arr_cake = new ArrayList<CategoryThreeInfo>();
	    List<STopThree> sThrees = STopThreeDao.checkById(1);
	    for (STopThree sThree : sThrees) {
	    	if (sThree.getS_three_id()==1) {
				continue;
			}
			List<Commodity> commodities = CommodityDao.checksort(sThree.getS_three_id());
			CategoryThreeInfo cThreeInfo = new CategoryThreeInfo(sThree,commodities);
			arr_cake.add(cThreeInfo);
		}
	    
	    //饼干
	    List<CategoryThreeInfo> arr_cuit = new ArrayList<CategoryThreeInfo>();
	    List<STopThree> sThrees1 = STopThreeDao.checkById(3);
	    for (STopThree sThree : sThrees1) {
	    	if (sThree.getS_three_id()==7) {
				continue;
			}
			List<Commodity> commodities = CommodityDao.checksort(sThree.getS_three_id());
			CategoryThreeInfo cThreeInfo = new CategoryThreeInfo(sThree,commodities);
			arr_cuit.add(cThreeInfo);
		}
	    
	    //膨化
	    List<CategoryThreeInfo> arr_chip = new ArrayList<CategoryThreeInfo>();
	    List<STopThree> sThrees2 = STopThreeDao.checkById(4);
	    for (STopThree sThree : sThrees2) {
	    	if (sThree.getS_three_id()==11) {
				continue;
			}
			List<Commodity> commodities = CommodityDao.checksort(sThree.getS_three_id());
			CategoryThreeInfo cThreeInfo = new CategoryThreeInfo(sThree,commodities);
			arr_chip.add(cThreeInfo);
		}
	    
	    request.setAttribute("arr_brand", arr_brand);
		request.setAttribute("arr", twoInfos);
		request.setAttribute("arr_cake", arr_cake);
		request.setAttribute("arr_cuit", arr_cuit);
		request.setAttribute("arr_chip", arr_chip);
		request.getRequestDispatcher("home/home.jsp").forward(request, response);
		
	}

}
