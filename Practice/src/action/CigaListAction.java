package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CigaDAO;
import vo.CigaVO;

/**
 * Servlet implementation class CigaListAction
 */
@WebServlet("/cigalist.do")
public class CigaListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<CigaVO> list = CigaDAO.getInstance().select();
		
		request.setAttribute("list", list);
		RequestDispatcher disp = request.getRequestDispatcher("cigalist.jsp");
		
		disp.forward(request, response);
	}

}
