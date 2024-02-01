package obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ClassLevel {
	private String id;
	private String name;
	
	
	public ClassLevel() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ClassLevel(String id, String name) {
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
	public static boolean getClassLevelList(Connection conn, ArrayList<ClassLevel> classLevelList) {
		ResultSet rs = null;
        PreparedStatement pstmt = null;
        
		try {
			pstmt = conn.prepareStatement("SELECT * FROM lesson.classlevel");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ClassLevel classLevel = new ClassLevel();
				classLevel.setId(rs.getString("id_class_level"));
				classLevel.setName(rs.getString("name_class_level"));
				classLevelList.add(classLevel);
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
	public static boolean getClassLevelListByStudent(Connection conn, ArrayList<ClassLevel> classLevelList, String studentId) {
		ResultSet rs = null;
        PreparedStatement pstmt = null;
        
		try {
			pstmt = conn.prepareStatement("SELECT * FROM lesson.classlevel WHERE id_student = ?");
			pstmt.setString(1, studentId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ClassLevel classLevel = new ClassLevel();
				classLevel.setId(rs.getString("id_class_level"));
				classLevel.setName(rs.getString("name_class_level"));
				classLevelList.add(classLevel);
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
	public static boolean addClassLevel(Connection conn, String classLeveName, String studentId) {
		PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("INSERT INTO `lesson`.`classlevel` (`name_class_level`, `id_student`) VALUES (?,?)");
            pstmt.setString(1, classLeveName);
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
