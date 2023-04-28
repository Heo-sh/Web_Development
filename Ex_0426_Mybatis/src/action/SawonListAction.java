package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SawonDAO;
import vo.SawonVO;

/**
 * Servlet implementation class SawonListAction
 */
@WebServlet("/sawon_list.do")
public class SawonListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//sawon_list.do?deptno=???
		
		//null값은 Integer.parseInt로 받지 못 한다.
		//why?=> 코드는 위에서 아래로 진행을 하는데 처음 시작하는 페이지가 action이다.
		//		  최초로 시작하면 deptno는 null이 넘어오기 땜누에 int로 형변환 시 에러가 남.
		
		//sawon_list.do
		//sawon_list.do? --> null 아예 오류가 나거나
		
		//sawon_list.do?deptno= --> empty 변수를 담아오지 못 하거나
		
		int deptno = 0;
 		String str_deptno = request.getParameter("deptno");
		
 		if (str_deptno != null && !str_deptno.isEmpty()) { //null이 아니고 비어있지 않아야! if 안으로 들어온다.
 			//정상적으로 값이 넘어왔다면! if 안에서 실제 정수로 바꿔준다.
 			deptno = Integer.parseInt(str_deptno);
 		}
 		
 		System.out.println(str_deptno);
 		
 		List<SawonVO> list = null;
 		
 		if (deptno == 0) {
 			list = SawonDAO.getInstance().select();
 		} else {
 			list = SawonDAO.getInstance().select(deptno); //메서드 오버로드 			
 		}
 		
		
		request.setAttribute("list", list);
		
		RequestDispatcher disp = request.getRequestDispatcher("sawon_list.jsp");
		disp.forward(request, response);
	}

}
