package obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Teacher {
	private String id;
	private String name;
	private String password;
	private String token;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public Teacher(String id, String name, String password, String token) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.token = token;
	}
	public Teacher() {
		// TODO Auto-generated constructor stub
	}
	public static boolean getTeacher(Connection conn, Teacher teacher, String teacherId) {
		ResultSet rs = null;
        PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM lesson.teacher WHERE id_teacher= ?");
			pstmt.setString(1, teacherId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				teacher.setId(rs.getString("id_teacher"));
				teacher.setName(rs.getString("name_teacher"));
				teacher.setPassword(rs.getString("password_teacher"));
				teacher.setToken(rs.getString("token_teacher"));
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
	public static boolean getTeacherByToken(Connection conn, Teacher teacher, String token) {
		ResultSet rs = null;
        PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM lesson.teacher WHERE token_teacher= ?");
			pstmt.setString(1, token);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				teacher.setId(rs.getString("id_teacher"));
				teacher.setName(rs.getString("name_teacher"));
				teacher.setPassword(rs.getString("password_teacher"));
				teacher.setToken(rs.getString("token_teacher"));
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			Database.closeResultSet(rs);
			Database.closePreparedStatement(pstmt);
		}
		return false;
	}
	public static boolean updateTeacherToken(Connection conn, String teacherId, String token) {
		PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("UPDATE `lesson`.`teacher` SET `token_teacher` = ? WHERE (`id_teacher` = ?);");
            pstmt.setString(1, token);
            pstmt.setString(2, teacherId);
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            Database.closePreparedStatement(pstmt);
        }
		return false;
	}
}
