package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PhotoDAO;
import vo.PhotoVO;

/**
 * Servlet implementation class PhotoListAction
 */

//DB로 접근해서 저장된 데이터들을 가져와야 하기 때문에
//실행은 PhotoListAction에서 해야한다.

@WebServlet("/list.do")
public class PhotoListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DAO로 접근하여 photo전체 목록 조회
		List<PhotoVO> list = PhotoDAO.getInstance().selectList();
		
		//binding
		request.setAttribute("list", list);
		
		//fowarding
		RequestDispatcher disp = request.getRequestDispatcher("photo_list.jsp");
		disp.forward(request, response);
	}

}
