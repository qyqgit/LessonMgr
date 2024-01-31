package obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class Student {
	private String id;
	private String name;
	private String birthday;
	private String sex;
	private String date;
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
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public Student(String id, String name, String birthday, String sex, String date) {
		super();
		this.id = id;
		this.name = name;
		this.birthday = birthday;
		this.sex = sex;
		this.date = date;
	}
	public static boolean getStudentList(Connection conn, ArrayList<Student> studentList) {
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("SELECT * FROM lesson.student");
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Student student = new Student(
                        rs.getString("id_student"),
                        rs.getString("name_student"),
                        rs.getString("birthday_student"),
                        rs.getString("sex"),
                        rs.getString("date")
                        );
                studentList.add(student);
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
}
