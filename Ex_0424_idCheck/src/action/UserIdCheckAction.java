package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import vo.UserVO;

/**
 * Servlet implementation class UserCheckAction
 */
@WebServlet("/check_id.do")
public class UserIdCheckAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//check_id.do?id=aaaa
		
		String id = request.getParameter("id");
		
		UserVO vo = UserDAO.getInstance().selectOne(id);
		
		String res = "no";
		
		if (vo == null) { //ID 중복 조회를 통해 가입이 가능한 경우
			res = "yes";
		}
		
		//JSON형태로 결과 콜백함수로 보내기
		String result = String.format("[{'res' : '%s'}]", res);
		response.getWriter().print(result);
	}

}
