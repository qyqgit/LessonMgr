package lsr;

import java.sql.Connection;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import obj.Teacher;

/**
 * Application Lifecycle Listener implementation class CookieListener
 *
 */
@WebListener
public class CookieListener implements ServletRequestListener {

    /**
     * Default constructor. 
     */
    public CookieListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletRequestListener#requestDestroyed(ServletRequestEvent)
     */
    public void requestDestroyed(ServletRequestEvent sre)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletRequestListener#requestInitialized(ServletRequestEvent)
     */
    public void requestInitialized(ServletRequestEvent sre)  { 
         // TODO Auto-generated method stub
    	HttpServletRequest request = (HttpServletRequest)sre.getServletRequest();
    	Connection conn = (Connection)request.getSession().getAttribute("conn");
    	Teacher teacher = (Teacher)request.getSession().getAttribute("teacher");
        if(teacher == null) {
        	Cookie[] cookies = request.getCookies();
        	if(cookies != null) {
                for(Cookie cookie : cookies) {
                    if(cookie.getName().equalsIgnoreCase("TOKEN")) {
                    	teacher = new Teacher();
                    	if(Teacher.getTeacherByToken(conn, teacher, cookie.getValue())) {
                    		request.getSession().setAttribute("teacher", teacher);
                    	}
                    }
                }
            }
        }
    }
	
}
