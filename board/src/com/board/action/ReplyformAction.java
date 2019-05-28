/**
 * �Խ��� ������ ���� ǥ���ϴ� Action
 */
package com.board.action;
 
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.beans.reply;
import com.board.controller.CommandAction;
 
public class ReplyformAction implements CommandAction {
 
    public String requestPro(HttpServletRequest request,
 
    HttpServletResponse response) throws Throwable {
    	System.out.println("in");
    	request.setCharacterEncoding("UTF-8");
    	Class.forName("com.mysql.jdbc.Driver");
    	String url = "jdbc:mysql://localhost/jspdb?serverTimezone=UTC";
    	String dbUser = "root";
    	String dbPass = "0714";
    	Connection conn = null;
    	Statement stmt = null;    	
    	ResultSet rs = null;
    	String subject = request.getParameter("subject");  
    	String subjects = URLDecoder.decode(subject,"UTF-8");
    	
    		try{
    			
    			HttpSession session = request.getSession();
    			request.setCharacterEncoding("UTF-8");
        		if(session.getAttribute("id") == null){
        			return "loginerror.jsp";
        		}
    			
    			
        		 	
    			
    			conn = DriverManager.getConnection(url,dbUser,dbPass);    		
    			String query = "select * from reply where subject ='"+subjects+"'order by boarddate desc";
				stmt = conn.createStatement();
    			
    			rs = stmt.executeQuery(query);
				ArrayList<reply> Replylist = new ArrayList<reply>();    		
	    		
	    		while(rs.next()){
	    			reply article = new reply();
	    			article.setcount(rs.getInt("count"));
	    			article.setSubject(rs.getString("subject"));
	    			article.setTitle(rs.getString("title"));
	    			article.setContent(rs.getString("content"));
	    			article.setId(rs.getString("id"));
	    			article.setEmail(rs.getString("email"));
	    			article.setBoarddate(rs.getString("boarddate"));
	    			
	    			Replylist.add(article);
	    		 
	    		}
    			
    			if(Replylist.size()>0) {
	    		request.setAttribute("Replylist",Replylist);
	    		}
    			
	    		/*
	    		for(int i = 0 ; i <Replylist.size() ; i++){

	    			reply tmp = Replylist.get(i);

                    	System.out.println(tmp.getEmail() + "\t" + tmp.getTitle() + "\t" + tmp.getId() + "\t");

	    		}
	    		*/
	    		
	    			stmt.close();
    			conn.close();
    			rs.close();
    		 
     } catch(SQLException e) {
    	System.out.println( e.toString() );
    	
    } finally{
    	if(rs != null) try{rs.close();} catch(SQLException ex){}
    	if(stmt != null) try{stmt.close();} catch(SQLException ex){}			
		if(conn != null) try{conn.close();} catch(SQLException ex){}
		}
    	
 
        return "replylist.jsp";
 
    }
 
}