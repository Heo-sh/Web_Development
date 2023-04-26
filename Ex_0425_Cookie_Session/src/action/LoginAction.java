package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		//id가 틀리면 id가 틀렸다
		//pw가 틀리면 pw가 틀렸다 --> 이렇게 구분지어서 알려주는 게 좋다.
		//전달받은 id의 값으로 DB에 접근하여 값이 있으면 vo에 pw와 name을 전달하여 다시 login.do로 가져온다.
		//그렇게 하여 밑에 있는 코드들을 가지고 id 따로, pw 따로 확인이 가능하게끔 한다.
		
		MemberVO vo = MemberDAO.getInstance().selectOne(id);
		
		String param = "";
		String resultStr = "";
		
		//vo가 null인 경우 id 자체가 DB에 존재하지 않는다는 의미
		if (vo == null) {
			//System.out.println("들어온다.");
			param = "no_id";
			resultStr = String.format("[{'param' : '%s'}]", param);
			response.getWriter().print(resultStr);
			return;
		}
		
		//내가 입력한 비밀번호와 DB에서 넘어온 비밀번호가 일치하지 않을 때
		if (!vo.getPw().equals(pw)) {
			param = "no_pw";
			resultStr = String.format("[{'param' : '%s'}]", param);
			response.getWriter().print(resultStr);
			return;
		}
		
		//아이디와 비밀번호 체크에 문제가 없다면 세션에 바인딩을 한다.
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(60*60*10); // 10분
		session.setAttribute("vo", vo);
		//session은 어느 jsp든 따라가기 때문에 포워딩을 따로 해줄 필요 X
		
		//로그인 성공한 경우
		param = "clear";
		resultStr = String.format("[{'param' : '%s'}]", param);
		response.getWriter().print(resultStr);
	}

}
