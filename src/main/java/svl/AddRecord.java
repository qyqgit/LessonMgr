package svl;

import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import obj.Record;
import obj.Student;
import obj.Teacher;

/**
 * Servlet implementation class AddRecord
 */
@WebServlet("/AddRecord")
public class AddRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRecord() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Student student = new Student();
		String date = request.getParameter("date_record");
		String time = request.getParameter("time_record");
		String subjectId = request.getParameter("subjectId");
		String studentId = request.getParameter("studentId");
		Connection conn = (Connection)request.getSession().getAttribute("conn");
		if(date.length() != 0 && time.length() != 0) {
			String lessonId = request.getParameter("lessonId");
			String teacherId = ((Teacher)request.getSession().getAttribute("teacher")).getId();
			Record myRecord = new Record();
			myRecord.setIdLesson(lessonId);
			myRecord.setDate(date + " " + time);
			myRecord.setIdTeacher(teacherId);
			myRecord.setIdStudent(studentId);
			myRecord.setIdSubject(subjectId);
			Record.addRecord(conn, myRecord);
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
