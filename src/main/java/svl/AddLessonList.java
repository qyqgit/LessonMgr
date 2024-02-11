package svl;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import obj.Lesson;
import obj.Student;

/**
 * Servlet implementation class AddLessonList
 */
@WebServlet("/AddLessonList")
public class AddLessonList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLessonList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nameList = request.getParameter("nameList").trim();
		String lessonNames[] = nameList.split("\n");
		String subjectId = request.getParameter("subjectId");
		String studentId = request.getParameter("studentId");
		Student student = new Student();
		Connection conn = (Connection)request.getSession().getAttribute("conn");
		if(nameList.length() != 0) {
			Lesson.addLessonList(conn, lessonNames, subjectId);
		}
		Student.getStudent(conn, student, studentId);
		request.setAttribute("student", student);
		request.getRequestDispatcher("GetLesson?subjectId=" + subjectId +
				"&studentId=" + studentId).forward(request, response);
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
