package obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Subject {
	private String id;
	private String name;
	private int cooked;
	private int amount;
	
	public Subject() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Subject(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCooked() {
		return cooked;
	}
	public void setCooked(int cooked) {
		this.cooked = cooked;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public static boolean getSubjectList(Connection conn, ArrayList<Subject> lessonList) {
		ResultSet rs = null;
        PreparedStatement pstmt = null;
        
		try {
			pstmt = conn.prepareStatement("SELECT * FROM lesson.subject");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Subject subject = new Subject();
				subject.setId(rs.getString("id_subject"));
				subject.setName(rs.getString("name_subject"));
				lessonList.add(subject);
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
	public static boolean getSubjectListByStudent(Connection conn, ArrayList<Subject> subjectList, String studentId) {
		ResultSet rs = null;
        PreparedStatement pstmt = null;
        
		try {
			pstmt = conn.prepareStatement("SELECT * FROM lesson.subject WHERE id_student_subject = ?");
			pstmt.setString(1, studentId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Subject subject = new Subject();
				subject.setId(rs.getString("id_subject"));
				subject.setName(rs.getString("name_subject"));
				subject.setCooked(rs.getInt("cooked_subject"));
				subject.setAmount(rs.getInt("amount_subject"));
				subjectList.add(subject);
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
	public static boolean addLesson(Connection conn, String lessonName, String studentId) {
		PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("INSERT INTO `lesson`.`subject` (`name_subject`, `id_student_subject`) VALUES (?,?)");
            pstmt.setString(1, lessonName);
            pstmt.setString(2, studentId);
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
