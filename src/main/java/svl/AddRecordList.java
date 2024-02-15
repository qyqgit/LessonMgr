package svl;

import java.io.IOException;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import obj.Lesson;
import obj.Record;
import obj.Student;
import obj.Teacher;

/**
 * Servlet implementation class AddRecordList
 */
@WebServlet("/AddRecordList")
public class AddRecordList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRecordList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Student student = new Student();
		String recordString = request.getParameter("recordList");
		String[] records = recordString.split("\n");
		String subjectId = request.getParameter("subjectId");
		String studentId = request.getParameter("studentId");
		String teacherId = ((Teacher)request.getSession().getAttribute("teacher")).getId();
		Connection conn = (Connection)request.getSession().getAttribute("conn");
		if(recordString.length() != 0) {
			ArrayList<Record> recordList = new ArrayList<Record>();
			String year = "1970";
			for(int i = 0; i < records.length; i++) {
            	String recordRawString = records[i].trim();
            	Pattern dateYearPat = Pattern.compile("\\d{1,4}\\.\\d{1,2}.\\d{1,2}");
        		Pattern datePat = Pattern.compile("\\d{1,2}\\.\\d{1,2}");
            	Pattern namePat = Pattern.compile("[\u4E00-\u9FA5A-Za-z]+");
            	Matcher matcherDateYear = dateYearPat.matcher(recordRawString);
            	Matcher matcherDate =datePat.matcher(recordRawString);
            	Matcher matcherName = namePat.matcher(recordRawString);
            	String dateFormat = "";
            	String nameRecord = "";
            	if(matcherDateYear.find()) {
            		String dateYearRecord = matcherDateYear.group(0);
            		String[] dates = dateYearRecord.split("\\.");
        			year = dates[0];
        			String month = dates[1];
        			String day = dates[2];
        			Calendar c = Calendar.getInstance();
        			c.set(Integer.parseInt(year), Integer.parseInt(month) - 1, Integer.parseInt(day));
        			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        			dateFormat = sdf.format(c.getTime());

            	}else if(matcherDate.find()) {
            		String dateRecord = matcherDate.group(0);
            		String[] dates = dateRecord.split("\\.");
        			String month = dates[0];
        			String day = dates[1];
        			Calendar c = Calendar.getInstance();
        			c.set(Integer.parseInt(year), Integer.parseInt(month) - 1, Integer.parseInt(day));
        			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        			dateFormat = sdf.format(c.getTime());

            	}
            	if(matcherName.find()) {
            		nameRecord = matcherName.group(0);
            		String lessonId = Lesson.getLessonIDByLessonNameSubjectID(conn, nameRecord, subjectId);
                	if(lessonId.length() != 0 && dateFormat.length() != 0 && Record.haveRecord(conn, lessonId) == false) {
                		Record record = new Record();
                		record.setIdLesson(lessonId);
                		record.setIdSubject(subjectId);
                		record.setDate(dateFormat);
                		record.setIdTeacher(teacherId);
                		record.setIdStudent(studentId);
                        recordList.add(record);
                        records[i] = null;
                	}
            	}
            }
			Record.addRecordList(conn, recordList);
			
		}
		Student.getStudent(conn, student, studentId);
		request.setAttribute("student", student);
		request.setAttribute("records", records);
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
