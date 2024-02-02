package obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Record {
	private String id;
	private String idLesson;
	private String date;
	private String idTeacher;
	private String idStudent;
	private String timeStamp;
	
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
	
	public Record(String idLesson, String date, String idTeacher, String idStudent) {
		super();
		this.idLesson = idLesson;
		this.date = date;
		this.idTeacher = idTeacher;
		this.idStudent = idStudent;
	}
	public Record() {
		// TODO Auto-generated constructor stub
	}
	public static boolean getRecordList(Connection conn, ArrayList<Record> recordList) {
		ResultSet rs = null;
        PreparedStatement pstmt = null;
        
		try {
			pstmt = conn.prepareStatement("SELECT * FROM lesson.record");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Record record = new Record();
				record.setId(rs.getString("id_record"));
				record.setIdLesson(rs.getString("id_lesson"));
				record.setDate(rs.getString("date_record"));
				record.setIdTeacher(rs.getString("id_teacher"));
				record.setIdStudent(rs.getString("id_student"));
				record.setTimeStamp(rs.getString("timeStamp"));
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
            pstmt = conn.prepareStatement("INSERT INTO `lesson`.`record` (`id_lesson`, `date_record`, `id_teacher`, `id_student`) VALUES (?, ?, ?, ?)");
            pstmt.setString(1, myRecord.idLesson);
            pstmt.setString(2, myRecord.date);
            pstmt.setString(3, myRecord.idTeacher);
            pstmt.setString(4, myRecord.idStudent);
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
	
}
