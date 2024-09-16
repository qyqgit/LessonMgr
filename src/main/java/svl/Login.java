package svl;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import obj.Teacher;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String teacherId = request.getParameter("id").trim();
		String teacherPassword = request.getParameter("password").trim();
		if(teacherId.length() !=0 && teacherPassword.length() != 0) {
			Connection conn = (Connection)request.getSession().getAttribute("conn");
			Teacher teacher = new Teacher();
			Teacher.getTeacher(conn, teacher, teacherId);
			if(teacher.getPassword() != null && teacher.getPassword().equals(teacherPassword)) {
				request.getSession().setAttribute("teacher", teacher);
				Cookie ck = new Cookie("TOKEN", request.getSession().getId());
		        ck.setMaxAge(3600 * 24 * 31);
		        ck.setHttpOnly(true);
		        //ck.setSecure(true);
		        Teacher.updateTeacherToken(conn, teacherId, request.getSession().getId());
		        response.addCookie(ck);
			}
		}
		response.sendRedirect("GetStudent");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
