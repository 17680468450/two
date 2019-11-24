package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FootDao;
import pojo.Foot;
import pojo.User;

/**
 * Servlet implementation class FootServlet
 */
@WebServlet("/FootServlet")
public class FootServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		User user = (User) request.getSession().getAttribute("users");
		List<Foot> arr = FootDao.checkall(user.getU_id());
		
		request.setAttribute("arr", arr);
		request.getRequestDispatcher("person/foot.jsp").forward(request, response);
		
		out.flush();
		out.close();
	}

}
