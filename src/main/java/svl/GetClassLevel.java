package svl;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import obj.ClassLevel;

/**
 * Servlet implementation class GetClassLevel
 */
@WebServlet("/GetClassLevel")
public class GetClassLevel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetClassLevel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = (Connection)request.getSession().getAttribute("conn");
		ArrayList<ClassLevel> classLevelList = new ArrayList<ClassLevel>();
		//ClassLevel.getClassLevelList(conn, classLevelList);
		//request.setAttribute("classLevelList", classLevelList);
		//request.getRequestDispatcher("ClassLevel.jsp").forward(request, response);
		String studentId = request.getParameter("studentId");
		ClassLevel.getClassLevelListByStudent(conn, classLevelList, studentId);
		request.setAttribute("classLevelList", classLevelList);
		request.getRequestDispatcher("Student.jsp").forward(request, response);
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
