package obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Lesson {
	private String id;
	private String name;
	private String subjectId;
	private String isRaw;
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
	public String getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(String lessonId) {
		this.subjectId = lessonId;
	}
	
	
	
	public Lesson(String id, String name, String lessonId) {
		super();
		this.id = id;
		this.name = name;
		this.subjectId = lessonId;
	}
	public static boolean getLessonList(Connection conn, ArrayList<Lesson> classList, String subjectId) {
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("SELECT * FROM lesson.lesson WHERE `subject_id_lesson`= ?");
            pstmt.setString(1, subjectId);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Lesson lesson = new Lesson(
                        rs.getString("id_lesson"),
                        rs.getString("name_lesson"),
                        rs.getString("subject_id_lesson")
                        );
                classList.add(lesson);
            }
            return true;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally {
            Database.closeResultSet(rs);
            Database.closePreparedStatement(pstmt);
        }
        return false;
	}
	
	public static boolean addLesson(Connection conn, String name, String subjectId) {
		PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("INSERT INTO `lesson`.`lesson` (`name_lesson`, `subject_id_lesson`) VALUES (?, ?)");
            pstmt.setString(1, name);
            pstmt.setString(2, subjectId);
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
