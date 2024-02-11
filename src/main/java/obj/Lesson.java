package obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Lesson {
	private String id;
	private String name;
	private String subjectId;
	private String datetime;
	private String familiar;
	
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
	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	
	public String getFamiliar() {
		return familiar;
	}
	public void setFamiliar(String familiar) {
		this.familiar = familiar;
	}
	public Lesson(String id, String name, String subjectId, String datetime) {
		super();
		this.id = id;
		this.name = name;
		this.subjectId = subjectId;
		this.datetime = datetime;
	}
	public Lesson() {
		// TODO Auto-generated constructor stub
	}
	public static boolean getLessonList(Connection conn, ArrayList<Lesson> classList, String subjectId) {
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("SELECT * FROM (SELECT * FROM (SELECT * FROM lesson.lesson WHERE lesson.id_subject_lesson = ?) AS table1 LEFT JOIN lesson.record ON table1.id_lesson = record.id_lesson_record)AS table2 LEFT JOIN (SELECT id_lesson,name_lesson,count(id_lesson) FROM lesson.lesson ,lesson.record WHERE id_lesson = id_lesson_record GROUP BY name_lesson)AS table3 ON table2.name_lesson LIKE table3.name_lesson ORDER BY table2.id_lesson");
            pstmt.setString(1, subjectId);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
            	Lesson lesson = new Lesson();
            	lesson.setId(rs.getString("id_lesson"));
            	lesson.setName(rs.getString("name_lesson"));
            	lesson.setSubjectId(rs.getString("id_subject_lesson"));
            	lesson.setDatetime(rs.getString("date_record"));
            	lesson.setFamiliar(rs.getString("count(id_lesson)"));
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
            pstmt = conn.prepareStatement("INSERT INTO `lesson`.`lesson` (`name_lesson`, `id_subject_lesson`) VALUES (?, ?)");
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
	
	public static boolean addLessonList(Connection conn, String[] names, String subjectId) {
		PreparedStatement pstmt = null;
        try {
    		boolean status = conn.getAutoCommit();
    		conn.setAutoCommit(false);
        	pstmt = conn.prepareStatement("INSERT INTO `lesson`.`lesson` (`name_lesson`, `id_subject_lesson`) VALUES (?, ?)");
        	for(int i = 0; i < names.length; i++) {
                pstmt.setString(1, names[i].trim());
                pstmt.setString(2, subjectId);
                pstmt.addBatch();
        	}

            int[] counts = pstmt.executeBatch();
            conn.commit();
            for(int i : counts) {
            	if(i == 0)
            		conn.rollback();
            }
            conn.setAutoCommit(true);
            conn.setAutoCommit(status);
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
