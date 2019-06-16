/**
 * �Խ��� �����ϴ� Action
 */
package com.board.action;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.controller.CommandAction;
 
public class ReplydeleteAction implements CommandAction {
 
    public String requestPro(HttpServletRequest request,
 
    HttpServletResponse response) throws Throwable {
    	request.setCharacterEncoding("UTF-8");
    	Class.forName("com.mysql.jdbc.Driver");
    	String url = "jdbc:mysql://localhost/jspdb?serverTimezone=UTC";
    	String dbUser = "root";
    	String dbPass = "038062";
    	int count = Integer.parseInt(request.getParameter("count"));
    	Statement stmt = null;
    	Connection conn = null;
    	try{
    		HttpSession session = request.getSession();
        	
    		if(session.getAttribute("id") == null){
    			return "loginerror.jsp";
    		}
    				
    		conn = DriverManager.getConnection(url,dbUser,dbPass);
    		stmt = conn.createStatement();
    		   			
    			String sql = "DELETE FROM reply WHERE count=" + count;	    			
    			stmt.executeUpdate(sql);	    			
    			
    			stmt.close();
    			conn.close();
    			
    	 	} catch(SQLException e) {
    			System.out.println( e.toString() );
    		} finally{        		
        		if(stmt != null) try{stmt.close();} catch(SQLException ex) {}        		
        		if(conn != null) try{conn.close();} catch(SQLException ex) {}
        	}

    	
 
        return "deletereply.jsp";
 
    }
 
}