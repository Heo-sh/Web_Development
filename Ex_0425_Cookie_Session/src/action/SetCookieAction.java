package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SetCookieAction
 */
@WebServlet("/cookie.do")
public class SetCookieAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//보안이 취약해 이렇게 보내지 않는다.
		//request.getParameter("id");
		//Cookie cookie = new Cookie("id", "id");
		
		Cookie cookie = new Cookie("param", "asdf");
		
		//쿠키 유효시간 설정
		//- 초단위로 설정을 해야 한다.
		//- 직접 연산 후 대입해도 상관은 X
		//- 대신 아래처럼 대입하는 게 유지 및 보수에는 편하다.
		cookie.setMaxAge(60*60*24*7); //60*60*24*7: 일주일
		
		//쿠키의 삭제
		//- 별도의 삭제 기능은 없으니 유효기간을 0으로 설정
		//- 유효기간이 끝난 쿠키는 새로 발급을 받아야 한다.
		//cookie.setMaxAge(0);
		
		response.addCookie(cookie);
		
		//모든 쿠키를 쿠키 배열로 반환
		Cookie[] cookies = request.getCookies();
		
		for (Cookie cookie1 : cookies) {
			System.out.println("쿠키 이름: " + cookie1.getName());
			System.out.println("쿠키 내용: " + cookie1.getValue());
			System.out.println("--------------------------");
		}
		
		response.sendRedirect("ex01_Cookie.jsp");
	}

}
