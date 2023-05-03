package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardViewAction
 */
@WebServlet("/view.do")
public class BoardViewAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//view.do?idx=???
		response.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		//상세보기, 조회수 증가를 위해 DB에 두번 접근하기 위해 DAO를 미리 생성
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardVO vo = dao.selectOne(idx);
		
		//조회 수 조작 방지
		HttpSession session = request.getSession();
		
		//session에 set을 해준 적이 없기에
		//get을 해도 null값을 반환할 것이다.
		String show = (String)session.getAttribute("show");
		
		if (show == null) {
			int res = dao.update_readhit(idx);
			session.setAttribute("show", "0"); //session에 뭘 저장했는 지는 중요 X, 들어있다는 게 중요함
		} 
		
		
		request.setAttribute("vo", vo);
		
		RequestDispatcher disp = request.getRequestDispatcher("board_view.jsp");
		disp.forward(request, response);
	}
}
