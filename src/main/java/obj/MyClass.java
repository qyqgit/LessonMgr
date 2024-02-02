package obj;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MyClass {
	private String id;
	private String name;
	private String classLevelId;
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
	public String getClassLevelId() {
		return classLevelId;
	}
	public void setClassLevelId(String classLevelId) {
		this.classLevelId = classLevelId;
	}
	
	
	
	public MyClass(String id, String name, String classLevelId) {
		super();
		this.id = id;
		this.name = name;
		this.classLevelId = classLevelId;
	}
	public static boolean getClassList(Connection conn, ArrayList<MyClass> classList, String classLevelId) {
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement("SELECT * FROM lesson.class WHERE `level_id_class`= ?");
            pstmt.setString(1, classLevelId);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                MyClass myClass = new MyClass(
                        rs.getString("id_class"),
                        rs.getString("name_class"),
                        rs.getString("level_id_class")
                        );
                classList.add(myClass);
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
