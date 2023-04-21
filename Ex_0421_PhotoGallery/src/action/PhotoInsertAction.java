package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PhotoDAO;
import vo.PhotoVO;

/**
 * Servlet implementation class PhotoInsertAction
 */
@WebServlet("/insert.do")
public class PhotoInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// insert.do?title=aaaa&pwd=1111&photo=$#%^#^
		
		//절대경로 가져오기
		String web_path = "/upload"; //같은 이름이더라도 다른 프로젝트라면 절대경로의 위치도 다르다.
		ServletContext application = request.getServletContext();
		String path = application.getRealPath(web_path);
		System.out.println(path);
		
		//최대 업로드 용량
		int max_size = 1024 * 1024 * 100; //100mb
		
		//절대경로로 file 저장하기
		MultipartRequest mr = new MultipartRequest(request,
												   path,
												   max_size,
												   "utf-8",
												   new DefaultFileRenamePolicy()); //MultipartRequest mr
		
		//파일 이름 가져오기
		String filename = "";
		File f = mr.getFile("photo"); //insert_form.jsp의 name속성의 value
		
		if (f != null) {
			filename = f.getName();
		}
		
		//파일형식 이외의 일반 파라미터 수신하기
		String title = request.getParameter("title");
		String pwd = request.getParameter("pwd");
		String ip = request.getRemoteAddr(); //ip얻어오기
		
		PhotoVO vo = new PhotoVO();
		vo.setTitle(title);
		vo.setPwd(pwd);
		vo.setIp(ip);
		vo.setFilename(filename);
		
		//DB에 보내기
		int res = PhotoDAO.getInstance().insert(vo);
		
		if (res > 0) {
			response.sendRedirect("list.do");
		}
	}
}



















