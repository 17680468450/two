package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AddressDao;
import pojo.Address;
import pojo.User;

/**
 * Servlet implementation class QueryAddressServlet
 */
@WebServlet("/QueryAddressServlet")
public class QueryAddressServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		User user = (User)request.getSession().getAttribute("users");
		int u_id = user.getU_id();
//		≤È—Øµÿ÷∑
		List<Address> addresses = AddressDao.queryList(u_id);
		request.setAttribute("arr", addresses);
		request.getRequestDispatcher("person/address.jsp").forward(request, response);
	}

}
