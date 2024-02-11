package obj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Database {
	private static String USER = "root";
	private static String PASSWORD = "qin123";
	private static String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    private static String DB_URL = "jdbc:mysql://localhost:3306/lesson";
    
    public static Connection getConnection(){
    	Connection conn = null;
        try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(DB_URL,USER,PASSWORD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return conn;
    }
    public static boolean closeConnection(Connection conn) {
    	try {
			if(conn != null)conn.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return false;
    }
    public static boolean closeResultSet(ResultSet rs) {
        try {
            if(rs != null)rs.close();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
        
    }
    public static boolean closePreparedStatement(PreparedStatement pstmt) {
        try {
            if(pstmt != null)pstmt.close();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false; 
    }
}
