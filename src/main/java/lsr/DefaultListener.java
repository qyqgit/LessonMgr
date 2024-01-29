package lsr;

import java.sql.Connection;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import obj.Database;

/**
 * Application Lifecycle Listener implementation class DefaultListener
 *
 */
@WebListener
public class DefaultListener implements HttpSessionListener {

    /**
     * Default constructor. 
     */
    public DefaultListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    	System.out.println("session create.");
    	Connection conn = Database.getConnection();
    	se.getSession().setAttribute("conn", conn);
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  { 
         // TODO Auto-generated method stub
    	System.out.println("session destroy.");
    	Connection conn = (Connection)se.getSession().getAttribute("conn");
    	Database.closeConnection(conn);
    }
	
}
