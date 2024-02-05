package obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Record {
	private String id;
	private String idLesson;
	private String idSubject;
	private String date;
	private String idTeacher;
	private String idStudent;
	private String timeStamp;
	private String times;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIdLesson() {
		return idLesson;
	}
	public void setIdLesson(String idLesson) {
		this.idLesson = idLesson;
	}
	
	public String getIdSubject() {
		return idSubject;
	}
	public void setIdSubject(String idSubject) {
		this.idSubject = idSubject;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getIdTeacher() {
		return idTeacher;
	}
	public void setIdTeacher(String idTeacher) {
		this.idTeacher = idTeacher;
	}
	public String getIdStudent() {
		return idStudent;
	}
	public void setIdStudent(String idStudent) {
		this.idStudent = idStudent;
	}
	public String getTimeStamp() {
		return timeStamp;
	}
	public void setTimeStamp(String timeStamp) {
		this.timeStamp = timeStamp;
	}
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	
	public Record(String id, String idLesson, String idSubject, String date, String idTeacher, String idStudent,
			String timeStamp, String times) {
		super();
		this.id = id;
		this.idLesson = idLesson;
		this.idSubject = idSubject;
		this.date = date;
		this.idTeacher = idTeacher;
		this.idStudent = idStudent;
		this.timeStamp = timeStamp;
		this.times = times;
	}
	public Record() {
		// TODO Auto-generated constructor stub
	}
	public static boolean getRecordListByStudent(Connection conn, ArrayList<Record> recordList, String studentId) {
		ResultSet rs = null;
        PreparedStatement pstmt = null;
        
		try {
			pstmt = conn.prepareStatement("SELECT date_record, name_subject, name_lesson, name_student, name_teacher, times_record FROM lesson.record, lesson.lesson, lesson.subject, lesson.teacher, lesson.student WHERE id_student_record = ? AND id_lesson_record = id_lesson AND id_subject_record = id_subject AND id_student_record = id_student AND id_teacher_record = id_teacher;");
			pstmt.setString(1, studentId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Record record = new Record();
				//record.setId(rs.getString("id_record"));
				record.setIdLesson(rs.getString("name_lesson"));
				record.setIdSubject(rs.getString("name_subject"));
				record.setDate(rs.getString("date_record"));
				record.setIdTeacher(rs.getString("name_teacher"));
				record.setIdStudent(rs.getString("name_student"));
				//record.setTimeStamp(rs.getString("timeStamp_record"));
				record.setTimes(rs.getString("times_record"));
				recordList.add(record);
			}
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Database.closeResultSet(rs);
			Database.closePreparedStatement(pstmt);
		}
		return false; 
	}
	public static boolean addRecord(Connection conn, Record myRecord) {
		PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("INSERT INTO `lesson`.`record` (`id_lesson_record`, `id_subject_record`, `date_record`, `id_teacher_record`, `id_student_record`) VALUES (?, ?, ?, ?, ?)");
            pstmt.setString(1, myRecord.idLesson);
            pstmt.setString(2, myRecord.idSubject);
            pstmt.setString(3, myRecord.date);
            pstmt.setString(4, myRecord.idTeacher);
            pstmt.setString(5, myRecord.idStudent);
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            Database.closePreparedStatement(pstmt);
        }
		return false;
		
	}
	public static boolean deleteRecord(Connection conn, String lessonId) {
		PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("DELETE FROM `lesson`.`record` WHERE `id_lesson_record`= ?");
            pstmt.setString(1, lessonId);
            pstmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            Database.closePreparedStatement(pstmt);
        } 
        return false;
	}
}
