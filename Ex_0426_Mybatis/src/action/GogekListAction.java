package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GogekDAO;
import vo.GogekVO;

/**
 * Servlet implementation class GogekListAction
 */
@WebServlet("/gogek_list.do")
public class GogekListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = "all";
		
		String str_search = request.getParameter("search");
		
		//정상적으로 값이 들어온 경우
		if (str_search != null && !str_search.isEmpty()) {
			search = str_search; 
		}
		
		List<GogekVO> list = null;
		
		if (search.equalsIgnoreCase("all")) { //equalsIgnoreCase: 대소문자롤 가리지 않음.
 			list = GogekDAO.getInstance().select();			
		} else {
			list = GogekDAO.getInstance().select(search);						
		}
		
		
		//바인딩
		request.setAttribute("list", list);
		RequestDispatcher disp = request.getRequestDispatcher("gogek_list.jsp");
		
		//포워딩		
		disp.forward(request, response);
	}

}
